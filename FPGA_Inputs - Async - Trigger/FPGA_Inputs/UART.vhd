----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:16 09/14/2016 
-- Design Name: 
-- Module Name:    UART - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
	port (
		Clk				: in std_logic; 
		Reset 			: in std_logic;
		UART_Out			: out STD_LOGIC
		--Inputs: out std_logic_vector(15 downto 0)
		);
end UART;

architecture Behavioral of UART is
type TX_STATE_TYPE is (RDY, LOAD_BIT, SEND_BIT);

begin

	UART_Send: process(Clk, Reset)
	begin
		if rising_edge(Clk) then
			if (Reset = '1') then
	
			else
			
			   UART_Out<='0';
				UART_Out<='1';
				UART_Out<='1';
				UART_Out<='0';
				UART_Out<='0';
				UART_Out<='0';
				UART_Out<='1';
				UART_Out<='0';
				UART_Out<='0';
				
				UART_Out<='1';
	 
			
			end if;
		end if;
	
	
	end process UART_Send;
end Behavioral;

