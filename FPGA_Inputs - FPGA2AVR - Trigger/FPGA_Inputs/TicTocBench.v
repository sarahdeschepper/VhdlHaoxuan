`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:08:11 09/20/2016
// Design Name:   TicToc
// Module Name:   C:/Users/HLi/FPGA_Inputs/TicTocBench.v
// Project Name:  FPGA_Inputs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TicToc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TicTocBench;

	// Inputs
	reg Clk;
	reg Reset;
	reg TimeStamp;
	reg TicToc_ASCII_TX_done;

	// Outputs
	wire [15:0] TicToc_Arr ="1001110010110101";;
	wire TicToc_ready;

	// Instantiate the Unit Under Test (UUT)
	TicToc uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.TimeStamp(TimeStamp), 
		.TicToc_ASCII_TX_done(TicToc_ASCII_TX_done), 
		.TicToc_Arr(TicToc_Arr), 
		.TicToc_ready(TicToc_ready)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;
		TimeStamp = 0;
		TicToc_ASCII_TX_done = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     	always Clk = #25~Clk;
		
		always TimeStamp = #100~TimeStamp;
		
		always TicToc_ASCII_TX_done = #400~TicToc_ASCII_TX_done;
      
endmodule

