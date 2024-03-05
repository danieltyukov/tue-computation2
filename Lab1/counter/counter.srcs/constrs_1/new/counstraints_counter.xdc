// The next line enables the Vivado tools to permit a clock provided from an input pin
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]

// SW0-1
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS33 } [get_ports { enable }];
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { reset }];

// LDO-3
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports { count[0] }];
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { count[1] }];
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { count[2] }];
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { count[3] }];

// BTN3
set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { clk }];