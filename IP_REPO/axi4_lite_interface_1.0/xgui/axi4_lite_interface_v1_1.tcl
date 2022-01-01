# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_BUS_IS_64_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_WRITE_STROBES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SUBORDINATE_SYNCHRONOUS_READ_PORT" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to update ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to validate ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_BUS_IS_64_BITS { PARAM_VALUE.DATA_BUS_IS_64_BITS } {
	# Procedure called to update DATA_BUS_IS_64_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_BUS_IS_64_BITS { PARAM_VALUE.DATA_BUS_IS_64_BITS } {
	# Procedure called to validate DATA_BUS_IS_64_BITS
	return true
}

proc update_PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT { PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT } {
	# Procedure called to update SUBORDINATE_SYNCHRONOUS_READ_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT { PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT } {
	# Procedure called to validate SUBORDINATE_SYNCHRONOUS_READ_PORT
	return true
}

proc update_PARAM_VALUE.USE_WRITE_STROBES { PARAM_VALUE.USE_WRITE_STROBES } {
	# Procedure called to update USE_WRITE_STROBES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_WRITE_STROBES { PARAM_VALUE.USE_WRITE_STROBES } {
	# Procedure called to validate USE_WRITE_STROBES
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.DATA_BUS_IS_64_BITS { MODELPARAM_VALUE.DATA_BUS_IS_64_BITS PARAM_VALUE.DATA_BUS_IS_64_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_BUS_IS_64_BITS}] ${MODELPARAM_VALUE.DATA_BUS_IS_64_BITS}
}

proc update_MODELPARAM_VALUE.ADDR_WIDTH { MODELPARAM_VALUE.ADDR_WIDTH PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_WIDTH}] ${MODELPARAM_VALUE.ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.USE_WRITE_STROBES { MODELPARAM_VALUE.USE_WRITE_STROBES PARAM_VALUE.USE_WRITE_STROBES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_WRITE_STROBES}] ${MODELPARAM_VALUE.USE_WRITE_STROBES}
}

proc update_MODELPARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT { MODELPARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT}] ${MODELPARAM_VALUE.SUBORDINATE_SYNCHRONOUS_READ_PORT}
}

