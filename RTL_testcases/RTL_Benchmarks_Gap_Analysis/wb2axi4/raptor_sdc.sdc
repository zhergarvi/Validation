create_clock -period 2.5 axi_clk
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]
create_clock -period 2.5 wb_clk
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]
