

module ram_inst_tdp_no_split_16 (
  input clock0, clock1, weA, weB, reA, reB,
  input [9:0] addrA, addrB,
  input [15:0] dinA, dinB, 
  output [15:0] doutA, doutB);

parameter [80:0] MODE_BITS =81'h49200000002490000000;


 RS_TDP36K  #(.MODE_BITS(MODE_BITS))
  inst1(
    .ADDR_A1({ 1'h0, addrA, 4'h0 }),
    .ADDR_A2({ addrA, 4'h0 }),
    .ADDR_B1({ 1'h0, addrB, 4'h0 }),
    .ADDR_B2({ addrB, 4'h0 }),
    .BE_A1(3),
    .BE_A2(0),
    .BE_B1(3),
    .BE_B2(0),
    .CLK_A1(clock0),
    .CLK_A2(clock0),
    .CLK_B1(clock1),
    .CLK_B2(clock1),
    .FLUSH1(0),
    .FLUSH2(0),
    .RDATA_A1(doutA[15:0]),
    .RDATA_A2(),
    .RDATA_B1(doutB[15:0]),
    .RDATA_B2(),
    .REN_A1(reA),
    .REN_A2(0),
    .REN_B1(reB),
    .REN_B2(0),
    .WDATA_A1(dinA[15:0]),
    .WDATA_A2(0),
    .WDATA_B1(dinB[15:0]),
    .WDATA_B2(0),
    .WEN_A1(weA),
    .WEN_A2(0),
    .WEN_B1(weB),
    .WEN_B2(0)
  );
 

endmodule
