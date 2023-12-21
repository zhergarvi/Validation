/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Author: Eyal Hochberg                                      ////
////          eyal@provartec.com                                 ////
////                                                             ////
////  Downloaded from: http://www.opencores.org                  ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2010 Provartec LTD                            ////
//// www.provartec.com                                           ////
//// info@provartec.com                                          ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// This source file is free software; you can redistribute it  ////
//// and/or modify it under the terms of the GNU Lesser General  ////
//// Public License as published by the Free Software Foundation.////
////                                                             ////
//// This source is distributed in the hope that it will be      ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied  ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR     ////
//// PURPOSE.  See the GNU Lesser General Public License for more////
//// details. http://www.gnu.org/licenses/lgpl.html              ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:36:53 2011
//--
//-- Source file: dma_core_top.v
//---------------------------------------------------------

`include "dma_axi64_defines.v"

module dma_axi64_core0_top(clk,reset,scan_en,idle,ch_int_all_proc,ch_start,clkdiv,periph_tx_req,periph_tx_clr,periph_rx_req,periph_rx_clr,pclken,psel,penable,paddr,pwrite,pwdata,prdata,pslverr,pready,rd_port_num,wr_port_num,joint_mode,joint_remote,rd_prio_top,rd_prio_high,rd_prio_top_num,rd_prio_high_num,wr_prio_top,wr_prio_high,wr_prio_top_num,wr_prio_high_num,AWADDR,AWLEN,AWSIZE,AWVALID,AWREADY,WDATA,WSTRB,WLAST,WVALID,WREADY,BRESP,BVALID,BREADY,ARADDR,ARLEN,ARSIZE,ARVALID,ARREADY,RDATA,RRESP,RLAST,RVALID,RREADY);

   input             clk;
   input             reset;
   input             scan_en;

   output             idle;
   output [8*1-1:0]  ch_int_all_proc;
   input [7:0]                 ch_start;
   input [3:0]             clkdiv;    
   
   input [31:1]         periph_tx_req;
   output [31:1]         periph_tx_clr;
   input [31:1]         periph_rx_req;
   output [31:1]         periph_rx_clr;
   
   input                    pclken;
   input                    psel;
   input                    penable;
   input [10:0]             paddr;
   input                    pwrite;
   input [31:0]             pwdata;
   output [31:0]            prdata;
   output                   pslverr;
   output                   pready;

   output             rd_port_num;
   output             wr_port_num;

   input             joint_mode;
   input             joint_remote;
   input              rd_prio_top;
   input              rd_prio_high;
   input [2:0]             rd_prio_top_num;
   input [2:0]             rd_prio_high_num;
   input              wr_prio_top;
   input              wr_prio_high;
   input [2:0]             wr_prio_top_num;
   input [2:0]             wr_prio_high_num;
   
   output [31:0]            AWADDR;
   output [`LEN_BITS-1:0]   AWLEN;
   output [`SIZE_BITS-1:0]                      AWSIZE;
   output                   AWVALID;
   input                    AWREADY;
   output [63:0]            WDATA;
   output [64/8-1:0]        WSTRB;
   output                   WLAST;
   output                   WVALID;
   input                    WREADY;
   input [1:0]              BRESP;
   input                    BVALID;
   output                   BREADY;
   output [31:0]            ARADDR;
   output [`LEN_BITS-1:0]   ARLEN;
   output [`SIZE_BITS-1:0]                      ARSIZE;
   output                   ARVALID;
   input                    ARREADY;
   input [63:0]             RDATA;
   input [1:0]              RRESP;
   input                    RLAST;
   input                    RVALID;
   output                   RREADY;
  
   wire [31:0]              slow_AWADDR;
   wire [`LEN_BITS-1:0]     slow_AWLEN;
   wire [`SIZE_BITS-1:0]                      slow_AWSIZE;
   wire                     slow_AWVALID;
   wire                     slow_AWREADY;
   wire [63:0]              slow_WDATA;
   wire [64/8-1:0]          slow_WSTRB;
   wire                     slow_WLAST;
   wire                     slow_WVALID;
   wire                     slow_WREADY;
   wire [1:0]               slow_BRESP;
   wire                     slow_BVALID;
   wire                     slow_BREADY;
   wire [31:0]              slow_ARADDR;
   wire [`LEN_BITS-1:0]     slow_ARLEN;
   wire [`SIZE_BITS-1:0]                      slow_ARSIZE;
   wire                     slow_ARVALID;
   wire                     slow_ARREADY;
   wire [63:0]              slow_RDATA;
   wire [1:0]               slow_RRESP;
   wire                     slow_RLAST;
   wire                     slow_RVALID;
   wire                     slow_RREADY;
   
   wire             clk_out;
   wire             clken;
   wire             bypass;
   
   
  
   assign             clk_out      = clk;
   assign             clken        = 1'b1;

   assign                   AWADDR = slow_AWADDR;
   assign                   AWLEN = slow_AWLEN;
   assign                   AWSIZE = slow_AWSIZE;
   assign                   AWVALID = slow_AWVALID;
   assign                   WDATA = slow_WDATA;
   assign                   WSTRB = slow_WSTRB;
   assign                   WLAST = slow_WLAST;
   assign                   WVALID = slow_WVALID;
   assign                   BREADY = slow_BREADY;
   assign                   ARADDR = slow_ARADDR;
   assign                   ARLEN = slow_ARLEN;
   assign                   ARSIZE = slow_ARSIZE;
   assign                   ARVALID = slow_ARVALID;
   assign                   RREADY = slow_RREADY;
   assign                   slow_AWREADY = AWREADY;
   assign                   slow_WREADY = WREADY;
   assign                   slow_BRESP = BRESP;
   assign                   slow_BVALID = BVALID;
   assign                   slow_ARREADY = ARREADY;
   assign                   slow_RDATA = RDATA;
   assign                   slow_RRESP = RRESP;
   assign                   slow_RLAST = RLAST;
   assign                   slow_RVALID = RVALID;

   dma_axi64_core0
   dma_axi64_core0 (
         .clk(clk_out),
         .reset(reset),
         .scan_en(scan_en),

         .idle(idle),
         .ch_int_all_proc(ch_int_all_proc),
         .ch_start(ch_start),
      
         .periph_tx_req(periph_tx_req),
         .periph_tx_clr(periph_tx_clr),
         .periph_rx_req(periph_rx_req),
         .periph_rx_clr(periph_rx_clr),

         .pclk(clk),
         .clken(clken),
         .pclken(pclken),
         .psel(psel),
         .penable(penable),
         .paddr(paddr[10:0]),
         .pwrite(pwrite),
         .pwdata(pwdata),
         .prdata(prdata),
         .pslverr(pslverr),

         .joint_mode_in(joint_mode),
         .joint_remote(joint_remote),
         .rd_prio_top(rd_prio_top),
         .rd_prio_high(rd_prio_high),
         .rd_prio_top_num(rd_prio_top_num),
         .rd_prio_high_num(rd_prio_high_num),
         .wr_prio_top(wr_prio_top),
         .wr_prio_high(wr_prio_high),
         .wr_prio_top_num(wr_prio_top_num),
         .wr_prio_high_num(wr_prio_high_num),
         
         .rd_port_num(rd_port_num),
         .wr_port_num(wr_port_num),

                 .AWADDR(slow_AWADDR),
                 .AWLEN(slow_AWLEN),
                 .AWSIZE(slow_AWSIZE),
                 .AWVALID(slow_AWVALID),
                 .AWREADY(slow_AWREADY),
                 .WDATA(slow_WDATA),
                 .WSTRB(slow_WSTRB),
                 .WLAST(slow_WLAST),
                 .WVALID(slow_WVALID),
                 .WREADY(slow_WREADY),
                 .BRESP(slow_BRESP),
                 .BVALID(slow_BVALID),
                 .BREADY(slow_BREADY),
                 .ARADDR(slow_ARADDR),
                 .ARLEN(slow_ARLEN),
                 .ARSIZE(slow_ARSIZE),
                 .ARVALID(slow_ARVALID),
                 .ARREADY(slow_ARREADY),
                 .RDATA(slow_RDATA),
                 .RRESP(slow_RRESP),
                 .RLAST(slow_RLAST),
                 .RVALID(slow_RVALID),
                 .RREADY(slow_RREADY)
         );

   

   
endmodule





   


