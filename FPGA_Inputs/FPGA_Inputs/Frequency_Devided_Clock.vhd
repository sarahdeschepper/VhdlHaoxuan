----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:16 09/05/2016 
-- Design Name: 
-- Module Name:    Frequency_Divided_Clock - Behavioral 
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
use work.FPGA_Inputs_Pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Frequency_Divided_Clock is
	Port(
			Clk 			: in std_logic;
			Reset			: in std_logic;
			Clk_Divided : out std_logic
	);

end Frequency_Divided_Clock;

	
architecture Behavioral of Frequency_Divided_Clock is
	signal Clk_temp: std_logic;
   signal Clk_Prescalar : std_logic_vector (5 downto 0);	
	
begin

	process: Clock_Divider (Clk, Reset)
		if rising_edge(Clk) then
			if (Reset = '1') then
				Clk_temp	 <= 0;
				Clk_Prescalar <= ( others => '0');
			else
				if (Counter < Input_Length) then
					if (Clk_Prescalar < Clk_Divider) then
						Clk_Prescalar <= Clk_Prescalar + 1;
					else
						Clk_Prescalar <= ( others => '0');
						Clk_temp	<= NOT(Clk_temp);	
					end if;	
				end if;
			end if;	
		end if;
	end process;
	
	Clk_Divided <= Clk_temp;

end Behavioral;

