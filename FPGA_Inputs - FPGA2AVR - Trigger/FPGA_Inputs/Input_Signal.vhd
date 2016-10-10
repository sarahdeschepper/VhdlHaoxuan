----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:11 08/31/2016 
-- Design Name: 
-- Module Name:    Input_Signal - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.FPGA_Inputs_Pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Input_Signal is
	generic (
		Input_File		: Input_Array
		);
	port (
		Clk				: in std_logic; 
		Reset 			: in std_logic;
		Enable			: in std_logic;
		Next_Round		: in std_logic;
		Input_Out		: out std_logic
		--Inputs: out std_logic_vector(15 downto 0)
		);
end Input_Signal;

architecture Input of Input_Signal is
	signal Counter: integer range 0 to Input_Length;
	signal Delay_Counter: integer range 0 to Delay;
	signal Prescalar: integer range 0 to Prescalar_MAX;
	signal Start: std_logic :='0';
begin 

	Input_Update: process (Clk, Reset, Enable)
	begin	
	if rising_edge(Clk) then
		if (Reset = '1') then
			Prescalar <= 0;
			Counter	 <= 0;
			Delay_Counter <= 0;
			Start <= '0';
		else
			if Enable = '1' then
				Start <= '1';
			end if;
			if Start = '1' then			
				if (Delay_Counter < Delay) then
					Delay_Counter <= Delay_Counter+1;
				else
					if (Counter < Input_Length) then
						if (Prescalar < Prescalar_MAX) then
							Prescalar <= Prescalar + 1;
						else
							Prescalar <= 0;
							Input_Out <= Input_file(counter);
							Counter <= Counter+1;	
						end if;	
					elsif Next_Round = '1' then
							Counter <= 0;
					end if;			
				end if;
			end if;
		end if;	
	end if;
	end process Input_Update;
			

end Input;


