`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:14:21 09/16/2016
// Design Name:   ASCIIConvert
// Module Name:   C:/Users/HLi/FPGA_Inputs/BenchASCII.v
// Project Name:  FPGA_Inputs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ASCIIConvert
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BenchASCII;

	// Inputs
	reg Clk;
	reg Reset;
	reg TX_ready;
	reg TicToc_ready;
	reg [15:0] TicToc_Arr;

	// Outputs
	wire TicToc_TX_ready;
	wire [7:0] TicToc_ASCII;

	// Instantiate the Unit Under Test (UUT)
	ASCIIConvert uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.TX_ready(TX_ready), 
		.TicToc_ready(TicToc_ready), 
		.TicToc_Arr(TicToc_Arr), 
		.TicToc_TX_ready(TicToc_TX_ready), 
		.TicToc_ASCII(TicToc_ASCII)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;
		TX_ready = 0;
		TicToc_ready = 1;
		TicToc_Arr = 16'h1234;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     	always Clk = #5~Clk;
		
		always TX_ready = #10~TX_ready;
endmodule

