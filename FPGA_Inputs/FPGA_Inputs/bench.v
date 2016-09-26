`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:44:21 09/16/2016
// Design Name:   FPGA_Inputs
// Module Name:   C:/Users/HLi/FPGA_Inputs/bench.v
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

module bench;

	// Inputs
	reg Clk;
	reg Reset;
	reg TimeStamp;

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
	wire endofrange_Out;
	wire currentsense_0_Out;
	wire currentsense_1_Out;
	wire ready_Out;
	wire UART_TX;

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
		.endofrange_Out(endofrange_Out), 
		.currentsense_0_Out(currentsense_0_Out), 
		.currentsense_1_Out(currentsense_1_Out), 
		.ready_Out(ready_Out), 
		.UART_TX(UART_TX), 
		.TimeStamp(TimeStamp)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;
		TimeStamp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
	end
		always Clk = #5~Clk;
      
endmodule


	