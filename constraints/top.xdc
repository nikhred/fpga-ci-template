# Basys3 example constraints (adjust for your board)
# 100 MHz clock
set_property PACKAGE_PIN W5 [get_ports {clk100}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk100}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk100}]

# LED0
set_property PACKAGE_PIN U16 [get_ports {led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {led0}]

