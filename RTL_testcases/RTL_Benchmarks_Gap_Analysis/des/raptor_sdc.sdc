create_clock -period 2.5 clk
set_input_delay 0 -clock clk [get_ports {*}]
set_output_delay 0 -clock clk [get_ports {*}]


set_clock_uncertainty 0.298
