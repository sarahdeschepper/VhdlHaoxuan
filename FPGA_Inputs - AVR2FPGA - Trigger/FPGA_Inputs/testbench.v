`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:33 09/05/2016
// Design Name:   FPGA_Inputs
// Module Name:   C:/Users/HLi/FPGA_Inputs/testbench.v
// Project Name:  FPGA_Inputs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPGA_Inputs
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire Clk_out;
	wire DRV_Up_Out;
	wire DRV_Down_Out;
	wire PSG_Front_Up_Out;
	wire PSG_Front_Down_Out;
	wire PSG_BackL_Up_Out;
	wire PSG_BackL_Down_Out;
	wire PSG_BackR_Up_Out;
	wire PSG_BackR_Down_Out;
	wire ready_out;

	// Instantiate the Unit Under Test (UUT)
	FPGA_Inputs uut (
		.Clk(Clk), 
		.Clk_out(Clk_out), 
		.Reset(Reset), 
		.DRV_Up_Out(DRV_Up_Out), 
		.DRV_Down_Out(DRV_Down_Out), 
		.PSG_Front_Up_Out(PSG_Front_Up_Out), 
		.PSG_Front_Down_Out(PSG_Front_Down_Out), 
		.PSG_BackL_Up_Out(PSG_BackL_Up_Out), 
		.PSG_BackL_Down_Out(PSG_BackL_Down_Out), 
		.PSG_BackR_Up_Out(PSG_BackR_Up_Out), 
		.PSG_BackR_Down_Out(PSG_BackR_Down_Out),
		.ready_out(ready_out)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
      always Clk = #5~Clk;

endmodule

