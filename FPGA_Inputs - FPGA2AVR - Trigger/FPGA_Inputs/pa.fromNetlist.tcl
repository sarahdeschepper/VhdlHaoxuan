
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name FPGA_Inputs -dir "C:/Users/HLi/FPGA_Inputs/planAhead_run_4" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/HLi/FPGA_Inputs/FPGA_Inputs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/HLi/FPGA_Inputs} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "FPGA_Inputs.ucf" [current_fileset -constrset]
add_files [list {FPGA_Inputs.ucf}] -fileset [get_property constrset [current_run]]
link_design
