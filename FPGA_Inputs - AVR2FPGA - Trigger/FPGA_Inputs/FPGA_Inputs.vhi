
-- VHDL Instantiation Created from source file FPGA_Inputs.vhd -- 18:25:02 09/02/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT FPGA_Inputs
	PORT(
		Clk : IN std_logic;
		Reset : IN std_logic;          
		Clk_Out : OUT std_logic;
		DRV_Up_Out : OUT std_logic;
		DRV_Down_Out : OUT std_logic;
		PSG_Front_Up_Out : OUT std_logic;
		PSG_Front_Down_Out : OUT std_logic;
		PSG_BackL_Up_Out : OUT std_logic;
		PSG_BackL_Down_Out : OUT std_logic;
		PSG_BackR_Up_Out : OUT std_logic;
		PSG_BackR_Down_Out : OUT std_logic
		);
	END COMPONENT;

	Inst_FPGA_Inputs: FPGA_Inputs PORT MAP(
		Clk => ,
		Clk_Out => ,
		Reset => ,
		DRV_Up_Out => ,
		DRV_Down_Out => ,
		PSG_Front_Up_Out => ,
		PSG_Front_Down_Out => ,
		PSG_BackL_Up_Out => ,
		PSG_BackL_Down_Out => ,
		PSG_BackR_Up_Out => ,
		PSG_BackR_Down_Out => 
	);


