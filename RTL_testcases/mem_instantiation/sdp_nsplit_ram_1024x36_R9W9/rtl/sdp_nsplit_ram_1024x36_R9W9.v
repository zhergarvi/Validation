

module sdp_nsplit_ram_1024x36_R9W9 (
  input clock0, we,
  input [9:0] wr_addr, rd_addr,
  input [8:0] din, 
  output [8:0] dout);

parameter [80:0] MODE_BITS =81'h92400000000000000000;
wire [9:0] open_wire, open_wire2;

 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ rd_addr, 5'h00 }),
    .ADDR_A2({ rd_addr[8:0], 5'h00 }),
    .ADDR_B1({ wr_addr, 5'h00 }),
    .ADDR_B2({ wr_addr[8:0], 5'h00 }),
    .BE_A1(0),
    .BE_A2(0),
    .BE_B1(3),
    .BE_B2(3),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock0),
    .CLK_B2(clock0),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1({open_wire[8],dout[8],open_wire[7:0],dout[7:0]}),
    .RDATA_A2(),
    .RDATA_B1(),
    .RDATA_B2(),
    .REN_A1(1),
    .REN_A2(1),
    .REN_B1(0),
    .REN_B2(0),
    .WDATA_A1(0),
    .WDATA_A2(0),
    .WDATA_B1({1'b0,din[8],8'b0,din[7:0]}),
    .WDATA_B2(0),
    .WEN_A1(0),
    .WEN_A2(0),
    .WEN_B1(we),
    .WEN_B2(we)
  );
 

endmodule
