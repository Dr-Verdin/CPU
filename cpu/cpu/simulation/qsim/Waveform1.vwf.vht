-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/03/2024 22:19:33"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          cpu_offic
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY cpu_offic_vhd_vec_tst IS
END cpu_offic_vhd_vec_tst;
ARCHITECTURE cpu_offic_arch OF cpu_offic_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALU : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL AluSrc : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL end_R1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL end_R2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL instrucao : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL PC : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL R1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL R2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RegWrite : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
COMPONENT cpu_offic
	PORT (
	ALU : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	AluSrc : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	end_R1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	end_R2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	instrucao : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
	PC : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	R1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RegWrite : OUT STD_LOGIC;
	RESET : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : cpu_offic
	PORT MAP (
-- list connections between master ports and signals
	ALU => ALU,
	AluSrc => AluSrc,
	CLK => CLK,
	end_R1 => end_R1,
	end_R2 => end_R2,
	instrucao => instrucao,
	PC => PC,
	R1 => R1,
	R2 => R2,
	RegWrite => RegWrite,
	RESET => RESET
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		CLK <= '0';
		WAIT FOR 75000 ps;
		CLK <= '1';
		WAIT FOR 75000 ps;
	END LOOP;
	CLK <= '0';
	WAIT FOR 75000 ps;
	CLK <= '1';
WAIT;
END PROCESS t_prcs_CLK;

-- RESET
t_prcs_RESET: PROCESS
BEGIN
	RESET <= '0';
WAIT;
END PROCESS t_prcs_RESET;
END cpu_offic_arch;
