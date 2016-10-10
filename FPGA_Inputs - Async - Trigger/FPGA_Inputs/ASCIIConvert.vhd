----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:21 09/15/2016 
-- Design Name: 
-- Module Name:    ASCIIConvert - Behavioral 
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

entity ASCIIConvert is
	port (
		Clk				: in std_logic; 
		Reset 			: in std_logic;
		TX_ready			: in std_logic;
		TicToc_ready	: in std_logic;
		TicToc_Arr		: in STD_LOGIC_VECTOR (TicToc_Range_Bit + Max_Task_Number_Bit -1  downto 0);
		TicToc_TX_ready: out std_logic;
		TicToc_ASCII_TX_done: out std_logic;
		TicToc_ASCII	: out std_logic_vector (7 downto 0):= X"0d"
		);
end ASCIIConvert;

architecture Behavioral of ASCIIConvert is
	constant Counter_Max : integer := (TicToc_Range_Bit + Max_Task_Number_Bit) / 4 + 2;
	signal 	Counter 		: integer range 0 to Counter_Max;
	constant Delay_Counter_Max: integer := 1000 ; -- Do not change
		signal 	Delay_Counter: integer range 0 to Delay_Counter_Max;
begin
	
	ASCII_Convert: process (Clk, Reset, TX_ready, TicToc_ready)
	begin	
	if rising_edge(Clk) then
		if (Reset = '1') then
			Counter	 <= 0;
			TicToc_TX_ready <= '0';
		else
					if (Delay_Counter < Delay_Counter_Max) then
				Delay_Counter <= Delay_Counter+1;
			else
			Delay_Counter<=0;
				if TicToc_ready = '1' then
					if TX_ready = '1' then
	
						if Counter < Max_Task_Number_Bit/4 then 
							TicToc_ASCII_TX_done <= '0';
			
							Counter <= Counter + 1;
						elsif Counter = Max_Task_Number_Bit/4 then
							
							Counter <= Counter + 1;
						elsif Counter > Max_Task_Number_Bit/4 and Counter < (Counter_Max - 1) then
							TicToc_ASCII_TX_done <= '0';
							if TicToc_Arr((TicToc_Range_Bit + Max_Task_Number_Bit - 1 - 4*Counter +4) downto (TicToc_Range_Bit + Max_Task_Number_Bit - 4 - 4*Counter +4)) < 10 then
								TicToc_ASCII <= "0000" & TicToc_Arr((TicToc_Range_Bit + Max_Task_Number_Bit - 1 - 4*Counter +4) downto (TicToc_Range_Bit + Max_Task_Number_Bit - 4 - 4*Counter +4)) + "00110000";
							else	
								TicToc_ASCII <= "0000" & TicToc_Arr((TicToc_Range_Bit + Max_Task_Number_Bit - 1 - 4*Counter +4) downto (TicToc_Range_Bit + Max_Task_Number_Bit - 4 - 4*Counter +4)) - 10 + "01000001";
							end if;
							TicToc_TX_ready <= '1';
							Counter <= Counter + 1;
						elsif Counter = (Counter_Max - 1) then
							TicToc_ASCII_TX_done <= '0';
							TicToc_ASCII <= x"0d";  -- \n
							TicToc_TX_ready <= '1';
							Counter <= Counter + 1;
							
						else					
							TicToc_ASCII <= x"0a";	-- \r
							TicToc_TX_ready <= '1';
							Counter <=0;
							TicToc_ASCII_TX_done <= '1';
						end if; 
						
					else
						TicToc_TX_ready <= '0';
					end if;
				else
					TicToc_TX_ready <= '0';
				end if;
			end if;
		end if;
	end if;
	end process ASCII_Convert;	

end Behavioral;

