
module rams_sp_rf_rst_sync_512x16_logic (clk, we, rst, addr, di, dout);
input clk;
input we;
input rst;
input [8:0] addr;
input [15:0] di;
output [15:0] dout;

(* ram_style = "logic" *)
reg [15:0] RAM [511:0];
reg [15:0] dout;

always @(posedge clk)
    begin
        if (rst)
            dout <= 0;
        else if (we)
            RAM[addr] <= di;
        dout <= RAM[addr];
    end
endmodule