set_property SRC_FILE_INFO {cfile:/media/sf_SharedWork/Lab3/ip_repo/edit_coffee_mealy_v1_0.srcs/constrs_1/new/constraints.xdc rfile:../../../edit_coffee_mealy_v1_0.srcs/constrs_1/new/constraints.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { coffee }]; # LED 0
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { state_display[0] }]; # LED 1
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { state_display[1] }]; # LED 2
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { coins[0] }]; # Switch 0
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { coins[1] }]; # Switch 1
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { insert }]; # Button 0
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D20   IOSTANDARD LVCMOS33 } [get_ports { reset }]; # Button 1
