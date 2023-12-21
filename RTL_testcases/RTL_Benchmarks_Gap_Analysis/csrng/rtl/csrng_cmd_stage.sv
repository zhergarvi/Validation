// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Description: csrng command staging module
//

module csrng_cmd_stage import csrng_pkg::*; #(
  parameter int CmdFifoWidth = 32,
  parameter int CmdFifoDepth = 16,
  parameter int StateId = 4
) (
  input logic                        clk_i,
  input logic                        rst_ni,
  // command in
  input logic                        cs_enable_i,
  input logic                        cmd_stage_vld_i,
  input logic [StateId-1:0]          cmd_stage_shid_i,
  input logic [CmdFifoWidth-1:0]     cmd_stage_bus_i,
  output logic                       cmd_stage_rdy_o,
  // command to arbiter
  output logic                       cmd_arb_req_o,
  output logic                       cmd_arb_sop_o,
  output logic                       cmd_arb_mop_o,
  output logic                       cmd_arb_eop_o,
  input logic                        cmd_arb_gnt_i,
  output logic [CmdFifoWidth-1:0]    cmd_arb_bus_o,
  // ack from core
  input logic                        cmd_ack_i,
  input logic                        cmd_ack_sts_i,
  // ack to app i/f
  output logic                       cmd_stage_ack_o,
  output logic                       cmd_stage_ack_sts_o,
  // genbits from core
  input logic                        genbits_vld_i,
  input logic [127:0]                genbits_bus_i,
  input logic                        genbits_fips_i,
  // genbits to app i/f
  output logic                       genbits_vld_o,
  input logic                        genbits_rdy_i,
  output logic [127:0]               genbits_bus_o,
  output logic                       genbits_fips_o,
  // error indication
  output logic [2:0]                 cmd_stage_sfifo_cmd_err_o,
  output logic [2:0]                 cmd_stage_sfifo_genbits_err_o,
  output logic                       cmd_gen_cnt_err_o,
  output logic                       cmd_stage_sm_err_o
);

  localparam int GenBitsFifoWidth = 1+128;
  localparam int GenBitsFifoDepth = 1;
  localparam int GenBitsCntrWidth = 19;

  // signals
  // command fifo
  logic [CmdFifoWidth-1:0] sfifo_cmd_rdata;
  logic [$clog2(CmdFifoDepth):0] sfifo_cmd_depth;
  logic                    sfifo_cmd_push;
  logic [CmdFifoWidth-1:0] sfifo_cmd_wdata;
  logic                    sfifo_cmd_pop;
  logic [2:0]              sfifo_cmd_err;
  logic                    sfifo_cmd_full;
  logic                    sfifo_cmd_not_empty;

  // genbits fifo
  logic [GenBitsFifoWidth-1:0] sfifo_genbits_rdata;
  logic                        sfifo_genbits_push;
  logic [GenBitsFifoWidth-1:0] sfifo_genbits_wdata;
  logic                        sfifo_genbits_pop;
  logic [2:0]                  sfifo_genbits_err;
  logic                        sfifo_genbits_full;
  logic                        sfifo_genbits_not_empty;

  logic [3:0]              cmd_len;
  logic                    cmd_fifo_zero;
  logic                    cmd_fifo_pop;
  logic                    cmd_len_dec;
  logic                    cmd_gen_cnt_dec;
  logic                    cmd_gen_1st_req;
  logic                    cmd_gen_inc_req;
  logic                    cmd_gen_cnt_last;
  logic                    cmd_final_ack;
  logic [GenBitsCntrWidth-1:0] cmd_gen_cnt; // max_number_of_bits_per_request = 2^19

  // flops
  logic                    cmd_ack_q, cmd_ack_d;
  logic                    cmd_ack_sts_q, cmd_ack_sts_d;
  logic [3:0]              cmd_len_q, cmd_len_d;
  logic                    cmd_gen_flag_q, cmd_gen_flag_d;
  logic [11:0]             cmd_gen_cmd_q, cmd_gen_cmd_d;

  always_ff @(posedge clk_i or negedge rst_ni)
    if (!rst_ni) begin
      cmd_ack_q       <= '0;
      cmd_ack_sts_q   <= '0;
      cmd_len_q       <= '0;
      cmd_gen_flag_q  <= '0;
      cmd_gen_cmd_q   <= '0;
    end else begin
      cmd_ack_q       <= cmd_ack_d;
      cmd_ack_sts_q   <= cmd_ack_sts_d;
      cmd_len_q       <= cmd_len_d;
      cmd_gen_flag_q  <= cmd_gen_flag_d;
      cmd_gen_cmd_q   <= cmd_gen_cmd_d;
    end

  assign  cmd_stage_sfifo_cmd_err_o = sfifo_cmd_err;
  assign  cmd_stage_sfifo_genbits_err_o = sfifo_genbits_err;
  assign                        sfifo_genbits_full = '0;

  //---------------------------------------------------------
  // capture the transfer length of data behind the command
  //---------------------------------------------------------

  prim_fifo_sync #(
    .Width(CmdFifoWidth),
    .Pass(0),
    .Depth(CmdFifoDepth),
    .OutputZeroIfEmpty(1'b0)
  ) u_prim_fifo_cmd (
    .clk_i          (clk_i),
    .rst_ni         (rst_ni),
    .clr_i          (!cs_enable_i),
    .wvalid       (sfifo_cmd_push),
    .wready       (),
    .wdata        (sfifo_cmd_wdata),
    .rvalid       (sfifo_cmd_not_empty),
    .rready       (sfifo_cmd_pop),
    .rdata        (sfifo_cmd_rdata)
  );

  assign sfifo_cmd_wdata = cmd_stage_bus_i;

  assign sfifo_cmd_push = cs_enable_i && cmd_stage_rdy_o && cmd_stage_vld_i;

  assign sfifo_cmd_pop = cs_enable_i && cmd_fifo_pop;

  assign cmd_arb_bus_o =
         cmd_gen_inc_req ? {15'b0,cmd_gen_cnt_last,cmd_stage_shid_i,cmd_gen_cmd_q} :
        // pad,glast,id,f,clen,cmd
        cmd_gen_1st_req ? {15'b0,cmd_gen_cnt_last,cmd_stage_shid_i,sfifo_cmd_rdata[11:0]} :
        cmd_arb_mop_o   ? sfifo_cmd_rdata :
        '0;

  assign sfifo_cmd_full = '0;
  assign cmd_stage_rdy_o = !sfifo_cmd_full;

  assign sfifo_cmd_err =
         {(sfifo_cmd_push && sfifo_cmd_full),
          (sfifo_cmd_pop && !sfifo_cmd_not_empty),
          (sfifo_cmd_full && !sfifo_cmd_not_empty)};


  // state machine controls
assign sfifo_cmd_depth = '0;
  assign cmd_fifo_zero = (sfifo_cmd_depth == '0);
  assign cmd_len = sfifo_cmd_rdata[7:4];

  // capture the length of csrng command
  assign cmd_len_d =
         (!cs_enable_i) ? '0 :
         cmd_arb_sop_o ? cmd_len :
         cmd_len_dec ? (cmd_len_q-1) :
         cmd_len_q;

  // for gen commands, capture information from the orignal command for use later
  assign cmd_gen_flag_d =
         (!cs_enable_i) ? '0 :
         cmd_gen_1st_req ? (sfifo_cmd_rdata[2:0] == GEN) :
         cmd_gen_flag_q;

  assign cmd_gen_cmd_d =
         (!cs_enable_i) ? '0 :
         cmd_gen_1st_req ? {sfifo_cmd_rdata[11:0]} :
         cmd_gen_cmd_q;

  // SEC_CM: CTR.REDUN
  prim_count #(
    .Width(GenBitsCntrWidth),
    .OutSelDnCnt(1'b1), // count down
    .CntStyle(prim_count_pkg::CrossCnt)
  ) u_prim_count_cmd_gen_cntr (
    .clk_i,
    .rst_ni,
    .clr_i(!cs_enable_i),
    .set_i(cmd_gen_1st_req),
    .set_cnt_i(sfifo_cmd_rdata[30:12]),
    .en_i(cmd_gen_cnt_dec),
    .step_i(GenBitsCntrWidth'(1)),
    .cnt_o(cmd_gen_cnt),
    .err_o(cmd_gen_cnt_err_o)
  );


  //---------------------------------------------------------
  // state machine to process command
  //---------------------------------------------------------
// Encoding generated with:
// $ ./util/design/sparse-fsm-encode.py -d 3 -m 10 -n 8 \
//      -s 170131814 --language=sv
//
// Hamming distance histogram:
//
//  0: --
//  1: --
//  2: --
//  3: |||||||||||||||| (28.89%)
//  4: |||||||||||||||||||| (35.56%)
//  5: |||||||||||| (22.22%)
//  6: ||||| (8.89%)
//  7: | (2.22%)
//  8: | (2.22%)
//
// Minimum Hamming distance: 3
// Maximum Hamming distance: 8
// Minimum Hamming weight: 1
// Maximum Hamming weight: 7
//

// Encoding generated with:
  localparam int StateWidth = 8;
  typedef    enum logic [StateWidth-1:0] {
    Idle      = 8'b00011011, // idle
    ArbGnt    = 8'b11110101, // general arbiter request
    SendSOP   = 8'b00011100, // send sop (start of packet)
    SendMOP   = 8'b00000001, // send mop (middle of packet)
    GenCmdChk = 8'b01010110, // gen cmd check
    CmdAck    = 8'b10001101, // wait for command ack
    GenReq    = 8'b11000000, // process gen requests
    GenArbGnt = 8'b11111110, // generate subsequent arb request
    GenSOP    = 8'b10110010, // generate subsequent request
    Error     = 8'b10111001  // illegal state reached and hang
  } state_e;

  state_e state_d, state_q;

  logic [StateWidth-1:0] state_raw_q;

  // This primitive is used to place a size-only constraint on the
  // flops in order to prevent FSM state encoding optimizations.
  prim_sparse_fsm_flop #(
    .StateEnumT(state_e),
    .Width(StateWidth),
    .ResetValue(StateWidth'(Idle))
  ) u_state_regs (
    .clk_i,
    .rst_ni,
    .state_i ( state_d ),
    .state_o ( state_raw_q )
  );

  assign state_q = state_e'(state_raw_q);

  always_comb begin
    state_d = state_q;
    cmd_fifo_pop = 1'b0;
    cmd_len_dec = 1'b0;
    cmd_gen_cnt_dec = 1'b0;
    cmd_gen_1st_req = 1'b0;
    cmd_gen_inc_req = 1'b0;
    cmd_gen_cnt_last = 1'b0;
    cmd_final_ack = 1'b0;
    cmd_arb_req_o = 1'b0;
    cmd_arb_sop_o = 1'b0;
    cmd_arb_mop_o = 1'b0;
    cmd_arb_eop_o = 1'b0;
    cmd_stage_sm_err_o = 1'b0;
    unique case (state_q)
      Idle: begin
        if (!cmd_fifo_zero) begin
          state_d = ArbGnt;
        end
      end
      ArbGnt: begin
        cmd_arb_req_o = 1'b1;
        if (cmd_arb_gnt_i) begin
          state_d = SendSOP;
        end
      end
      SendSOP: begin
        cmd_gen_1st_req = 1'b1;
        cmd_arb_sop_o = 1'b1;
        cmd_fifo_pop = 1'b1;
        if (sfifo_cmd_rdata[30:12] == GenBitsCntrWidth'(1)) begin
          cmd_gen_cnt_last = 1'b1;
        end
        if (cmd_len == '0) begin
          cmd_arb_eop_o = 1'b1;
          state_d = GenCmdChk;
        end else begin
          state_d = SendMOP;
        end
      end
      SendMOP: begin
        if (!cmd_fifo_zero) begin
          cmd_fifo_pop = 1'b1;
          cmd_len_dec = 1'b1;
          if (cmd_len_q == 4'h1) begin
            cmd_arb_mop_o = 1'b1;
            cmd_arb_eop_o = 1'b1;
            state_d = GenCmdChk;
          end else begin
            cmd_arb_mop_o = 1'b1;
          end
        end
      end
      GenCmdChk: begin
        if (cmd_gen_flag_q) begin
          cmd_gen_cnt_dec= 1'b1;
        end
        state_d = CmdAck;
      end
      CmdAck: begin
        if (cmd_ack_i) begin
          state_d = GenReq;
        end
      end
      GenReq: begin
        // flag set if a gen request
        if (cmd_gen_flag_q) begin
          // must stall if genbits fifo is not clear
          if (!sfifo_genbits_full) begin
            if (cmd_gen_cnt == '0) begin
              cmd_final_ack = 1'b1;
              state_d = Idle;
            end else begin
              // issue a subsequent gen request
              state_d = GenArbGnt;
            end
          end
        end else begin
          // ack for the non-gen request case
          cmd_final_ack = 1'b1;
          state_d = Idle;
        end
      end
      GenArbGnt: begin
        cmd_arb_req_o = 1'b1;
        if (cmd_arb_gnt_i) begin
          state_d = GenSOP;
        end
      end
      GenSOP: begin
        cmd_arb_sop_o = 1'b1;
        cmd_arb_eop_o = 1'b1;
        cmd_gen_inc_req = 1'b1;
        state_d = GenCmdChk;
        // check for final genbits beat
        if (cmd_gen_cnt == GenBitsCntrWidth'(1)) begin
          cmd_gen_cnt_last = 1'b1;
        end
      end
      Error: begin
        cmd_stage_sm_err_o = 1'b1;
      end
      default: state_d = Error;
    endcase
  end

  //---------------------------------------------------------
  // genbits fifo
  //---------------------------------------------------------

  prim_fifo_sync #(
    .Width(GenBitsFifoWidth),
    .Pass(0),
    .Depth(GenBitsFifoDepth),
    .OutputZeroIfEmpty(1'b1) // Set to 1 to prevent triggering the output assert check for x's
  ) u_prim_fifo_genbits (
    .clk_i          (clk_i),
    .rst_ni         (rst_ni),
    .clr_i          (!cs_enable_i),
    .wvalid       (sfifo_genbits_push),
    .wready       (),
    .wdata        (sfifo_genbits_wdata),
    .rvalid       (sfifo_genbits_not_empty),
    .rready       (sfifo_genbits_pop),
    .rdata        (sfifo_genbits_rdata)
  );

  assign sfifo_genbits_wdata = {genbits_fips_i,genbits_bus_i};

  assign sfifo_genbits_push = cs_enable_i && genbits_vld_i;

  assign sfifo_genbits_pop = genbits_vld_o && genbits_rdy_i;

  assign genbits_vld_o = cs_enable_i && sfifo_genbits_not_empty;
  assign {genbits_fips_o,genbits_bus_o} = sfifo_genbits_rdata;


  assign sfifo_genbits_err =
         {(sfifo_genbits_push && sfifo_genbits_full),
          (sfifo_genbits_pop && !sfifo_genbits_not_empty),
          (sfifo_genbits_full && !sfifo_genbits_not_empty)};

  //---------------------------------------------------------
  // ack logic
  //---------------------------------------------------------

  assign cmd_ack_d =
         (!cs_enable_i) ? '0 :
         cmd_final_ack;

  assign cmd_stage_ack_o = cmd_ack_q;

  assign cmd_ack_sts_d =
         (!cs_enable_i) ? '0 :
         cmd_final_ack ? cmd_ack_sts_i :
         cmd_ack_sts_q;

  assign cmd_stage_ack_sts_o = cmd_ack_sts_q;

endmodule
