module register 
#(parameter WIDTH=32)
(
input clk,
input rst,
input [WIDTH-1:0] data_in,
output reg [WIDTH-1:0] data_out);


always@(negedge clk)
begin 
if(rst)
data_out<=0;
else begin 
data_out<=data_in;
// data_out[31:24]<=8'b10101010;
end
end

endmodule


