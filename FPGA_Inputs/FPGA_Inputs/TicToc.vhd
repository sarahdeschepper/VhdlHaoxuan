----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:44 09/14/2016 
-- Design Name: 
-- Module Name:    TicToc - Behavioral 
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

entity TicToc is
	port (
		Clk				: in std_logic; 
		Reset 			: in std_logic;
		TimeStamp		: in STD_LOGIC;
		Task_Flag		: in STD_LOGIC_VECTOR (Max_Task_Number_Bit - 1 downto 0) ;
		TicToc_ASCII_TX_done: in std_logic;
		TicToc_Arr		: out STD_LOGIC_VECTOR (TicToc_Range_Bit + Max_Task_Number_Bit -1  downto 0);
		TicToc_ready	: out std_logic
		);
end TicToc;

architecture Behavioral of TicToc is

	signal Counter : STD_LOGIC_VECTOR (TicToc_Range_Bit - 1 downto 0):= (others => '0'); 
	signal TimeStamp_temp :STD_LOGIC:='0';
--	signal TicToc_ready_1: std_logic;
--	signal TicToc_ready_2: std_logic := '1';
	signal Input_Counter: integer range 0 to Input_Length:= 0 ; 
	

begin

	
	Tic_Toc_Timing: process (Clk, Reset, TicToc_ASCII_TX_done, TimeStamp)
	begin	
	if rising_edge(Clk) then
		if (Reset = '1') then
			Counter	 <= (others => '0');
			TicToc_ready <= '0';
		else	
		if rising_edge(TicToc_ASCII_TX_done) then
		TicToc_ready <= '0';
		end if;
		
if Input_Counter < Input_Length then	
			if TimeStamp_temp = '0' and TimeStamp = '1' then
				TicToc_ready <= '0';
				Counter <= (others => '0');
				Input_Counter <= Input_Counter +1;
		
			elsif TimeStamp_temp = '1' and TimeStamp = '1' then
				Counter <= Counter + 1; 
					
			elsif TimeStamp_temp = '1' and TimeStamp = '0' then
				TicToc_Arr <= Task_Flag & Counter;
				TicToc_ready <= '1';
			end if;
			
			TimeStamp_temp <= TimeStamp;

else			
			TicToc_ready <= '0';
end if;			
		end if;	
 	end if;
	end process Tic_Toc_Timing;
--	
--	TicToc_ASCII_TX_done_Check: process(Clk, TicToc_ASCII_TX_done)
--	begin	
--		if rising_edge(Clk) then
--			if TicToc_ASCII_TX_done = '1' and TicToc_ready_1 = '1' then
--				TicToc_ready_2 <= '0';
--			else
--				TicToc_ready_2 <= '1';
--			end if;
--		end if;
--	end process TicToc_ASCII_TX_done_Check;


--	TicToc_ready <= TicToc_ready_1 and TicToc_ready_2;
	
end Behavioral;

