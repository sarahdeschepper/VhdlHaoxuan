----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:09 10/04/2016 
-- Design Name: 
-- Module Name:    Task_Trigger - Behavioral 
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

entity Task_Trigger is
	port (
		Clk				: in std_logic; 
		Reset 			: in std_logic;
		Enable			: in std_logic;
		Next_Round		: in std_logic;
		Task_Trigger_Out		: out std_logic:='1'
		);

end Task_Trigger;

architecture Behavioral of Task_Trigger is
	constant Prescalar_MAX_Trigger: integer := Prescalar_MAX/2;
	constant Input_Length_Trigger:  integer := Input_length*2 ;
	constant Trigger_Delay_Max: integer := 100;
	signal Counter: integer range 0 to Input_Length_Trigger;
	signal Delay_Counter: integer range 0 to Delay;
	signal Prescalar: integer range 0 to Prescalar_MAX_Trigger;
	signal Task_Trigger_temp: std_logic := '0';
	signal Trigger_Delay: integer range 0 to 100;
	signal Start: std_logic :='0';
	
begin
	
	Trigger: process (Clk, Reset, Enable)
	begin	
	if rising_edge(Clk) then
		if (Reset = '1') then
			Prescalar <= 0;
			Counter	 <= 0;
			Delay_Counter <= 0;
			Task_Trigger_temp <= '1';
			Start <= '0';
		else
			if Enable = '1' then
				Start <= '1';
			end if;
			if Start = '1' then	
				if (Trigger_Delay < Trigger_Delay_Max ) then
					Trigger_Delay <= Trigger_Delay+1;
				else	
				if (Delay_Counter < Delay ) then
						Delay_Counter <= Delay_Counter+1;
					else
						if (Counter < Input_Length_Trigger) then
							if (Prescalar < Prescalar_MAX_Trigger) then
								Prescalar <= Prescalar + 1;
							else
								Prescalar <= 0;
								Task_Trigger_temp	<= NOT(Task_Trigger_temp);
								Counter <= Counter+1;	
							end if;	
						elsif Next_Round = '1' then
							Counter <= 0;	
						else 
							Task_Trigger_temp <= '0';				
						end if;						
					end if;
				end if;
			end if;
		end if;	
	end if;
	end process Trigger;
	Task_Trigger_Out <= Task_Trigger_temp;
end Behavioral;

