
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
   set_property BOARD_PART digilentinc.com:basys3:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set center_sensor [ create_bd_port -dir I center_sensor ]
  set led [ create_bd_port -dir O -from 2 -to 0 led ]
  set led_0 [ create_bd_port -dir O -from 2 -to 0 led_0 ]
  set left_sensor [ create_bd_port -dir I left_sensor ]
  set md_sentido [ create_bd_port -dir O -from 1 -to 0 md_sentido ]
  set me_sentido [ create_bd_port -dir O -from 1 -to 0 me_sentido ]
  set out_m1 [ create_bd_port -dir O out_m1 ]
  set out_m2 [ create_bd_port -dir O out_m2 ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set right_sensor [ create_bd_port -dir I right_sensor ]
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: FSM_Controller_0, and set properties
  set FSM_Controller_0 [ create_bd_cell -type ip -vlnv UnB_FGA:line_follower:FSM_Controller:3.0 FSM_Controller_0 ]

  # Create instance: PWM_Gen_0, and set properties
  set PWM_Gen_0 [ create_bd_cell -type ip -vlnv unb_fga:line_follower:PWM_Gen:1.0 PWM_Gen_0 ]

  # Create instance: PWM_Gen_1, and set properties
  set PWM_Gen_1 [ create_bd_cell -type ip -vlnv unb_fga:line_follower:PWM_Gen:1.0 PWM_Gen_1 ]

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz

  # Create instance: rst_clk_wiz_100M, and set properties
  set rst_clk_wiz_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_100M ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $rst_clk_wiz_100M

  # Create instance: sensor_read_0, and set properties
  set sensor_read_0 [ create_bd_cell -type ip -vlnv unb_fga:line_follower:sensor_read:1.0 sensor_read_0 ]

  # Create port connections
  connect_bd_net -net FSM_Controller_0_led [get_bd_ports led_0] [get_bd_pins FSM_Controller_0/led]
  connect_bd_net -net FSM_Controller_0_md_out [get_bd_pins FSM_Controller_0/md_out] [get_bd_pins PWM_Gen_0/duty]
  connect_bd_net -net FSM_Controller_0_md_sentido [get_bd_ports md_sentido] [get_bd_pins FSM_Controller_0/md_sentido]
  connect_bd_net -net FSM_Controller_0_me_out [get_bd_pins FSM_Controller_0/me_out] [get_bd_pins PWM_Gen_1/duty]
  connect_bd_net -net FSM_Controller_0_me_sentido [get_bd_ports me_sentido] [get_bd_pins FSM_Controller_0/me_sentido]
  connect_bd_net -net PWM_Gen_0_sig_out [get_bd_ports out_m1] [get_bd_pins PWM_Gen_0/sig_out]
  connect_bd_net -net PWM_Gen_1_sig_out [get_bd_ports out_m2] [get_bd_pins PWM_Gen_1/sig_out]
  connect_bd_net -net center_0_1 [get_bd_ports center_sensor] [get_bd_pins sensor_read_0/center]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_pins FSM_Controller_0/clk] [get_bd_pins PWM_Gen_0/clk] [get_bd_pins PWM_Gen_1/clk] [get_bd_pins clk_wiz/clk_out1] [get_bd_pins rst_clk_wiz_100M/slowest_sync_clk] [get_bd_pins sensor_read_0/clk]
  connect_bd_net -net clk_wiz_locked [get_bd_pins clk_wiz/locked] [get_bd_pins rst_clk_wiz_100M/dcm_locked]
  connect_bd_net -net left_0_1 [get_bd_ports left_sensor] [get_bd_pins sensor_read_0/left]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins clk_wiz/reset] [get_bd_pins rst_clk_wiz_100M/ext_reset_in]
  connect_bd_net -net right_0_1 [get_bd_ports right_sensor] [get_bd_pins sensor_read_0/right]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_pins FSM_Controller_0/reset] [get_bd_pins PWM_Gen_0/rst] [get_bd_pins PWM_Gen_1/rst] [get_bd_pins rst_clk_wiz_100M/peripheral_aresetn] [get_bd_pins sensor_read_0/reset]
  connect_bd_net -net sensor_read_0_sensor_value [get_bd_ports led] [get_bd_pins FSM_Controller_0/sensor_in] [get_bd_pins sensor_read_0/sensor_value]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins clk_wiz/clk_in1]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


