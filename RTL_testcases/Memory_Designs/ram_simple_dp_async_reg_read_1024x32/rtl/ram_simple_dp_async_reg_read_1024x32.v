module ram_simple_dp_async_reg_read_1024x32 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [9:0] read_addr, write_addr;
    input [31:0] din;
    output [31:0] dout;
    
    reg [31:0] ram [1023:0];
    reg [9:0] read_addr_reg;

    always @(posedge clk)
    begin
        read_addr_reg <= read_addr;
        if (we)
            ram[write_addr] <= din;
    end

    assign dout = ram[read_addr_reg];

endmodule