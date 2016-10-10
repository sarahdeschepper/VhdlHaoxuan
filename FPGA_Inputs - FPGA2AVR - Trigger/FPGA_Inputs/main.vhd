----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:16 08/30/2016 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use work.FPGA_Inputs_Pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FPGA_Inputs is
	port (
		Clk						: in std_logic;
		Clk_out					: out std_logic;
		Reset 					: in std_logic;
		Enable 					: in std_logic;
		Next_Round				: in std_logic;
		DRV_Up_Out 				: Out std_logic;
		DRV_Down_Out			: Out std_logic;
		PSG_Front_Up_Out		: Out std_logic;
		PSG_Front_Down_Out	: Out std_logic;
		PSG_BackL_Up_Out		: Out std_logic;
		PSG_BackL_Down_Out	: Out std_logic;
		PSG_BackR_Up_Out		: Out std_logic;
		PSG_BackR_Down_Out	: Out std_logic;
		endofrange_Out			: Out std_logic;
		currentsense_0_Out	: Out std_logic;
		currentsense_1_Out	: Out std_logic;
		ready_Out				: Out std_logic;
      UART_TX 					: Out  STD_LOGIC;
		TimeStamp				: in STD_LOGIC
		
		--Inputs: out std_logic_vector(15 downto 0)
		);
end FPGA_Inputs;

architecture Structure of FPGA_Inputs is
	
	component Frequency_Divided_Clock is 
		port(
				Clk 			: in std_logic;
				Reset			: in std_logic;
				Enable		: in std_logic;
				Clk_Divided : out std_logic
		);
	end component;
	
	component Input_Signal is 
		generic (
			Input_File		: Input_Array
			);
		port (
			Clk				: in std_logic; 
			Reset 			: in std_logic;
			Enable			: in std_logic;
			Next_Round		: in std_logic;
			Input_Out		: out std_logic
			);
	end component;


	
	component UART_TX_CTRL is
    port ( 
			SEND : in  STD_LOGIC;
         DATA : in  STD_LOGIC_VECTOR (7 downto 0);
         Clk : in  STD_LOGIC;
         TX_ready : out  STD_LOGIC;
         UART_TX : out  STD_LOGIC
			);
	end component;	
	
	component TicToc is
		port (
			Clk				: in std_logic; 
			Reset 			: in std_logic;
			Enable			: in std_logic;
			TimeStamp		: in STD_LOGIC;
			Task_Flag		: in STD_LOGIC_VECTOR (Max_Task_Number_Bit - 1 downto 0) ;
			TicToc_ASCII_TX_done			: in std_logic;
			TicToc_Arr		: out STD_LOGIC_VECTOR (TicToc_Range_Bit + Max_Task_Number_Bit -1  downto 0);
			TicToc_ready	: out std_logic
			);
	end component;

	component ASCIIConvert is
		port (
			Clk				: in std_logic; 
			Reset 			: in std_logic;
			TX_ready			: in std_logic;
			TicToc_ready	: in std_logic;
			TicToc_Arr		: in STD_LOGIC_VECTOR (TicToc_Range_Bit + Max_Task_Number_Bit -1  downto 0);
			TicToc_TX_ready: out std_logic;
			TicToc_ASCII_TX_done: out std_logic;
			TicToc_ASCII	: out std_logic_vector (7 downto 0)
			);
	end component;
	
	component Task_Trigger is
		port (
			Clk				: in std_logic; 
			Reset 			: in std_logic;
			Enable			: in std_logic;
			Next_Round		: in std_logic;
			Task_Trigger_Out		: out std_logic
			);
	end component;
	
	--signal a : STD_LOGIC_VECTOR(7 downto 0) := "00000011";
	signal Clk_Divided		: std_logic;
	signal TX_ready			: std_logic;
	signal TicToc_ASCII		: std_logic_vector(7 downto 0);
	signal TicToc_TX_ready	: std_logic;
	signal TicToc_Arr			: STD_LOGIC_VECTOR (TicToc_Range_Bit + Max_Task_Number_Bit -1  downto 0);
	signal TicToc_ready		: std_logic := '0';			
	signal TicToc_ASCII_TX_done: std_logic;
	constant Task_Flag1		: STD_LOGIC_VECTOR (Max_Task_Number_Bit - 1 downto 0):= "0010" ;
begin


	Clock: Frequency_Divided_Clock
	port map(
		Clk			=>Clk,
		Reset			=>Reset,
		Enable		=>Enable,
		Clk_Divided =>Clk_Divided
	);

	
	DRV_Up_Input : Input_Signal
	generic map(
		Input_File 	=> DRV_Up
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>DRV_Up_Out
	);
	
	DRV_Down_Input : Input_Signal
	generic map(
		Input_File 	=> DRV_Down
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>DRV_Down_Out
	);
	
	PSG_Front_Up_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_Front_Up
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_Front_Up_Out
	);
	
	PSG_Front_Down_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_Front_Down
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_Front_Down_Out
	);
	
	PSG_BackL_Up_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_BackL_Up
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_BackL_Up_Out
	);
	
	PSG_BackL_Down_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_BackL_Down
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_BackL_Down_Out
	);
	
	PSG_BackR_Up_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_BackR_Up
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_BackR_Up_Out
	);
	
	PSG_BackR_Down_Input : Input_Signal
	generic map(
		Input_File 	=> PSG_BackR_Down
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>PSG_BackR_Down_Out
	);
	
	
	endofrange_Input : Input_Signal
	generic map(
		Input_File 	=> endofrange
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>endofrange_Out
	);
	
	currentsense_0_Input : Input_Signal
	generic map(
		Input_File 	=> currentsense_0
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>currentsense_0_Out
	);

	currentsense_1_Input : Input_Signal
	generic map(
		Input_File 	=> currentsense_1
	)
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Input_Out	=>currentsense_1_Out
	);
	
	

	ready_Input : Task_Trigger
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		Next_Round	=>Next_Round,
		Task_Trigger_Out	=>ready_Out
	);
			
	
	UART_TX_Send :  UART_TX_CTRL  
	port map(
		  
			SEND  => TicToc_TX_ready,
         DATA => TicToc_ASCII,
         Clk  => Clk,
         TX_ready => TX_ready,
         UART_TX => UART_TX
		);


	ASCIIConvert_1 : ASCIIConvert 
	port map(
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		TX_ready		=>TX_ready,
		TicToc_ready=>TicToc_ready,
		TicToc_Arr	=>TicToc_Arr,
		TicToc_TX_ready=>TicToc_TX_ready,
		TicToc_ASCII	=>TicToc_ASCII,
		TicToc_ASCII_TX_done => TicToc_ASCII_TX_done
	);
	
	TicToc_1	 : TicToc 
	port map (
		Clk			=>Clk_Divided,
		Reset			=>Reset,
		Enable		=>Enable,
		TimeStamp	=> TimeStamp,
		Task_Flag	=> "0001",
		TicToc_Arr	=> TicToc_Arr,
		TicToc_ready=> TicToc_ready,
		TicToc_ASCII_TX_done => TicToc_ASCII_TX_done
	);
	
	Clk_Out <= Clk_Divided after 10 ns ;
--TicToc_ready <= '1' after 1ms;
end Structure;

