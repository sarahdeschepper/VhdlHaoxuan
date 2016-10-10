--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:00 09/05/2016
-- Design Name:   
-- Module Name:   C:/Users/HLi/FPGA_Inputs/testbench.vhd
-- Project Name:  FPGA_Inputs
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FPGA_Inputs
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FPGA_Inputs
    PORT(
         Clk : IN  std_logic;
         Clk_out : OUT  std_logic;
         Reset : IN  std_logic;
         DRV_Up_Out : OUT  Bit;
         DRV_Down_Out : OUT  Bit;
         PSG_Front_Up_Out : OUT  Bit;
         PSG_Front_Down_Out : OUT  Bit;
         PSG_BackL_Up_Out : OUT  Bit;
         PSG_BackL_Down_Out : OUT  Bit;
         PSG_BackR_Up_Out : OUT  Bit;
         PSG_BackR_Down_Out : OUT  Bit
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
	signal Clk_out : std_logic;
	signal Clk_Divided : std_logic;
   signal DRV_Up_Out : Bit;
   signal DRV_Down_Out : Bit;
   signal PSG_Front_Up_Out : Bit;
   signal PSG_Front_Down_Out : Bit;
   signal PSG_BackL_Up_Out : Bit;
   signal PSG_BackL_Down_Out : Bit;
   signal PSG_BackR_Up_Out : Bit;
   signal PSG_BackR_Down_Out : Bit;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
   constant Clk_out_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FPGA_Inputs PORT MAP (
          Clk => Clk,
          Clk_out => Clk_out,
          Reset => Reset,
          DRV_Up_Out => DRV_Up_Out,
          DRV_Down_Out => DRV_Down_Out,
          PSG_Front_Up_Out => PSG_Front_Up_Out,
          PSG_Front_Down_Out => PSG_Front_Down_Out,
          PSG_BackL_Up_Out => PSG_BackL_Up_Out,
          PSG_BackL_Down_Out => PSG_BackL_Down_Out,
          PSG_BackR_Up_Out => PSG_BackR_Up_Out,
          PSG_BackR_Down_Out => PSG_BackR_Down_Out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
   Clk_out_process :process
   begin
		Clk_out <= '0';
		wait for Clk_out_period/2;
		Clk_out <= '1';
		wait for Clk_out_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
