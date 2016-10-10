`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:47 09/02/2016
// Design Name:   Input_Signal
// Module Name:   C:/Users/HLi/FPGA_Inputs/aaa.v
// Project Name:  FPGA_Inputs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Input_Signal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module aaa;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire Input_Out;

	// Instantiate the Unit Under Test (UUT)
	Input_Signal uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.Input_Out(Input_Out)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

