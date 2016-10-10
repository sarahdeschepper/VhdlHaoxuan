
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name FPGA_Inputs -dir "C:/Users/HLi/FPGA_Inputs/planAhead_run_3" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "FPGA_Inputs.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {FPGA_Inputs_Pkg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Input_Signal.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {main.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top FPGA_Inputs $srcset
add_files [list {FPGA_Inputs.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
