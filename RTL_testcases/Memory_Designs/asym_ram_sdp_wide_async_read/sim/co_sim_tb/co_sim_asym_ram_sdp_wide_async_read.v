
module co_sim_asym_ram_sdp_wide_async_read;
    
    reg clk, write_enable;
    reg [8:0] write_addr;
    reg [5:0] read_addr;
    reg [7:0] write_data;
    wire [63:0] read_data, read_data_net;

    integer mismatch=0;
    reg [6:0]cycle, i;

    asym_ram_sdp_wide_async_read golden(.*);
    asym_ram_sdp_wide_async_read_post_synth netlist(.*, .read_data(read_data_net));


     //clock//
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    initial begin
        for(integer i = 0; i<512; i=i+1) begin 
            golden.mem[i] ='b0;
        end  
    end
    initial begin
    {write_enable, write_addr, read_addr, write_data, cycle, i} = 0;


    //write 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        write_addr <= $urandom_range(0,511); read_addr <= $urandom_range(512,1023); write_enable <=1'b1; write_data<= $random;
        cycle = cycle +1;
       
        compare(cycle);

    end

    //reading 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        read_addr <= $urandom_range(0,511); write_addr <= $urandom_range(512,1023);  
        cycle = cycle +1;
       
        compare(cycle);
    end

    //write 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        write_addr <= $urandom_range(0,255); read_addr <= $urandom_range(32,63); write_enable <=1'b1; write_data<= $random;
        cycle = cycle +1;
       
        compare(cycle);

    end

    //reading 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        read_addr <= $urandom_range(0,31); write_addr <= $urandom_range(256,511);  
        cycle = cycle +1;
       
        compare(cycle);

    end

 //write 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        write_addr <= $urandom_range(256,511); write_enable <=$random; write_data<= $random;
        cycle = cycle +1;
       
        compare(cycle);

    end

    //reading 
    for (integer i=0; i<1024; i=i+1)begin
        repeat (1) @ (negedge clk)
        read_addr <= $urandom_range(0,62);
        cycle = cycle +1;
       
        compare(cycle);

    end
    
    if(mismatch == 0) begin
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    end
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
    

    repeat (10) @(negedge clk); $finish;
    end

    task compare(input integer cycle);
    //$display("\n Comparison at cycle %0d", cycle);
    if(read_data !== read_data_net) begin
        $display("dout mismatch. Golden: %0h, Netlist: %0h, Time: %0t", read_data, read_data_net,$time);
        mismatch = mismatch+1;
    end
    
    endtask

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars;
    end
endmodule
