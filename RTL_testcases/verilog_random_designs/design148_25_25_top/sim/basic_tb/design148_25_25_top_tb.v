// `timescale 1ns / 1ps

module design148_25_25_top_tb #(parameter WIDTH=32, CHANNEL=25); 
    reg clock,reset;
	reg [WIDTH-1:0] inpt;
	wire [WIDTH-1:0] outpt;
    
    design148_25_25_top #(.WIDTH(WIDTH),.CHANNEL(CHANNEL)) dut (.clk(clock),.rst(reset),.in(inpt),.out(outpt));

    initial begin
        clock=0;
        forever #1 clock=~clock;
    end

    initial begin
        reset = 1'b1;
        #10
        reset = 1'b0;
    end
    
    initial begin
        inpt = 32'habcdefab;
        #100
        inpt = 32'h12345678;
        #50
        reset = 1'b1;
        inpt = 32'habcdefab;
        #10
        reset = 1'b0;
        inpt = 32'haaaaaaaa;
        #230
        reset = 1'b1;
        #10
        reset = 1'b0;
        #400
        reset = 1'b1;
        #10
        reset = 1'b0;
        #210
        $finish;
    end
    
    //$finish
    initial
    begin
        $dumpfile("waveform.vcd");
        //$dumpvars;
    end

endmodule
