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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "12/03/2024 23:18:56"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	cpu_offic IS
    PORT (
	RegWrite : OUT std_logic;
	CLK : IN std_logic;
	RESET : IN std_logic;
	Is_immediate : OUT std_logic;
	ALU : OUT std_logic_vector(7 DOWNTO 0);
	end_R1 : OUT std_logic_vector(1 DOWNTO 0);
	end_R2 : OUT std_logic_vector(1 DOWNTO 0);
	end_WR : OUT std_logic_vector(1 DOWNTO 0);
	Immediate : OUT std_logic_vector(7 DOWNTO 0);
	instrucao : OUT std_logic_vector(16 DOWNTO 0);
	PC : OUT std_logic_vector(7 DOWNTO 0);
	R1 : OUT std_logic_vector(7 DOWNTO 0);
	R2 : OUT std_logic_vector(7 DOWNTO 0)
	);
END cpu_offic;

-- Design Ports Information
-- RegWrite	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Is_immediate	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[7]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[5]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[4]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[3]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[2]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[1]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU[0]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_R1[1]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_R1[0]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_R2[1]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_R2[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_WR[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- end_WR[0]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[7]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[6]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[5]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[4]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[3]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[2]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[1]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Immediate[0]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[16]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[15]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[14]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[13]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[12]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[11]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[10]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[9]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[8]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[7]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[6]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[5]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[4]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[3]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[2]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[1]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- instrucao[0]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[7]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[6]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[5]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[4]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[3]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[1]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[0]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[7]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[6]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[5]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[4]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[3]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[2]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[1]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[0]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[6]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[5]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[1]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[0]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF cpu_offic IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RegWrite : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_Is_immediate : std_logic;
SIGNAL ww_ALU : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_end_R1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_end_R2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_end_WR : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Immediate : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_instrucao : std_logic_vector(16 DOWNTO 0);
SIGNAL ww_PC : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_R1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_R2 : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \inst|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \inst8002|Add0~29_sumout\ : std_logic;
SIGNAL \inst8002|Add0~30\ : std_logic;
SIGNAL \inst8002|Add0~25_sumout\ : std_logic;
SIGNAL \inst8002|Add0~26\ : std_logic;
SIGNAL \inst8002|Add0~21_sumout\ : std_logic;
SIGNAL \inst8002|Add0~22\ : std_logic;
SIGNAL \inst8002|Add0~17_sumout\ : std_logic;
SIGNAL \inst8002|Add0~18\ : std_logic;
SIGNAL \inst8002|Add0~13_sumout\ : std_logic;
SIGNAL \inst8002|Add0~14\ : std_logic;
SIGNAL \inst8002|Add0~9_sumout\ : std_logic;
SIGNAL \inst8002|Add0~10\ : std_logic;
SIGNAL \inst8002|Add0~5_sumout\ : std_logic;
SIGNAL \inst8002|Add0~6\ : std_logic;
SIGNAL \inst8002|Add0~1_sumout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \zero~feeder_combout\ : std_logic;
SIGNAL \inst25|Mux4~0_combout\ : std_logic;
SIGNAL \inst25|Mux5~0_combout\ : std_logic;
SIGNAL \inst25|Mux3~0_combout\ : std_logic;
SIGNAL \inst890000|Mux10~0_combout\ : std_logic;
SIGNAL \inst5|Dem|output_0~0_combout\ : std_logic;
SIGNAL \inst5|Dem|output_1~0_combout\ : std_logic;
SIGNAL \inst5|Dem|output_3~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux1~0_combout\ : std_logic;
SIGNAL \inst25|Mux6~0_combout\ : std_logic;
SIGNAL \inst890000|Mux6~1_combout\ : std_logic;
SIGNAL \inst890000|Mux1~0_combout\ : std_logic;
SIGNAL \inst890000|Mux6~0_combout\ : std_logic;
SIGNAL \inst890000|Mux0~1_combout\ : std_logic;
SIGNAL \inst890000|Mux1~1_combout\ : std_logic;
SIGNAL \inst5|register_r_2|d_out[5]~feeder_combout\ : std_logic;
SIGNAL \inst5|Dem|output_2~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux2~0_combout\ : std_logic;
SIGNAL \inst890000|Mux2~0_combout\ : std_logic;
SIGNAL \inst890000|Mux2~1_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux3~0_combout\ : std_logic;
SIGNAL \inst890000|Mux3~1_combout\ : std_logic;
SIGNAL \inst890000|Mux6~2_combout\ : std_logic;
SIGNAL \inst890000|Mux0~4_combout\ : std_logic;
SIGNAL \inst890000|Mux3~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux4~0_combout\ : std_logic;
SIGNAL \inst890000|Mux4~0_combout\ : std_logic;
SIGNAL \inst890000|Mux4~1_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux5~0_combout\ : std_logic;
SIGNAL \inst890000|Mux5~0_combout\ : std_logic;
SIGNAL \inst890000|Mux5~1_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux6~0_combout\ : std_logic;
SIGNAL \inst890000|Mux6~3_combout\ : std_logic;
SIGNAL \inst890000|Mux6~4_combout\ : std_logic;
SIGNAL \inst8|Y[0]~0_combout\ : std_logic;
SIGNAL \inst5|register_r_2|d_out[0]~feeder_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux7~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~34_cout\ : std_logic;
SIGNAL \inst890000|Add0~29_sumout\ : std_logic;
SIGNAL \inst890000|Mux7~0_combout\ : std_logic;
SIGNAL \inst890000|Mux7~1_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux7~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~30\ : std_logic;
SIGNAL \inst890000|Add0~25_sumout\ : std_logic;
SIGNAL \inst890000|Mux6~5_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux6~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~26\ : std_logic;
SIGNAL \inst890000|Add0~21_sumout\ : std_logic;
SIGNAL \inst890000|Mux5~2_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux5~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~22\ : std_logic;
SIGNAL \inst890000|Add0~17_sumout\ : std_logic;
SIGNAL \inst890000|Mux4~2_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux4~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~18\ : std_logic;
SIGNAL \inst890000|Add0~13_sumout\ : std_logic;
SIGNAL \inst890000|Mux3~2_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux3~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~14\ : std_logic;
SIGNAL \inst890000|Add0~9_sumout\ : std_logic;
SIGNAL \inst890000|Mux2~2_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux2~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~10\ : std_logic;
SIGNAL \inst890000|Add0~5_sumout\ : std_logic;
SIGNAL \inst890000|Mux1~2_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux1~0_combout\ : std_logic;
SIGNAL \inst8|Y[6]~1_combout\ : std_logic;
SIGNAL \inst890000|Mux1~3_combout\ : std_logic;
SIGNAL \inst8|Y[5]~2_combout\ : std_logic;
SIGNAL \inst890000|Mux2~3_combout\ : std_logic;
SIGNAL \inst14~0_combout\ : std_logic;
SIGNAL \inst890000|Mux7~2_combout\ : std_logic;
SIGNAL \inst5|Mux2|Mux0~0_combout\ : std_logic;
SIGNAL \inst890000|Mux0~2_combout\ : std_logic;
SIGNAL \inst890000|Mux0~0_combout\ : std_logic;
SIGNAL \inst890000|Mux0~3_combout\ : std_logic;
SIGNAL \inst5|Mux1|Mux0~0_combout\ : std_logic;
SIGNAL \inst890000|Add0~6\ : std_logic;
SIGNAL \inst890000|Add0~1_sumout\ : std_logic;
SIGNAL \inst8|Y[7]~3_combout\ : std_logic;
SIGNAL \inst890000|Mux0~5_combout\ : std_logic;
SIGNAL \inst14~1_combout\ : std_logic;
SIGNAL \inst14~combout\ : std_logic;
SIGNAL \zero~q\ : std_logic;
SIGNAL \Sinal~feeder_combout\ : std_logic;
SIGNAL \inst890000|Mux0~6_combout\ : std_logic;
SIGNAL \inst890000|Sinal~combout\ : std_logic;
SIGNAL \Sinal~q\ : std_logic;
SIGNAL \inst12~0_combout\ : std_logic;
SIGNAL \inst25|Mux0~0_combout\ : std_logic;
SIGNAL \inst5|register_a_2|d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|q_a\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \inst5|register_r_2|d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst8002|pc\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst5|register_b_2|d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst5|register_0_2|d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst8002|ALT_INV_pc\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst890000|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_q_a\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \inst890000|ALT_INV_Mux0~6_combout\ : std_logic;
SIGNAL \ALT_INV_inst14~combout\ : std_logic;
SIGNAL \ALT_INV_inst14~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux0~5_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_Y[7]~3_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \ALT_INV_inst14~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux2~3_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_Y[5]~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_Y[6]~1_combout\ : std_logic;
SIGNAL \ALT_INV_zero~q\ : std_logic;
SIGNAL \ALT_INV_Sinal~q\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_Y[0]~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst5|register_0_2|ALT_INV_d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst5|register_r_2|ALT_INV_d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst5|register_b_2|ALT_INV_d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst5|register_a_2|ALT_INV_d_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst890000|ALT_INV_Mux6~5_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux6~4_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux6~3_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux5~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux4~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux3~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux6~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux2~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \inst5|Mux2|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst5|Mux1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst890000|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst25|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst25|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst25|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst25|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst25|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_RESET~input_o\ : std_logic;
SIGNAL \inst890000|ALT_INV_Sinal~combout\ : std_logic;

BEGIN

RegWrite <= ww_RegWrite;
ww_CLK <= CLK;
ww_RESET <= RESET;
Is_immediate <= ww_Is_immediate;
ALU <= ww_ALU;
end_R1 <= ww_end_R1;
end_R2 <= ww_end_R2;
end_WR <= ww_end_WR;
Immediate <= ww_Immediate;
instrucao <= ww_instrucao;
PC <= ww_PC;
R1 <= ww_R1;
R2 <= ww_R2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\inst|ram_block1a0_PORTAADDR_bus\ <= (\inst8002|pc\(7) & \inst8002|pc\(6) & \inst8002|pc\(5) & \inst8002|pc\(4) & \inst8002|pc\(3) & \inst8002|pc\(2) & \inst8002|pc\(1) & \inst8002|pc\(0));

\inst|q_a\(0) <= \inst|ram_block1a0_PORTADATAOUT_bus\(0);
\inst|q_a\(1) <= \inst|ram_block1a0_PORTADATAOUT_bus\(1);
\inst|q_a\(2) <= \inst|ram_block1a0_PORTADATAOUT_bus\(2);
\inst|q_a\(3) <= \inst|ram_block1a0_PORTADATAOUT_bus\(3);
\inst|q_a\(4) <= \inst|ram_block1a0_PORTADATAOUT_bus\(4);
\inst|q_a\(5) <= \inst|ram_block1a0_PORTADATAOUT_bus\(5);
\inst|q_a\(6) <= \inst|ram_block1a0_PORTADATAOUT_bus\(6);
\inst|q_a\(7) <= \inst|ram_block1a0_PORTADATAOUT_bus\(7);
\inst|q_a\(8) <= \inst|ram_block1a0_PORTADATAOUT_bus\(8);
\inst|q_a\(9) <= \inst|ram_block1a0_PORTADATAOUT_bus\(9);
\inst|q_a\(10) <= \inst|ram_block1a0_PORTADATAOUT_bus\(10);
\inst|q_a\(11) <= \inst|ram_block1a0_PORTADATAOUT_bus\(11);
\inst|q_a\(12) <= \inst|ram_block1a0_PORTADATAOUT_bus\(12);
\inst|q_a\(13) <= \inst|ram_block1a0_PORTADATAOUT_bus\(13);
\inst|q_a\(14) <= \inst|ram_block1a0_PORTADATAOUT_bus\(14);
\inst|q_a\(15) <= \inst|ram_block1a0_PORTADATAOUT_bus\(15);
\inst|q_a\(16) <= \inst|ram_block1a0_PORTADATAOUT_bus\(16);
\inst8002|ALT_INV_pc\(7) <= NOT \inst8002|pc\(7);
\inst890000|ALT_INV_Add0~29_sumout\ <= NOT \inst890000|Add0~29_sumout\;
\inst890000|ALT_INV_Add0~25_sumout\ <= NOT \inst890000|Add0~25_sumout\;
\inst890000|ALT_INV_Add0~21_sumout\ <= NOT \inst890000|Add0~21_sumout\;
\inst890000|ALT_INV_Add0~17_sumout\ <= NOT \inst890000|Add0~17_sumout\;
\inst890000|ALT_INV_Add0~13_sumout\ <= NOT \inst890000|Add0~13_sumout\;
\inst890000|ALT_INV_Add0~9_sumout\ <= NOT \inst890000|Add0~9_sumout\;
\inst890000|ALT_INV_Add0~5_sumout\ <= NOT \inst890000|Add0~5_sumout\;
\inst890000|ALT_INV_Add0~1_sumout\ <= NOT \inst890000|Add0~1_sumout\;
\inst|ALT_INV_q_a\(1) <= NOT \inst|q_a\(1);
\inst|ALT_INV_q_a\(2) <= NOT \inst|q_a\(2);
\inst|ALT_INV_q_a\(3) <= NOT \inst|q_a\(3);
\inst|ALT_INV_q_a\(4) <= NOT \inst|q_a\(4);
\inst|ALT_INV_q_a\(5) <= NOT \inst|q_a\(5);
\inst|ALT_INV_q_a\(6) <= NOT \inst|q_a\(6);
\inst|ALT_INV_q_a\(7) <= NOT \inst|q_a\(7);
\inst|ALT_INV_q_a\(8) <= NOT \inst|q_a\(8);
\inst|ALT_INV_q_a\(9) <= NOT \inst|q_a\(9);
\inst|ALT_INV_q_a\(10) <= NOT \inst|q_a\(10);
\inst|ALT_INV_q_a\(11) <= NOT \inst|q_a\(11);
\inst|ALT_INV_q_a\(12) <= NOT \inst|q_a\(12);
\inst|ALT_INV_q_a\(13) <= NOT \inst|q_a\(13);
\inst|ALT_INV_q_a\(14) <= NOT \inst|q_a\(14);
\inst|ALT_INV_q_a\(15) <= NOT \inst|q_a\(15);
\inst|ALT_INV_q_a\(16) <= NOT \inst|q_a\(16);
\inst|ALT_INV_q_a\(0) <= NOT \inst|q_a\(0);
\inst890000|ALT_INV_Mux0~6_combout\ <= NOT \inst890000|Mux0~6_combout\;
\ALT_INV_inst14~combout\ <= NOT \inst14~combout\;
\ALT_INV_inst14~1_combout\ <= NOT \inst14~1_combout\;
\inst890000|ALT_INV_Mux0~5_combout\ <= NOT \inst890000|Mux0~5_combout\;
\inst8|ALT_INV_Y[7]~3_combout\ <= NOT \inst8|Y[7]~3_combout\;
\inst890000|ALT_INV_Mux7~2_combout\ <= NOT \inst890000|Mux7~2_combout\;
\ALT_INV_inst14~0_combout\ <= NOT \inst14~0_combout\;
\inst890000|ALT_INV_Mux2~3_combout\ <= NOT \inst890000|Mux2~3_combout\;
\inst8|ALT_INV_Y[5]~2_combout\ <= NOT \inst8|Y[5]~2_combout\;
\inst890000|ALT_INV_Mux1~3_combout\ <= NOT \inst890000|Mux1~3_combout\;
\inst8|ALT_INV_Y[6]~1_combout\ <= NOT \inst8|Y[6]~1_combout\;
\ALT_INV_zero~q\ <= NOT \zero~q\;
\ALT_INV_Sinal~q\ <= NOT \Sinal~q\;
\inst890000|ALT_INV_Mux7~1_combout\ <= NOT \inst890000|Mux7~1_combout\;
\inst890000|ALT_INV_Mux7~0_combout\ <= NOT \inst890000|Mux7~0_combout\;
\inst8|ALT_INV_Y[0]~0_combout\ <= NOT \inst8|Y[0]~0_combout\;
\inst5|Mux2|ALT_INV_Mux7~0_combout\ <= NOT \inst5|Mux2|Mux7~0_combout\;
\inst5|Mux1|ALT_INV_Mux7~0_combout\ <= NOT \inst5|Mux1|Mux7~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(0) <= NOT \inst5|register_0_2|d_out\(0);
\inst5|register_r_2|ALT_INV_d_out\(0) <= NOT \inst5|register_r_2|d_out\(0);
\inst5|register_b_2|ALT_INV_d_out\(0) <= NOT \inst5|register_b_2|d_out\(0);
\inst5|register_a_2|ALT_INV_d_out\(0) <= NOT \inst5|register_a_2|d_out\(0);
\inst890000|ALT_INV_Mux6~5_combout\ <= NOT \inst890000|Mux6~5_combout\;
\inst890000|ALT_INV_Mux6~4_combout\ <= NOT \inst890000|Mux6~4_combout\;
\inst890000|ALT_INV_Mux6~3_combout\ <= NOT \inst890000|Mux6~3_combout\;
\inst5|Mux2|ALT_INV_Mux6~0_combout\ <= NOT \inst5|Mux2|Mux6~0_combout\;
\inst5|Mux1|ALT_INV_Mux6~0_combout\ <= NOT \inst5|Mux1|Mux6~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(1) <= NOT \inst5|register_0_2|d_out\(1);
\inst5|register_r_2|ALT_INV_d_out\(1) <= NOT \inst5|register_r_2|d_out\(1);
\inst5|register_b_2|ALT_INV_d_out\(1) <= NOT \inst5|register_b_2|d_out\(1);
\inst5|register_a_2|ALT_INV_d_out\(1) <= NOT \inst5|register_a_2|d_out\(1);
\inst890000|ALT_INV_Mux5~2_combout\ <= NOT \inst890000|Mux5~2_combout\;
\inst890000|ALT_INV_Mux5~1_combout\ <= NOT \inst890000|Mux5~1_combout\;
\inst890000|ALT_INV_Mux5~0_combout\ <= NOT \inst890000|Mux5~0_combout\;
\inst5|Mux2|ALT_INV_Mux5~0_combout\ <= NOT \inst5|Mux2|Mux5~0_combout\;
\inst5|Mux1|ALT_INV_Mux5~0_combout\ <= NOT \inst5|Mux1|Mux5~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(2) <= NOT \inst5|register_0_2|d_out\(2);
\inst5|register_r_2|ALT_INV_d_out\(2) <= NOT \inst5|register_r_2|d_out\(2);
\inst5|register_b_2|ALT_INV_d_out\(2) <= NOT \inst5|register_b_2|d_out\(2);
\inst5|register_a_2|ALT_INV_d_out\(2) <= NOT \inst5|register_a_2|d_out\(2);
\inst890000|ALT_INV_Mux4~2_combout\ <= NOT \inst890000|Mux4~2_combout\;
\inst890000|ALT_INV_Mux4~1_combout\ <= NOT \inst890000|Mux4~1_combout\;
\inst890000|ALT_INV_Mux4~0_combout\ <= NOT \inst890000|Mux4~0_combout\;
\inst5|Mux2|ALT_INV_Mux4~0_combout\ <= NOT \inst5|Mux2|Mux4~0_combout\;
\inst5|Mux1|ALT_INV_Mux4~0_combout\ <= NOT \inst5|Mux1|Mux4~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(3) <= NOT \inst5|register_0_2|d_out\(3);
\inst5|register_r_2|ALT_INV_d_out\(3) <= NOT \inst5|register_r_2|d_out\(3);
\inst5|register_b_2|ALT_INV_d_out\(3) <= NOT \inst5|register_b_2|d_out\(3);
\inst5|register_a_2|ALT_INV_d_out\(3) <= NOT \inst5|register_a_2|d_out\(3);
\inst890000|ALT_INV_Mux3~2_combout\ <= NOT \inst890000|Mux3~2_combout\;
\inst890000|ALT_INV_Mux3~1_combout\ <= NOT \inst890000|Mux3~1_combout\;
\inst890000|ALT_INV_Mux3~0_combout\ <= NOT \inst890000|Mux3~0_combout\;
\inst5|Mux2|ALT_INV_Mux3~0_combout\ <= NOT \inst5|Mux2|Mux3~0_combout\;
\inst5|Mux1|ALT_INV_Mux3~0_combout\ <= NOT \inst5|Mux1|Mux3~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(4) <= NOT \inst5|register_0_2|d_out\(4);
\inst5|register_r_2|ALT_INV_d_out\(4) <= NOT \inst5|register_r_2|d_out\(4);
\inst5|register_b_2|ALT_INV_d_out\(4) <= NOT \inst5|register_b_2|d_out\(4);
\inst5|register_a_2|ALT_INV_d_out\(4) <= NOT \inst5|register_a_2|d_out\(4);
\inst890000|ALT_INV_Mux0~4_combout\ <= NOT \inst890000|Mux0~4_combout\;
\inst890000|ALT_INV_Mux6~2_combout\ <= NOT \inst890000|Mux6~2_combout\;
\inst890000|ALT_INV_Mux2~2_combout\ <= NOT \inst890000|Mux2~2_combout\;
\inst890000|ALT_INV_Mux2~1_combout\ <= NOT \inst890000|Mux2~1_combout\;
\inst890000|ALT_INV_Mux2~0_combout\ <= NOT \inst890000|Mux2~0_combout\;
\inst5|Mux2|ALT_INV_Mux2~0_combout\ <= NOT \inst5|Mux2|Mux2~0_combout\;
\inst5|Mux1|ALT_INV_Mux2~0_combout\ <= NOT \inst5|Mux1|Mux2~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(5) <= NOT \inst5|register_0_2|d_out\(5);
\inst5|register_r_2|ALT_INV_d_out\(5) <= NOT \inst5|register_r_2|d_out\(5);
\inst5|register_b_2|ALT_INV_d_out\(5) <= NOT \inst5|register_b_2|d_out\(5);
\inst5|register_a_2|ALT_INV_d_out\(5) <= NOT \inst5|register_a_2|d_out\(5);
\inst890000|ALT_INV_Mux1~1_combout\ <= NOT \inst890000|Mux1~1_combout\;
\inst890000|ALT_INV_Mux1~0_combout\ <= NOT \inst890000|Mux1~0_combout\;
\inst5|Mux2|ALT_INV_Mux1~0_combout\ <= NOT \inst5|Mux2|Mux1~0_combout\;
\inst5|Mux1|ALT_INV_Mux1~0_combout\ <= NOT \inst5|Mux1|Mux1~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(6) <= NOT \inst5|register_0_2|d_out\(6);
\inst5|register_r_2|ALT_INV_d_out\(6) <= NOT \inst5|register_r_2|d_out\(6);
\inst5|register_b_2|ALT_INV_d_out\(6) <= NOT \inst5|register_b_2|d_out\(6);
\inst5|register_a_2|ALT_INV_d_out\(6) <= NOT \inst5|register_a_2|d_out\(6);
\inst890000|ALT_INV_Mux0~2_combout\ <= NOT \inst890000|Mux0~2_combout\;
\inst890000|ALT_INV_Mux0~1_combout\ <= NOT \inst890000|Mux0~1_combout\;
\inst890000|ALT_INV_Mux10~0_combout\ <= NOT \inst890000|Mux10~0_combout\;
\inst890000|ALT_INV_Mux0~0_combout\ <= NOT \inst890000|Mux0~0_combout\;
\inst890000|ALT_INV_Mux6~1_combout\ <= NOT \inst890000|Mux6~1_combout\;
\inst5|Mux2|ALT_INV_Mux0~0_combout\ <= NOT \inst5|Mux2|Mux0~0_combout\;
\inst5|Mux1|ALT_INV_Mux0~0_combout\ <= NOT \inst5|Mux1|Mux0~0_combout\;
\inst5|register_0_2|ALT_INV_d_out\(7) <= NOT \inst5|register_0_2|d_out\(7);
\inst5|register_r_2|ALT_INV_d_out\(7) <= NOT \inst5|register_r_2|d_out\(7);
\inst5|register_b_2|ALT_INV_d_out\(7) <= NOT \inst5|register_b_2|d_out\(7);
\inst5|register_a_2|ALT_INV_d_out\(7) <= NOT \inst5|register_a_2|d_out\(7);
\inst890000|ALT_INV_Mux6~0_combout\ <= NOT \inst890000|Mux6~0_combout\;
\inst25|ALT_INV_Mux3~0_combout\ <= NOT \inst25|Mux3~0_combout\;
\inst25|ALT_INV_Mux5~0_combout\ <= NOT \inst25|Mux5~0_combout\;
\inst25|ALT_INV_Mux6~0_combout\ <= NOT \inst25|Mux6~0_combout\;
\inst25|ALT_INV_Mux4~0_combout\ <= NOT \inst25|Mux4~0_combout\;
\inst25|ALT_INV_Mux0~0_combout\ <= NOT \inst25|Mux0~0_combout\;
\inst8002|ALT_INV_pc\(0) <= NOT \inst8002|pc\(0);
\inst8002|ALT_INV_pc\(1) <= NOT \inst8002|pc\(1);
\inst8002|ALT_INV_pc\(2) <= NOT \inst8002|pc\(2);
\inst8002|ALT_INV_pc\(3) <= NOT \inst8002|pc\(3);
\inst8002|ALT_INV_pc\(4) <= NOT \inst8002|pc\(4);
\inst8002|ALT_INV_pc\(5) <= NOT \inst8002|pc\(5);
\inst8002|ALT_INV_pc\(6) <= NOT \inst8002|pc\(6);
\ALT_INV_RESET~input_o\ <= NOT \RESET~input_o\;
\inst890000|ALT_INV_Sinal~combout\ <= NOT \inst890000|Sinal~combout\;

-- Location: IOOBUF_X34_Y0_N2
\RegWrite~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst25|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_RegWrite);

-- Location: IOOBUF_X16_Y0_N59
\Is_immediate~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(12),
	devoe => ww_devoe,
	o => ww_Is_immediate);

-- Location: IOOBUF_X34_Y0_N36
\ALU[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux0~3_combout\,
	devoe => ww_devoe,
	o => ww_ALU(7));

-- Location: IOOBUF_X25_Y0_N19
\ALU[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux1~2_combout\,
	devoe => ww_devoe,
	o => ww_ALU(6));

-- Location: IOOBUF_X22_Y0_N2
\ALU[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux2~2_combout\,
	devoe => ww_devoe,
	o => ww_ALU(5));

-- Location: IOOBUF_X23_Y0_N59
\ALU[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux3~2_combout\,
	devoe => ww_devoe,
	o => ww_ALU(4));

-- Location: IOOBUF_X14_Y0_N36
\ALU[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux4~2_combout\,
	devoe => ww_devoe,
	o => ww_ALU(3));

-- Location: IOOBUF_X10_Y0_N42
\ALU[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux5~2_combout\,
	devoe => ww_devoe,
	o => ww_ALU(2));

-- Location: IOOBUF_X16_Y0_N93
\ALU[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux6~5_combout\,
	devoe => ww_devoe,
	o => ww_ALU(1));

-- Location: IOOBUF_X23_Y0_N42
\ALU[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst890000|Mux7~1_combout\,
	devoe => ww_devoe,
	o => ww_ALU(0));

-- Location: IOOBUF_X23_Y0_N93
\end_R1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(9),
	devoe => ww_devoe,
	o => ww_end_R1(1));

-- Location: IOOBUF_X19_Y0_N53
\end_R1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(8),
	devoe => ww_devoe,
	o => ww_end_R1(0));

-- Location: IOOBUF_X29_Y0_N2
\end_R2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(1),
	devoe => ww_devoe,
	o => ww_end_R2(1));

-- Location: IOOBUF_X14_Y45_N53
\end_R2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(0),
	devoe => ww_devoe,
	o => ww_end_R2(0));

-- Location: IOOBUF_X16_Y45_N76
\end_WR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(11),
	devoe => ww_devoe,
	o => ww_end_WR(1));

-- Location: IOOBUF_X25_Y0_N2
\end_WR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(10),
	devoe => ww_devoe,
	o => ww_end_WR(0));

-- Location: IOOBUF_X25_Y0_N36
\Immediate[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(7),
	devoe => ww_devoe,
	o => ww_Immediate(7));

-- Location: IOOBUF_X29_Y0_N36
\Immediate[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(6),
	devoe => ww_devoe,
	o => ww_Immediate(6));

-- Location: IOOBUF_X24_Y0_N2
\Immediate[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(5),
	devoe => ww_devoe,
	o => ww_Immediate(5));

-- Location: IOOBUF_X11_Y0_N36
\Immediate[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(4),
	devoe => ww_devoe,
	o => ww_Immediate(4));

-- Location: IOOBUF_X36_Y0_N2
\Immediate[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(3),
	devoe => ww_devoe,
	o => ww_Immediate(3));

-- Location: IOOBUF_X33_Y0_N76
\Immediate[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(2),
	devoe => ww_devoe,
	o => ww_Immediate(2));

-- Location: IOOBUF_X33_Y0_N93
\Immediate[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(1),
	devoe => ww_devoe,
	o => ww_Immediate(1));

-- Location: IOOBUF_X10_Y45_N36
\Immediate[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(0),
	devoe => ww_devoe,
	o => ww_Immediate(0));

-- Location: IOOBUF_X12_Y0_N19
\instrucao[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(16),
	devoe => ww_devoe,
	o => ww_instrucao(16));

-- Location: IOOBUF_X18_Y0_N36
\instrucao[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(15),
	devoe => ww_devoe,
	o => ww_instrucao(15));

-- Location: IOOBUF_X22_Y0_N19
\instrucao[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(14),
	devoe => ww_devoe,
	o => ww_instrucao(14));

-- Location: IOOBUF_X14_Y0_N19
\instrucao[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(13),
	devoe => ww_devoe,
	o => ww_instrucao(13));

-- Location: IOOBUF_X16_Y0_N76
\instrucao[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(12),
	devoe => ww_devoe,
	o => ww_instrucao(12));

-- Location: IOOBUF_X16_Y45_N42
\instrucao[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(11),
	devoe => ww_devoe,
	o => ww_instrucao(11));

-- Location: IOOBUF_X34_Y0_N53
\instrucao[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(10),
	devoe => ww_devoe,
	o => ww_instrucao(10));

-- Location: IOOBUF_X23_Y0_N76
\instrucao[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(9),
	devoe => ww_devoe,
	o => ww_instrucao(9));

-- Location: IOOBUF_X19_Y0_N36
\instrucao[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(8),
	devoe => ww_devoe,
	o => ww_instrucao(8));

-- Location: IOOBUF_X25_Y0_N53
\instrucao[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(7),
	devoe => ww_devoe,
	o => ww_instrucao(7));

-- Location: IOOBUF_X29_Y0_N53
\instrucao[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(6),
	devoe => ww_devoe,
	o => ww_instrucao(6));

-- Location: IOOBUF_X24_Y0_N36
\instrucao[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(5),
	devoe => ww_devoe,
	o => ww_instrucao(5));

-- Location: IOOBUF_X11_Y0_N2
\instrucao[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(4),
	devoe => ww_devoe,
	o => ww_instrucao(4));

-- Location: IOOBUF_X36_Y0_N53
\instrucao[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(3),
	devoe => ww_devoe,
	o => ww_instrucao(3));

-- Location: IOOBUF_X33_Y0_N42
\instrucao[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(2),
	devoe => ww_devoe,
	o => ww_instrucao(2));

-- Location: IOOBUF_X29_Y0_N19
\instrucao[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(1),
	devoe => ww_devoe,
	o => ww_instrucao(1));

-- Location: IOOBUF_X14_Y45_N19
\instrucao[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|q_a\(0),
	devoe => ww_devoe,
	o => ww_instrucao(0));

-- Location: IOOBUF_X12_Y0_N36
\PC[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(7),
	devoe => ww_devoe,
	o => ww_PC(7));

-- Location: IOOBUF_X0_Y18_N96
\PC[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(6),
	devoe => ww_devoe,
	o => ww_PC(6));

-- Location: IOOBUF_X11_Y0_N19
\PC[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(5),
	devoe => ww_devoe,
	o => ww_PC(5));

-- Location: IOOBUF_X0_Y19_N22
\PC[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(4),
	devoe => ww_devoe,
	o => ww_PC(4));

-- Location: IOOBUF_X11_Y0_N53
\PC[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(3),
	devoe => ww_devoe,
	o => ww_PC(3));

-- Location: IOOBUF_X40_Y0_N93
\PC[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(2),
	devoe => ww_devoe,
	o => ww_PC(2));

-- Location: IOOBUF_X12_Y0_N2
\PC[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(1),
	devoe => ww_devoe,
	o => ww_PC(1));

-- Location: IOOBUF_X10_Y0_N76
\PC[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8002|pc\(0),
	devoe => ww_devoe,
	o => ww_PC(0));

-- Location: IOOBUF_X19_Y0_N19
\R1[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(7));

-- Location: IOOBUF_X16_Y0_N42
\R1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(6));

-- Location: IOOBUF_X14_Y0_N53
\R1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(5));

-- Location: IOOBUF_X19_Y0_N2
\R1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(4));

-- Location: IOOBUF_X10_Y0_N59
\R1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(3));

-- Location: IOOBUF_X12_Y0_N53
\R1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(2));

-- Location: IOOBUF_X24_Y0_N19
\R1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(1));

-- Location: IOOBUF_X22_Y0_N53
\R1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_R1(0));

-- Location: IOOBUF_X18_Y0_N2
\R2[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(7));

-- Location: IOOBUF_X18_Y0_N53
\R2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(6));

-- Location: IOOBUF_X24_Y0_N53
\R2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(5));

-- Location: IOOBUF_X16_Y45_N59
\R2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(4));

-- Location: IOOBUF_X14_Y0_N2
\R2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(3));

-- Location: IOOBUF_X0_Y18_N62
\R2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(2));

-- Location: IOOBUF_X10_Y0_N93
\R2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(1));

-- Location: IOOBUF_X22_Y0_N36
\R2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_R2(0));

-- Location: IOIBUF_X54_Y18_N61
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G10
\CLK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~input_o\,
	outclk => \CLK~inputCLKENA0_outclk\);

-- Location: LABCELL_X10_Y4_N36
\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LABCELL_X12_Y3_N30
\inst8002|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~29_sumout\ = SUM(( \inst8002|pc\(0) ) + ( VCC ) + ( !VCC ))
-- \inst8002|Add0~30\ = CARRY(( \inst8002|pc\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(0),
	cin => GND,
	sumout => \inst8002|Add0~29_sumout\,
	cout => \inst8002|Add0~30\);

-- Location: LABCELL_X12_Y3_N33
\inst8002|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~25_sumout\ = SUM(( \inst8002|pc\(1) ) + ( GND ) + ( \inst8002|Add0~30\ ))
-- \inst8002|Add0~26\ = CARRY(( \inst8002|pc\(1) ) + ( GND ) + ( \inst8002|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(1),
	cin => \inst8002|Add0~30\,
	sumout => \inst8002|Add0~25_sumout\,
	cout => \inst8002|Add0~26\);

-- Location: LABCELL_X12_Y3_N36
\inst8002|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~21_sumout\ = SUM(( \inst8002|pc\(2) ) + ( GND ) + ( \inst8002|Add0~26\ ))
-- \inst8002|Add0~22\ = CARRY(( \inst8002|pc\(2) ) + ( GND ) + ( \inst8002|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(2),
	cin => \inst8002|Add0~26\,
	sumout => \inst8002|Add0~21_sumout\,
	cout => \inst8002|Add0~22\);

-- Location: LABCELL_X12_Y3_N39
\inst8002|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~17_sumout\ = SUM(( \inst8002|pc\(3) ) + ( GND ) + ( \inst8002|Add0~22\ ))
-- \inst8002|Add0~18\ = CARRY(( \inst8002|pc\(3) ) + ( GND ) + ( \inst8002|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(3),
	cin => \inst8002|Add0~22\,
	sumout => \inst8002|Add0~17_sumout\,
	cout => \inst8002|Add0~18\);

-- Location: LABCELL_X12_Y3_N42
\inst8002|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~13_sumout\ = SUM(( \inst8002|pc\(4) ) + ( GND ) + ( \inst8002|Add0~18\ ))
-- \inst8002|Add0~14\ = CARRY(( \inst8002|pc\(4) ) + ( GND ) + ( \inst8002|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(4),
	cin => \inst8002|Add0~18\,
	sumout => \inst8002|Add0~13_sumout\,
	cout => \inst8002|Add0~14\);

-- Location: LABCELL_X12_Y3_N45
\inst8002|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~9_sumout\ = SUM(( \inst8002|pc\(5) ) + ( GND ) + ( \inst8002|Add0~14\ ))
-- \inst8002|Add0~10\ = CARRY(( \inst8002|pc\(5) ) + ( GND ) + ( \inst8002|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(5),
	cin => \inst8002|Add0~14\,
	sumout => \inst8002|Add0~9_sumout\,
	cout => \inst8002|Add0~10\);

-- Location: LABCELL_X12_Y3_N48
\inst8002|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~5_sumout\ = SUM(( \inst8002|pc\(6) ) + ( GND ) + ( \inst8002|Add0~10\ ))
-- \inst8002|Add0~6\ = CARRY(( \inst8002|pc\(6) ) + ( GND ) + ( \inst8002|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(6),
	cin => \inst8002|Add0~10\,
	sumout => \inst8002|Add0~5_sumout\,
	cout => \inst8002|Add0~6\);

-- Location: LABCELL_X12_Y3_N51
\inst8002|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8002|Add0~1_sumout\ = SUM(( \inst8002|pc\(7) ) + ( GND ) + ( \inst8002|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst8002|ALT_INV_pc\(7),
	cin => \inst8002|Add0~6\,
	sumout => \inst8002|Add0~1_sumout\);

-- Location: M10K_X11_Y4_N0
\inst|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000080217301",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "instrucoes.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram_dj24:inst|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 20,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 17,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 8,
	port_b_data_width => 20,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \CLK~inputCLKENA0_outclk\,
	portadatain => \inst|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \inst|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X18_Y0_N18
\RESET~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: MLABCELL_X13_Y4_N21
\zero~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \zero~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \zero~feeder_combout\);

-- Location: MLABCELL_X13_Y4_N42
\inst25|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst25|Mux4~0_combout\ = ( \inst|q_a\(16) & ( (!\inst|q_a\(15) & (\inst|q_a\(14) & \inst|q_a\(13))) ) ) # ( !\inst|q_a\(16) & ( !\inst|q_a\(15) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_q_a\(15),
	datac => \inst|ALT_INV_q_a\(14),
	datad => \inst|ALT_INV_q_a\(13),
	dataf => \inst|ALT_INV_q_a\(16),
	combout => \inst25|Mux4~0_combout\);

-- Location: MLABCELL_X13_Y4_N48
\inst25|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst25|Mux5~0_combout\ = ( \inst|q_a\(16) & ( (!\inst|q_a\(15) & (\inst|q_a\(14) & \inst|q_a\(13))) ) ) # ( !\inst|q_a\(16) & ( (!\inst|q_a\(14) & ((!\inst|q_a\(15)) # (!\inst|q_a\(13)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011000000111100001100000000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_q_a\(15),
	datac => \inst|ALT_INV_q_a\(14),
	datad => \inst|ALT_INV_q_a\(13),
	dataf => \inst|ALT_INV_q_a\(16),
	combout => \inst25|Mux5~0_combout\);

-- Location: MLABCELL_X13_Y4_N33
\inst25|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst25|Mux3~0_combout\ = ( \inst|q_a\(16) & ( (\inst|q_a\(14) & (\inst|q_a\(13) & !\inst|q_a\(15))) ) ) # ( !\inst|q_a\(16) & ( (!\inst|q_a\(15)) # ((!\inst|q_a\(14) & !\inst|q_a\(13))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110100000111111111010000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(14),
	datac => \inst|ALT_INV_q_a\(13),
	datad => \inst|ALT_INV_q_a\(15),
	dataf => \inst|ALT_INV_q_a\(16),
	combout => \inst25|Mux3~0_combout\);

-- Location: MLABCELL_X13_Y4_N15
\inst890000|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux10~0_combout\ = ( \inst25|Mux3~0_combout\ & ( (\inst25|Mux4~0_combout\ & \inst25|Mux5~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst25|ALT_INV_Mux4~0_combout\,
	datad => \inst25|ALT_INV_Mux5~0_combout\,
	dataf => \inst25|ALT_INV_Mux3~0_combout\,
	combout => \inst890000|Mux10~0_combout\);

-- Location: LABCELL_X16_Y4_N9
\inst5|Dem|output_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Dem|output_0~0_combout\ = ( !\inst|q_a\(11) & ( !\inst25|Mux0~0_combout\ & ( !\inst|q_a\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_q_a\(10),
	datae => \inst|ALT_INV_q_a\(11),
	dataf => \inst25|ALT_INV_Mux0~0_combout\,
	combout => \inst5|Dem|output_0~0_combout\);

-- Location: FF_X16_Y4_N37
\inst5|register_a_2|d_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux1~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(6));

-- Location: LABCELL_X16_Y4_N51
\inst5|Dem|output_1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Dem|output_1~0_combout\ = ( !\inst|q_a\(11) & ( !\inst25|Mux0~0_combout\ & ( \inst|q_a\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_q_a\(10),
	datae => \inst|ALT_INV_q_a\(11),
	dataf => \inst25|ALT_INV_Mux0~0_combout\,
	combout => \inst5|Dem|output_1~0_combout\);

-- Location: FF_X17_Y4_N14
\inst5|register_b_2|d_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux1~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(6));

-- Location: LABCELL_X17_Y4_N3
\inst5|Dem|output_3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Dem|output_3~0_combout\ = ( !\inst25|Mux0~0_combout\ & ( (\inst|q_a\(11) & \inst|q_a\(10)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_q_a\(11),
	datad => \inst|ALT_INV_q_a\(10),
	dataf => \inst25|ALT_INV_Mux0~0_combout\,
	combout => \inst5|Dem|output_3~0_combout\);

-- Location: FF_X17_Y4_N59
\inst5|register_0_2|d_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst890000|Mux1~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(6));

-- Location: LABCELL_X16_Y4_N54
\inst5|Mux2|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux1~0_combout\ = ( \inst|q_a\(1) & ( \inst5|register_0_2|d_out\(6) & ( (\inst|q_a\(0)) # (\inst5|register_r_2|d_out\(6)) ) ) ) # ( !\inst|q_a\(1) & ( \inst5|register_0_2|d_out\(6) & ( (!\inst|q_a\(0) & (\inst5|register_a_2|d_out\(6))) # 
-- (\inst|q_a\(0) & ((\inst5|register_b_2|d_out\(6)))) ) ) ) # ( \inst|q_a\(1) & ( !\inst5|register_0_2|d_out\(6) & ( (\inst5|register_r_2|d_out\(6) & !\inst|q_a\(0)) ) ) ) # ( !\inst|q_a\(1) & ( !\inst5|register_0_2|d_out\(6) & ( (!\inst|q_a\(0) & 
-- (\inst5|register_a_2|d_out\(6))) # (\inst|q_a\(0) & ((\inst5|register_b_2|d_out\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100110011000011110000000001010101001100110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_a_2|ALT_INV_d_out\(6),
	datab => \inst5|register_b_2|ALT_INV_d_out\(6),
	datac => \inst5|register_r_2|ALT_INV_d_out\(6),
	datad => \inst|ALT_INV_q_a\(0),
	datae => \inst|ALT_INV_q_a\(1),
	dataf => \inst5|register_0_2|ALT_INV_d_out\(6),
	combout => \inst5|Mux2|Mux1~0_combout\);

-- Location: LABCELL_X12_Y4_N18
\inst25|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst25|Mux6~0_combout\ = ( \inst|q_a\(15) & ( \inst|q_a\(14) ) ) # ( !\inst|q_a\(15) & ( \inst|q_a\(14) & ( !\inst|q_a\(13) $ (!\inst|q_a\(16)) ) ) ) # ( \inst|q_a\(15) & ( !\inst|q_a\(14) & ( (\inst|q_a\(16)) # (\inst|q_a\(13)) ) ) ) # ( !\inst|q_a\(15) 
-- & ( !\inst|q_a\(14) & ( (\inst|q_a\(16)) # (\inst|q_a\(13)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_q_a\(13),
	datad => \inst|ALT_INV_q_a\(16),
	datae => \inst|ALT_INV_q_a\(15),
	dataf => \inst|ALT_INV_q_a\(14),
	combout => \inst25|Mux6~0_combout\);

-- Location: MLABCELL_X13_Y4_N30
\inst890000|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~1_combout\ = ( \inst25|Mux4~0_combout\ & ( (\inst25|Mux3~0_combout\ & ((!\inst25|Mux6~0_combout\) # (\inst25|Mux5~0_combout\))) ) ) # ( !\inst25|Mux4~0_combout\ & ( \inst25|Mux3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000110011110000000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst25|ALT_INV_Mux6~0_combout\,
	datac => \inst25|ALT_INV_Mux5~0_combout\,
	datad => \inst25|ALT_INV_Mux3~0_combout\,
	dataf => \inst25|ALT_INV_Mux4~0_combout\,
	combout => \inst890000|Mux6~1_combout\);

-- Location: LABCELL_X17_Y4_N39
\inst890000|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux1~0_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux1~0_combout\ ) ) # ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux1~0_combout\ & ((!\inst|q_a\(12) & (!\inst5|Mux2|Mux1~0_combout\)) # (\inst|q_a\(12) & 
-- ((!\inst|q_a\(6)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010010000000110001001000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst5|Mux1|ALT_INV_Mux1~0_combout\,
	datac => \inst5|Mux2|ALT_INV_Mux1~0_combout\,
	datad => \inst|ALT_INV_q_a\(6),
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux1~0_combout\);

-- Location: MLABCELL_X13_Y4_N51
\inst890000|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~0_combout\ = ( \inst25|Mux5~0_combout\ & ( (\inst25|Mux3~0_combout\ & (!\inst25|Mux6~0_combout\ & !\inst25|Mux4~0_combout\)) ) ) # ( !\inst25|Mux5~0_combout\ & ( (\inst25|Mux3~0_combout\ & (\inst25|Mux6~0_combout\ & 
-- \inst25|Mux4~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010101010000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux3~0_combout\,
	datac => \inst25|ALT_INV_Mux6~0_combout\,
	datad => \inst25|ALT_INV_Mux4~0_combout\,
	dataf => \inst25|ALT_INV_Mux5~0_combout\,
	combout => \inst890000|Mux6~0_combout\);

-- Location: MLABCELL_X13_Y4_N45
\inst890000|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~1_combout\ = ( !\inst25|Mux6~0_combout\ & ( (\inst25|Mux3~0_combout\ & (\inst25|Mux4~0_combout\ & !\inst25|Mux5~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux3~0_combout\,
	datac => \inst25|ALT_INV_Mux4~0_combout\,
	datad => \inst25|ALT_INV_Mux5~0_combout\,
	dataf => \inst25|ALT_INV_Mux6~0_combout\,
	combout => \inst890000|Mux0~1_combout\);

-- Location: LABCELL_X17_Y4_N36
\inst890000|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux1~1_combout\ = ( \inst890000|Mux0~1_combout\ & ( (\inst5|Mux1|Mux1~0_combout\ & ((!\inst|q_a\(12) & (\inst5|Mux2|Mux1~0_combout\)) # (\inst|q_a\(12) & ((\inst|q_a\(6)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000100110000001000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst5|Mux1|ALT_INV_Mux1~0_combout\,
	datac => \inst5|Mux2|ALT_INV_Mux1~0_combout\,
	datad => \inst|ALT_INV_q_a\(6),
	dataf => \inst890000|ALT_INV_Mux0~1_combout\,
	combout => \inst890000|Mux1~1_combout\);

-- Location: FF_X17_Y4_N32
\inst5|register_b_2|d_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux2~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(5));

-- Location: MLABCELL_X18_Y4_N39
\inst5|register_r_2|d_out[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|register_r_2|d_out[5]~feeder_combout\ = ( \inst890000|Mux2~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst890000|ALT_INV_Mux2~2_combout\,
	combout => \inst5|register_r_2|d_out[5]~feeder_combout\);

-- Location: LABCELL_X17_Y4_N15
\inst5|Dem|output_2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Dem|output_2~0_combout\ = ( !\inst25|Mux0~0_combout\ & ( (\inst|q_a\(11) & !\inst|q_a\(10)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_q_a\(11),
	datad => \inst|ALT_INV_q_a\(10),
	dataf => \inst25|ALT_INV_Mux0~0_combout\,
	combout => \inst5|Dem|output_2~0_combout\);

-- Location: FF_X18_Y4_N40
\inst5|register_r_2|d_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst5|register_r_2|d_out[5]~feeder_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(5));

-- Location: FF_X16_Y4_N31
\inst5|register_a_2|d_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux2~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(5));

-- Location: LABCELL_X16_Y4_N42
\inst5|Mux1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux2~0_combout\ = ( \inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_0_2|d_out\(5) ) ) ) # ( !\inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_r_2|d_out\(5) ) ) ) # ( \inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_b_2|d_out\(5) ) ) 
-- ) # ( !\inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_a_2|d_out\(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100001111000011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_b_2|ALT_INV_d_out\(5),
	datab => \inst5|register_0_2|ALT_INV_d_out\(5),
	datac => \inst5|register_r_2|ALT_INV_d_out\(5),
	datad => \inst5|register_a_2|ALT_INV_d_out\(5),
	datae => \inst|ALT_INV_q_a\(8),
	dataf => \inst|ALT_INV_q_a\(9),
	combout => \inst5|Mux1|Mux2~0_combout\);

-- Location: LABCELL_X17_Y4_N33
\inst890000|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux2~0_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux2~0_combout\ ) ) # ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux2~0_combout\ & ((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux2~0_combout\))) # (\inst|q_a\(12) & 
-- (!\inst|q_a\(5))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010001000001100110011001111000000100010000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(5),
	datab => \inst5|Mux1|ALT_INV_Mux2~0_combout\,
	datac => \inst5|Mux2|ALT_INV_Mux2~0_combout\,
	datad => \inst|ALT_INV_q_a\(12),
	datae => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux2~0_combout\);

-- Location: LABCELL_X17_Y4_N0
\inst890000|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux2~1_combout\ = ( \inst890000|Mux0~1_combout\ & ( (\inst5|Mux1|Mux2~0_combout\ & ((!\inst|q_a\(12) & (\inst5|Mux2|Mux2~0_combout\)) # (\inst|q_a\(12) & ((\inst|q_a\(5)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000100110001000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux2|ALT_INV_Mux2~0_combout\,
	datab => \inst5|Mux1|ALT_INV_Mux2~0_combout\,
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst|ALT_INV_q_a\(5),
	dataf => \inst890000|ALT_INV_Mux0~1_combout\,
	combout => \inst890000|Mux2~1_combout\);

-- Location: FF_X10_Y4_N1
\inst5|register_b_2|d_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux3~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(4));

-- Location: FF_X14_Y4_N29
\inst5|register_r_2|d_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux3~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(4));

-- Location: FF_X14_Y4_N14
\inst5|register_0_2|d_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux3~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(4));

-- Location: LABCELL_X14_Y4_N30
\inst5|Mux1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux3~0_combout\ = ( \inst|q_a\(9) & ( \inst5|register_0_2|d_out\(4) & ( (\inst|q_a\(8)) # (\inst5|register_r_2|d_out\(4)) ) ) ) # ( !\inst|q_a\(9) & ( \inst5|register_0_2|d_out\(4) & ( (!\inst|q_a\(8) & ((\inst5|register_a_2|d_out\(4)))) # 
-- (\inst|q_a\(8) & (\inst5|register_b_2|d_out\(4))) ) ) ) # ( \inst|q_a\(9) & ( !\inst5|register_0_2|d_out\(4) & ( (\inst5|register_r_2|d_out\(4) & !\inst|q_a\(8)) ) ) ) # ( !\inst|q_a\(9) & ( !\inst5|register_0_2|d_out\(4) & ( (!\inst|q_a\(8) & 
-- ((\inst5|register_a_2|d_out\(4)))) # (\inst|q_a\(8) & (\inst5|register_b_2|d_out\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101010101001100110000000000001111010101010011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_b_2|ALT_INV_d_out\(4),
	datab => \inst5|register_r_2|ALT_INV_d_out\(4),
	datac => \inst5|register_a_2|ALT_INV_d_out\(4),
	datad => \inst|ALT_INV_q_a\(8),
	datae => \inst|ALT_INV_q_a\(9),
	dataf => \inst5|register_0_2|ALT_INV_d_out\(4),
	combout => \inst5|Mux1|Mux3~0_combout\);

-- Location: LABCELL_X14_Y4_N24
\inst890000|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux3~1_combout\ = ( \inst|q_a\(12) & ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux3~0_combout\ ) ) ) # ( !\inst|q_a\(12) & ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux3~0_combout\ ) ) ) # ( \inst|q_a\(12) & ( 
-- !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux3~0_combout\ & !\inst|q_a\(4)) ) ) ) # ( !\inst|q_a\(12) & ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux3~0_combout\ & !\inst5|Mux2|Mux3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110011000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst5|Mux1|ALT_INV_Mux3~0_combout\,
	datac => \inst5|Mux2|ALT_INV_Mux3~0_combout\,
	datad => \inst|ALT_INV_q_a\(4),
	datae => \inst|ALT_INV_q_a\(12),
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux3~1_combout\);

-- Location: MLABCELL_X13_Y4_N3
\inst890000|Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~2_combout\ = ( \inst25|Mux4~0_combout\ & ( (!\inst25|Mux5~0_combout\ & !\inst25|Mux6~0_combout\) ) ) # ( !\inst25|Mux4~0_combout\ & ( (!\inst25|Mux5~0_combout\) # (\inst25|Mux6~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111111111100001111111111110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst25|ALT_INV_Mux5~0_combout\,
	datad => \inst25|ALT_INV_Mux6~0_combout\,
	dataf => \inst25|ALT_INV_Mux4~0_combout\,
	combout => \inst890000|Mux6~2_combout\);

-- Location: MLABCELL_X13_Y4_N54
\inst890000|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~4_combout\ = ( \inst25|Mux4~0_combout\ & ( (\inst25|Mux3~0_combout\ & ((!\inst25|Mux6~0_combout\) # (\inst25|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000001010000111100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux5~0_combout\,
	datac => \inst25|ALT_INV_Mux3~0_combout\,
	datad => \inst25|ALT_INV_Mux6~0_combout\,
	dataf => \inst25|ALT_INV_Mux4~0_combout\,
	combout => \inst890000|Mux0~4_combout\);

-- Location: LABCELL_X14_Y4_N0
\inst890000|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux3~0_combout\ = ( \inst|q_a\(12) & ( \inst890000|Mux6~2_combout\ & ( (\inst|q_a\(4) & \inst5|Mux1|Mux3~0_combout\) ) ) ) # ( !\inst|q_a\(12) & ( \inst890000|Mux6~2_combout\ & ( (\inst5|Mux2|Mux3~0_combout\ & \inst5|Mux1|Mux3~0_combout\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_q_a\(4),
	datac => \inst5|Mux2|ALT_INV_Mux3~0_combout\,
	datad => \inst5|Mux1|ALT_INV_Mux3~0_combout\,
	datae => \inst|ALT_INV_q_a\(12),
	dataf => \inst890000|ALT_INV_Mux6~2_combout\,
	combout => \inst890000|Mux3~0_combout\);

-- Location: FF_X14_Y4_N8
\inst5|register_0_2|d_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux4~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(3));

-- Location: FF_X10_Y4_N49
\inst5|register_a_2|d_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux4~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(3));

-- Location: FF_X10_Y4_N56
\inst5|register_b_2|d_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux4~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(3));

-- Location: LABCELL_X10_Y4_N54
\inst5|Mux2|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux4~0_combout\ = ( \inst5|register_b_2|d_out\(3) & ( \inst|q_a\(0) & ( (!\inst|q_a\(1)) # (\inst5|register_0_2|d_out\(3)) ) ) ) # ( !\inst5|register_b_2|d_out\(3) & ( \inst|q_a\(0) & ( (\inst5|register_0_2|d_out\(3) & \inst|q_a\(1)) ) ) ) # ( 
-- \inst5|register_b_2|d_out\(3) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & (\inst5|register_a_2|d_out\(3))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(3)))) ) ) ) # ( !\inst5|register_b_2|d_out\(3) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & 
-- (\inst5|register_a_2|d_out\(3))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111100000000010101011111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_0_2|ALT_INV_d_out\(3),
	datab => \inst5|register_a_2|ALT_INV_d_out\(3),
	datac => \inst5|register_r_2|ALT_INV_d_out\(3),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst5|register_b_2|ALT_INV_d_out\(3),
	dataf => \inst|ALT_INV_q_a\(0),
	combout => \inst5|Mux2|Mux4~0_combout\);

-- Location: LABCELL_X14_Y4_N57
\inst890000|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux4~0_combout\ = ( \inst890000|Mux6~2_combout\ & ( (\inst5|Mux1|Mux4~0_combout\ & ((!\inst|q_a\(12) & (\inst5|Mux2|Mux4~0_combout\)) # (\inst|q_a\(12) & ((\inst|q_a\(3)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010100110000000001010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux2|ALT_INV_Mux4~0_combout\,
	datab => \inst|ALT_INV_q_a\(3),
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst5|Mux1|ALT_INV_Mux4~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~2_combout\,
	combout => \inst890000|Mux4~0_combout\);

-- Location: LABCELL_X14_Y4_N54
\inst890000|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux4~1_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux4~0_combout\ ) ) # ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux4~0_combout\ & ((!\inst|q_a\(12) & (!\inst5|Mux2|Mux4~0_combout\)) # (\inst|q_a\(12) & 
-- ((!\inst|q_a\(3)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011000000101000001100000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux2|ALT_INV_Mux4~0_combout\,
	datab => \inst|ALT_INV_q_a\(3),
	datac => \inst5|Mux1|ALT_INV_Mux4~0_combout\,
	datad => \inst|ALT_INV_q_a\(12),
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux4~1_combout\);

-- Location: FF_X10_Y4_N25
\inst5|register_b_2|d_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux5~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(2));

-- Location: FF_X13_Y4_N29
\inst5|register_a_2|d_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux5~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(2));

-- Location: FF_X14_Y4_N35
\inst5|register_r_2|d_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux5~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(2));

-- Location: LABCELL_X10_Y4_N30
\inst5|Mux1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux5~0_combout\ = ( \inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_0_2|d_out\(2) ) ) ) # ( !\inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_r_2|d_out\(2) ) ) ) # ( \inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_b_2|d_out\(2) ) ) 
-- ) # ( !\inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_a_2|d_out\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_b_2|ALT_INV_d_out\(2),
	datab => \inst5|register_a_2|ALT_INV_d_out\(2),
	datac => \inst5|register_0_2|ALT_INV_d_out\(2),
	datad => \inst5|register_r_2|ALT_INV_d_out\(2),
	datae => \inst|ALT_INV_q_a\(8),
	dataf => \inst|ALT_INV_q_a\(9),
	combout => \inst5|Mux1|Mux5~0_combout\);

-- Location: LABCELL_X12_Y4_N0
\inst890000|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux5~0_combout\ = ( \inst5|Mux2|Mux5~0_combout\ & ( \inst890000|Mux6~2_combout\ & ( (\inst5|Mux1|Mux5~0_combout\ & ((!\inst|q_a\(12)) # (\inst|q_a\(2)))) ) ) ) # ( !\inst5|Mux2|Mux5~0_combout\ & ( \inst890000|Mux6~2_combout\ & ( 
-- (\inst5|Mux1|Mux5~0_combout\ & (\inst|q_a\(12) & \inst|q_a\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100010100010001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux1|ALT_INV_Mux5~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datad => \inst|ALT_INV_q_a\(2),
	datae => \inst5|Mux2|ALT_INV_Mux5~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~2_combout\,
	combout => \inst890000|Mux5~0_combout\);

-- Location: LABCELL_X12_Y4_N9
\inst890000|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux5~1_combout\ = ( \inst5|Mux2|Mux5~0_combout\ & ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux5~0_combout\ ) ) ) # ( !\inst5|Mux2|Mux5~0_combout\ & ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux5~0_combout\ ) ) ) # ( 
-- \inst5|Mux2|Mux5~0_combout\ & ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux5~0_combout\ & (!\inst|q_a\(2) & \inst|q_a\(12))) ) ) ) # ( !\inst5|Mux2|Mux5~0_combout\ & ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux5~0_combout\ & 
-- ((!\inst|q_a\(2)) # (!\inst|q_a\(12)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010100000000000001010000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux1|ALT_INV_Mux5~0_combout\,
	datac => \inst|ALT_INV_q_a\(2),
	datad => \inst|ALT_INV_q_a\(12),
	datae => \inst5|Mux2|ALT_INV_Mux5~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux5~1_combout\);

-- Location: FF_X14_Y4_N50
\inst5|register_0_2|d_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux6~5_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(1));

-- Location: FF_X16_Y4_N8
\inst5|register_a_2|d_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux6~5_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(1));

-- Location: FF_X10_Y4_N43
\inst5|register_b_2|d_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux6~5_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(1));

-- Location: LABCELL_X10_Y4_N42
\inst5|Mux2|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux6~0_combout\ = ( \inst5|register_b_2|d_out\(1) & ( \inst|q_a\(0) & ( (!\inst|q_a\(1)) # (\inst5|register_0_2|d_out\(1)) ) ) ) # ( !\inst5|register_b_2|d_out\(1) & ( \inst|q_a\(0) & ( (\inst5|register_0_2|d_out\(1) & \inst|q_a\(1)) ) ) ) # ( 
-- \inst5|register_b_2|d_out\(1) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & (\inst5|register_a_2|d_out\(1))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(1)))) ) ) ) # ( !\inst5|register_b_2|d_out\(1) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & 
-- (\inst5|register_a_2|d_out\(1))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111100000000010101011111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_0_2|ALT_INV_d_out\(1),
	datab => \inst5|register_a_2|ALT_INV_d_out\(1),
	datac => \inst5|register_r_2|ALT_INV_d_out\(1),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst5|register_b_2|ALT_INV_d_out\(1),
	dataf => \inst|ALT_INV_q_a\(0),
	combout => \inst5|Mux2|Mux6~0_combout\);

-- Location: LABCELL_X14_Y4_N45
\inst890000|Mux6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~3_combout\ = ( \inst890000|Mux6~2_combout\ & ( (\inst5|Mux1|Mux6~0_combout\ & ((!\inst|q_a\(12) & (\inst5|Mux2|Mux6~0_combout\)) # (\inst|q_a\(12) & ((\inst|q_a\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010100110000000001010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux2|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(1),
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst5|Mux1|ALT_INV_Mux6~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~2_combout\,
	combout => \inst890000|Mux6~3_combout\);

-- Location: LABCELL_X14_Y4_N42
\inst890000|Mux6~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~4_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux6~0_combout\ ) ) # ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux6~0_combout\ & ((!\inst|q_a\(12) & (!\inst5|Mux2|Mux6~0_combout\)) # (\inst|q_a\(12) & 
-- ((!\inst|q_a\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011000000101000001100000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux2|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(1),
	datac => \inst5|Mux1|ALT_INV_Mux6~0_combout\,
	datad => \inst|ALT_INV_q_a\(12),
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux6~4_combout\);

-- Location: LABCELL_X17_Y4_N24
\inst8|Y[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8|Y[0]~0_combout\ = ( \inst|q_a\(12) & ( \inst|q_a\(0) ) ) # ( !\inst|q_a\(12) & ( \inst5|Mux2|Mux7~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst5|Mux2|ALT_INV_Mux7~0_combout\,
	datad => \inst|ALT_INV_q_a\(0),
	dataf => \inst|ALT_INV_q_a\(12),
	combout => \inst8|Y[0]~0_combout\);

-- Location: FF_X16_Y4_N25
\inst5|register_a_2|d_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux7~1_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(0));

-- Location: FF_X17_Y4_N50
\inst5|register_0_2|d_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux7~1_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(0));

-- Location: MLABCELL_X18_Y4_N24
\inst5|register_r_2|d_out[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|register_r_2|d_out[0]~feeder_combout\ = ( \inst890000|Mux7~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst890000|ALT_INV_Mux7~1_combout\,
	combout => \inst5|register_r_2|d_out[0]~feeder_combout\);

-- Location: FF_X18_Y4_N26
\inst5|register_r_2|d_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst5|register_r_2|d_out[0]~feeder_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(0));

-- Location: LABCELL_X16_Y4_N0
\inst5|Mux1|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux7~0_combout\ = ( \inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_0_2|d_out\(0) ) ) ) # ( !\inst|q_a\(8) & ( \inst|q_a\(9) & ( \inst5|register_r_2|d_out\(0) ) ) ) # ( \inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_b_2|d_out\(0) ) ) 
-- ) # ( !\inst|q_a\(8) & ( !\inst|q_a\(9) & ( \inst5|register_a_2|d_out\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_b_2|ALT_INV_d_out\(0),
	datab => \inst5|register_a_2|ALT_INV_d_out\(0),
	datac => \inst5|register_0_2|ALT_INV_d_out\(0),
	datad => \inst5|register_r_2|ALT_INV_d_out\(0),
	datae => \inst|ALT_INV_q_a\(8),
	dataf => \inst|ALT_INV_q_a\(9),
	combout => \inst5|Mux1|Mux7~0_combout\);

-- Location: LABCELL_X12_Y4_N30
\inst890000|Add0~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~34_cout\ = CARRY(( \inst25|Mux6~0_combout\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst25|ALT_INV_Mux6~0_combout\,
	cin => GND,
	cout => \inst890000|Add0~34_cout\);

-- Location: LABCELL_X12_Y4_N33
\inst890000|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~29_sumout\ = SUM(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux7~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(0))))) ) + ( \inst5|Mux1|Mux7~0_combout\ ) + ( \inst890000|Add0~34_cout\ ))
-- \inst890000|Add0~30\ = CARRY(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux7~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(0))))) ) + ( \inst5|Mux1|Mux7~0_combout\ ) + ( \inst890000|Add0~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(0),
	datab => \inst25|ALT_INV_Mux6~0_combout\,
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst5|Mux2|ALT_INV_Mux7~0_combout\,
	dataf => \inst5|Mux1|ALT_INV_Mux7~0_combout\,
	cin => \inst890000|Add0~34_cout\,
	sumout => \inst890000|Add0~29_sumout\,
	cout => \inst890000|Add0~30\);

-- Location: LABCELL_X17_Y4_N18
\inst890000|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux7~0_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst890000|Mux6~0_combout\ & ( !\inst5|Mux1|Mux7~0_combout\ ) ) ) # ( !\inst890000|Mux6~1_combout\ & ( \inst890000|Mux6~0_combout\ & ( ((!\inst|q_a\(12) & ((\inst5|Mux2|Mux7~0_combout\))) # 
-- (\inst|q_a\(12) & (\inst|q_a\(0)))) # (\inst5|Mux1|Mux7~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110111101111111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst5|Mux1|ALT_INV_Mux7~0_combout\,
	datac => \inst|ALT_INV_q_a\(0),
	datad => \inst5|Mux2|ALT_INV_Mux7~0_combout\,
	datae => \inst890000|ALT_INV_Mux6~1_combout\,
	dataf => \inst890000|ALT_INV_Mux6~0_combout\,
	combout => \inst890000|Mux7~0_combout\);

-- Location: LABCELL_X17_Y4_N51
\inst890000|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux7~1_combout\ = ( \inst890000|Mux0~4_combout\ & ( \inst890000|Mux7~0_combout\ ) ) # ( !\inst890000|Mux0~4_combout\ & ( \inst890000|Mux7~0_combout\ ) ) # ( \inst890000|Mux0~4_combout\ & ( !\inst890000|Mux7~0_combout\ & ( 
-- (!\inst890000|Mux6~2_combout\ & (((\inst890000|Add0~29_sumout\)))) # (\inst890000|Mux6~2_combout\ & (\inst8|Y[0]~0_combout\ & (\inst5|Mux1|Mux7~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000011100110111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|ALT_INV_Y[0]~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~2_combout\,
	datac => \inst5|Mux1|ALT_INV_Mux7~0_combout\,
	datad => \inst890000|ALT_INV_Add0~29_sumout\,
	datae => \inst890000|ALT_INV_Mux0~4_combout\,
	dataf => \inst890000|ALT_INV_Mux7~0_combout\,
	combout => \inst890000|Mux7~1_combout\);

-- Location: FF_X16_Y4_N56
\inst5|register_b_2|d_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux7~1_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(0));

-- Location: LABCELL_X16_Y4_N24
\inst5|Mux2|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux7~0_combout\ = ( \inst5|register_a_2|d_out\(0) & ( \inst|q_a\(1) & ( (!\inst|q_a\(0) & ((\inst5|register_r_2|d_out\(0)))) # (\inst|q_a\(0) & (\inst5|register_0_2|d_out\(0))) ) ) ) # ( !\inst5|register_a_2|d_out\(0) & ( \inst|q_a\(1) & ( 
-- (!\inst|q_a\(0) & ((\inst5|register_r_2|d_out\(0)))) # (\inst|q_a\(0) & (\inst5|register_0_2|d_out\(0))) ) ) ) # ( \inst5|register_a_2|d_out\(0) & ( !\inst|q_a\(1) & ( (!\inst|q_a\(0)) # (\inst5|register_b_2|d_out\(0)) ) ) ) # ( 
-- !\inst5|register_a_2|d_out\(0) & ( !\inst|q_a\(1) & ( (\inst5|register_b_2|d_out\(0) & \inst|q_a\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101111111110101010100001111001100110000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_b_2|ALT_INV_d_out\(0),
	datab => \inst5|register_0_2|ALT_INV_d_out\(0),
	datac => \inst5|register_r_2|ALT_INV_d_out\(0),
	datad => \inst|ALT_INV_q_a\(0),
	datae => \inst5|register_a_2|ALT_INV_d_out\(0),
	dataf => \inst|ALT_INV_q_a\(1),
	combout => \inst5|Mux2|Mux7~0_combout\);

-- Location: LABCELL_X12_Y4_N36
\inst890000|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~25_sumout\ = SUM(( \inst5|Mux1|Mux6~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux6~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(1))))) ) + ( \inst890000|Add0~30\ ))
-- \inst890000|Add0~26\ = CARRY(( \inst5|Mux1|Mux6~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux6~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(1))))) ) + ( \inst890000|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010010110010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(1),
	datad => \inst5|Mux1|ALT_INV_Mux6~0_combout\,
	dataf => \inst5|Mux2|ALT_INV_Mux6~0_combout\,
	cin => \inst890000|Add0~30\,
	sumout => \inst890000|Add0~25_sumout\,
	cout => \inst890000|Add0~26\);

-- Location: LABCELL_X14_Y4_N51
\inst890000|Mux6~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux6~5_combout\ = ( \inst890000|Mux6~4_combout\ & ( \inst890000|Add0~25_sumout\ & ( (\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux6~3_combout\))) ) ) ) # ( !\inst890000|Mux6~4_combout\ & ( 
-- \inst890000|Add0~25_sumout\ & ( ((\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux6~3_combout\)))) # (\inst890000|Mux6~0_combout\) ) ) ) # ( \inst890000|Mux6~4_combout\ & ( !\inst890000|Add0~25_sumout\ & ( 
-- (\inst890000|Mux6~3_combout\ & \inst890000|Mux0~4_combout\) ) ) ) # ( !\inst890000|Mux6~4_combout\ & ( !\inst890000|Add0~25_sumout\ & ( ((\inst890000|Mux6~3_combout\ & \inst890000|Mux0~4_combout\)) # (\inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011111000000000000111101010101110111110000000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux6~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~2_combout\,
	datac => \inst890000|ALT_INV_Mux6~3_combout\,
	datad => \inst890000|ALT_INV_Mux0~4_combout\,
	datae => \inst890000|ALT_INV_Mux6~4_combout\,
	dataf => \inst890000|ALT_INV_Add0~25_sumout\,
	combout => \inst890000|Mux6~5_combout\);

-- Location: FF_X14_Y4_N20
\inst5|register_r_2|d_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux6~5_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(1));

-- Location: LABCELL_X14_Y4_N21
\inst5|Mux1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux6~0_combout\ = ( \inst|q_a\(9) & ( \inst|q_a\(8) & ( \inst5|register_0_2|d_out\(1) ) ) ) # ( !\inst|q_a\(9) & ( \inst|q_a\(8) & ( \inst5|register_b_2|d_out\(1) ) ) ) # ( \inst|q_a\(9) & ( !\inst|q_a\(8) & ( \inst5|register_r_2|d_out\(1) ) ) 
-- ) # ( !\inst|q_a\(9) & ( !\inst|q_a\(8) & ( \inst5|register_a_2|d_out\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_r_2|ALT_INV_d_out\(1),
	datab => \inst5|register_a_2|ALT_INV_d_out\(1),
	datac => \inst5|register_0_2|ALT_INV_d_out\(1),
	datad => \inst5|register_b_2|ALT_INV_d_out\(1),
	datae => \inst|ALT_INV_q_a\(9),
	dataf => \inst|ALT_INV_q_a\(8),
	combout => \inst5|Mux1|Mux6~0_combout\);

-- Location: LABCELL_X12_Y4_N39
\inst890000|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~21_sumout\ = SUM(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux5~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(2))))) ) + ( \inst5|Mux1|Mux5~0_combout\ ) + ( \inst890000|Add0~26\ ))
-- \inst890000|Add0~22\ = CARRY(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux5~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(2))))) ) + ( \inst5|Mux1|Mux5~0_combout\ ) + ( \inst890000|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101011010011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(2),
	datad => \inst5|Mux2|ALT_INV_Mux5~0_combout\,
	dataf => \inst5|Mux1|ALT_INV_Mux5~0_combout\,
	cin => \inst890000|Add0~26\,
	sumout => \inst890000|Add0~21_sumout\,
	cout => \inst890000|Add0~22\);

-- Location: LABCELL_X14_Y4_N39
\inst890000|Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux5~2_combout\ = ( \inst890000|Mux5~1_combout\ & ( \inst890000|Add0~21_sumout\ & ( (\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux5~0_combout\))) ) ) ) # ( !\inst890000|Mux5~1_combout\ & ( 
-- \inst890000|Add0~21_sumout\ & ( ((\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux5~0_combout\)))) # (\inst890000|Mux6~0_combout\) ) ) ) # ( \inst890000|Mux5~1_combout\ & ( !\inst890000|Add0~21_sumout\ & ( 
-- (\inst890000|Mux5~0_combout\ & \inst890000|Mux0~4_combout\) ) ) ) # ( !\inst890000|Mux5~1_combout\ & ( !\inst890000|Add0~21_sumout\ & ( ((\inst890000|Mux5~0_combout\ & \inst890000|Mux0~4_combout\)) # (\inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011111000000000101010100001111110111110000000011011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux5~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~2_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datad => \inst890000|ALT_INV_Mux0~4_combout\,
	datae => \inst890000|ALT_INV_Mux5~1_combout\,
	dataf => \inst890000|ALT_INV_Add0~21_sumout\,
	combout => \inst890000|Mux5~2_combout\);

-- Location: FF_X14_Y4_N38
\inst5|register_0_2|d_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux5~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(2));

-- Location: LABCELL_X10_Y4_N24
\inst5|Mux2|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux5~0_combout\ = ( \inst5|register_b_2|d_out\(2) & ( \inst|q_a\(0) & ( (!\inst|q_a\(1)) # (\inst5|register_0_2|d_out\(2)) ) ) ) # ( !\inst5|register_b_2|d_out\(2) & ( \inst|q_a\(0) & ( (\inst5|register_0_2|d_out\(2) & \inst|q_a\(1)) ) ) ) # ( 
-- \inst5|register_b_2|d_out\(2) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & ((\inst5|register_a_2|d_out\(2)))) # (\inst|q_a\(1) & (\inst5|register_r_2|d_out\(2))) ) ) ) # ( !\inst5|register_b_2|d_out\(2) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & 
-- ((\inst5|register_a_2|d_out\(2)))) # (\inst|q_a\(1) & (\inst5|register_r_2|d_out\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001100000000010101011111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_0_2|ALT_INV_d_out\(2),
	datab => \inst5|register_r_2|ALT_INV_d_out\(2),
	datac => \inst5|register_a_2|ALT_INV_d_out\(2),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst5|register_b_2|ALT_INV_d_out\(2),
	dataf => \inst|ALT_INV_q_a\(0),
	combout => \inst5|Mux2|Mux5~0_combout\);

-- Location: LABCELL_X12_Y4_N42
\inst890000|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~17_sumout\ = SUM(( \inst5|Mux1|Mux4~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux4~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(3))))) ) + ( \inst890000|Add0~22\ ))
-- \inst890000|Add0~18\ = CARRY(( \inst5|Mux1|Mux4~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux4~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(3))))) ) + ( \inst890000|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010010110010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(3),
	datad => \inst5|Mux1|ALT_INV_Mux4~0_combout\,
	dataf => \inst5|Mux2|ALT_INV_Mux4~0_combout\,
	cin => \inst890000|Add0~22\,
	sumout => \inst890000|Add0~17_sumout\,
	cout => \inst890000|Add0~18\);

-- Location: LABCELL_X14_Y4_N9
\inst890000|Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux4~2_combout\ = ( \inst890000|Mux4~1_combout\ & ( \inst890000|Add0~17_sumout\ & ( (\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux4~0_combout\))) ) ) ) # ( !\inst890000|Mux4~1_combout\ & ( 
-- \inst890000|Add0~17_sumout\ & ( ((\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\) # (\inst890000|Mux4~0_combout\)))) # (\inst890000|Mux6~0_combout\) ) ) ) # ( \inst890000|Mux4~1_combout\ & ( !\inst890000|Add0~17_sumout\ & ( 
-- (\inst890000|Mux4~0_combout\ & \inst890000|Mux0~4_combout\) ) ) ) # ( !\inst890000|Mux4~1_combout\ & ( !\inst890000|Add0~17_sumout\ & ( ((\inst890000|Mux4~0_combout\ & \inst890000|Mux0~4_combout\)) # (\inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011111000000000000111101010101110111110000000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux6~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~2_combout\,
	datac => \inst890000|ALT_INV_Mux4~0_combout\,
	datad => \inst890000|ALT_INV_Mux0~4_combout\,
	datae => \inst890000|ALT_INV_Mux4~1_combout\,
	dataf => \inst890000|ALT_INV_Add0~17_sumout\,
	combout => \inst890000|Mux4~2_combout\);

-- Location: FF_X14_Y4_N5
\inst5|register_r_2|d_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux4~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(3));

-- Location: LABCELL_X10_Y4_N48
\inst5|Mux1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux4~0_combout\ = ( \inst5|register_a_2|d_out\(3) & ( \inst5|register_b_2|d_out\(3) & ( (!\inst|q_a\(9)) # ((!\inst|q_a\(8) & (\inst5|register_r_2|d_out\(3))) # (\inst|q_a\(8) & ((\inst5|register_0_2|d_out\(3))))) ) ) ) # ( 
-- !\inst5|register_a_2|d_out\(3) & ( \inst5|register_b_2|d_out\(3) & ( (!\inst|q_a\(8) & (\inst5|register_r_2|d_out\(3) & (\inst|q_a\(9)))) # (\inst|q_a\(8) & (((!\inst|q_a\(9)) # (\inst5|register_0_2|d_out\(3))))) ) ) ) # ( \inst5|register_a_2|d_out\(3) & 
-- ( !\inst5|register_b_2|d_out\(3) & ( (!\inst|q_a\(8) & (((!\inst|q_a\(9))) # (\inst5|register_r_2|d_out\(3)))) # (\inst|q_a\(8) & (((\inst|q_a\(9) & \inst5|register_0_2|d_out\(3))))) ) ) ) # ( !\inst5|register_a_2|d_out\(3) & ( 
-- !\inst5|register_b_2|d_out\(3) & ( (\inst|q_a\(9) & ((!\inst|q_a\(8) & (\inst5|register_r_2|d_out\(3))) # (\inst|q_a\(8) & ((\inst5|register_0_2|d_out\(3)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000111101000101010011101010010010101111111001011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(8),
	datab => \inst5|register_r_2|ALT_INV_d_out\(3),
	datac => \inst|ALT_INV_q_a\(9),
	datad => \inst5|register_0_2|ALT_INV_d_out\(3),
	datae => \inst5|register_a_2|ALT_INV_d_out\(3),
	dataf => \inst5|register_b_2|ALT_INV_d_out\(3),
	combout => \inst5|Mux1|Mux4~0_combout\);

-- Location: LABCELL_X12_Y4_N45
\inst890000|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~13_sumout\ = SUM(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux3~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(4))))) ) + ( \inst5|Mux1|Mux3~0_combout\ ) + ( \inst890000|Add0~18\ ))
-- \inst890000|Add0~14\ = CARRY(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux3~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(4))))) ) + ( \inst5|Mux1|Mux3~0_combout\ ) + ( \inst890000|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101011010011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(4),
	datad => \inst5|Mux2|ALT_INV_Mux3~0_combout\,
	dataf => \inst5|Mux1|ALT_INV_Mux3~0_combout\,
	cin => \inst890000|Add0~18\,
	sumout => \inst890000|Add0~13_sumout\,
	cout => \inst890000|Add0~14\);

-- Location: LABCELL_X14_Y4_N15
\inst890000|Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux3~2_combout\ = ( \inst890000|Mux3~0_combout\ & ( \inst890000|Add0~13_sumout\ & ( ((!\inst890000|Mux3~1_combout\ & \inst890000|Mux6~0_combout\)) # (\inst890000|Mux0~4_combout\) ) ) ) # ( !\inst890000|Mux3~0_combout\ & ( 
-- \inst890000|Add0~13_sumout\ & ( (!\inst890000|Mux3~1_combout\ & (((!\inst890000|Mux6~2_combout\ & \inst890000|Mux0~4_combout\)) # (\inst890000|Mux6~0_combout\))) # (\inst890000|Mux3~1_combout\ & (!\inst890000|Mux6~2_combout\ & 
-- ((\inst890000|Mux0~4_combout\)))) ) ) ) # ( \inst890000|Mux3~0_combout\ & ( !\inst890000|Add0~13_sumout\ & ( ((!\inst890000|Mux3~1_combout\ & \inst890000|Mux6~0_combout\)) # (\inst890000|Mux0~4_combout\) ) ) ) # ( !\inst890000|Mux3~0_combout\ & ( 
-- !\inst890000|Add0~13_sumout\ & ( (!\inst890000|Mux3~1_combout\ & \inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010101111111100001010110011100000101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux3~1_combout\,
	datab => \inst890000|ALT_INV_Mux6~2_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datad => \inst890000|ALT_INV_Mux0~4_combout\,
	datae => \inst890000|ALT_INV_Mux3~0_combout\,
	dataf => \inst890000|ALT_INV_Add0~13_sumout\,
	combout => \inst890000|Mux3~2_combout\);

-- Location: FF_X16_Y4_N14
\inst5|register_a_2|d_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux3~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(4));

-- Location: LABCELL_X10_Y4_N0
\inst5|Mux2|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux3~0_combout\ = ( \inst5|register_b_2|d_out\(4) & ( \inst|q_a\(0) & ( (!\inst|q_a\(1)) # (\inst5|register_0_2|d_out\(4)) ) ) ) # ( !\inst5|register_b_2|d_out\(4) & ( \inst|q_a\(0) & ( (\inst5|register_0_2|d_out\(4) & \inst|q_a\(1)) ) ) ) # ( 
-- \inst5|register_b_2|d_out\(4) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & (\inst5|register_a_2|d_out\(4))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(4)))) ) ) ) # ( !\inst5|register_b_2|d_out\(4) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1) & 
-- (\inst5|register_a_2|d_out\(4))) # (\inst|q_a\(1) & ((\inst5|register_r_2|d_out\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111100000000001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_a_2|ALT_INV_d_out\(4),
	datab => \inst5|register_0_2|ALT_INV_d_out\(4),
	datac => \inst5|register_r_2|ALT_INV_d_out\(4),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst5|register_b_2|ALT_INV_d_out\(4),
	dataf => \inst|ALT_INV_q_a\(0),
	combout => \inst5|Mux2|Mux3~0_combout\);

-- Location: LABCELL_X12_Y4_N48
\inst890000|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~9_sumout\ = SUM(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux2~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(5))))) ) + ( \inst5|Mux1|Mux2~0_combout\ ) + ( \inst890000|Add0~14\ ))
-- \inst890000|Add0~10\ = CARRY(( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux2~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(5))))) ) + ( \inst5|Mux1|Mux2~0_combout\ ) + ( \inst890000|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101011010011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(5),
	datad => \inst5|Mux2|ALT_INV_Mux2~0_combout\,
	dataf => \inst5|Mux1|ALT_INV_Mux2~0_combout\,
	cin => \inst890000|Add0~14\,
	sumout => \inst890000|Add0~9_sumout\,
	cout => \inst890000|Add0~10\);

-- Location: LABCELL_X17_Y4_N42
\inst890000|Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux2~2_combout\ = ( \inst890000|Mux2~1_combout\ & ( \inst890000|Add0~9_sumout\ ) ) # ( !\inst890000|Mux2~1_combout\ & ( \inst890000|Add0~9_sumout\ & ( ((!\inst890000|Mux2~0_combout\ & \inst890000|Mux6~0_combout\)) # 
-- (\inst890000|Mux10~0_combout\) ) ) ) # ( \inst890000|Mux2~1_combout\ & ( !\inst890000|Add0~9_sumout\ ) ) # ( !\inst890000|Mux2~1_combout\ & ( !\inst890000|Add0~9_sumout\ & ( (!\inst890000|Mux2~0_combout\ & \inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000111111111111111101010101111101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux10~0_combout\,
	datac => \inst890000|ALT_INV_Mux2~0_combout\,
	datad => \inst890000|ALT_INV_Mux6~0_combout\,
	datae => \inst890000|ALT_INV_Mux2~1_combout\,
	dataf => \inst890000|ALT_INV_Add0~9_sumout\,
	combout => \inst890000|Mux2~2_combout\);

-- Location: FF_X17_Y4_N44
\inst5|register_0_2|d_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst890000|Mux2~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(5));

-- Location: LABCELL_X16_Y4_N30
\inst5|Mux2|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux2~0_combout\ = ( \inst5|register_a_2|d_out\(5) & ( \inst|q_a\(0) & ( (!\inst|q_a\(1) & ((\inst5|register_b_2|d_out\(5)))) # (\inst|q_a\(1) & (\inst5|register_0_2|d_out\(5))) ) ) ) # ( !\inst5|register_a_2|d_out\(5) & ( \inst|q_a\(0) & ( 
-- (!\inst|q_a\(1) & ((\inst5|register_b_2|d_out\(5)))) # (\inst|q_a\(1) & (\inst5|register_0_2|d_out\(5))) ) ) ) # ( \inst5|register_a_2|d_out\(5) & ( !\inst|q_a\(0) & ( (!\inst|q_a\(1)) # (\inst5|register_r_2|d_out\(5)) ) ) ) # ( 
-- !\inst5|register_a_2|d_out\(5) & ( !\inst|q_a\(0) & ( (\inst5|register_r_2|d_out\(5) & \inst|q_a\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111110000111100110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_0_2|ALT_INV_d_out\(5),
	datab => \inst5|register_b_2|ALT_INV_d_out\(5),
	datac => \inst5|register_r_2|ALT_INV_d_out\(5),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst5|register_a_2|ALT_INV_d_out\(5),
	dataf => \inst|ALT_INV_q_a\(0),
	combout => \inst5|Mux2|Mux2~0_combout\);

-- Location: LABCELL_X12_Y4_N51
\inst890000|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~5_sumout\ = SUM(( \inst5|Mux1|Mux1~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux1~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(6))))) ) + ( \inst890000|Add0~10\ ))
-- \inst890000|Add0~6\ = CARRY(( \inst5|Mux1|Mux1~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux1~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(6))))) ) + ( \inst890000|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010010110010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|ALT_INV_Mux6~0_combout\,
	datab => \inst|ALT_INV_q_a\(12),
	datac => \inst|ALT_INV_q_a\(6),
	datad => \inst5|Mux1|ALT_INV_Mux1~0_combout\,
	dataf => \inst5|Mux2|ALT_INV_Mux1~0_combout\,
	cin => \inst890000|Add0~10\,
	sumout => \inst890000|Add0~5_sumout\,
	cout => \inst890000|Add0~6\);

-- Location: LABCELL_X17_Y4_N57
\inst890000|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux1~2_combout\ = ( \inst890000|Mux1~1_combout\ & ( \inst890000|Add0~5_sumout\ ) ) # ( !\inst890000|Mux1~1_combout\ & ( \inst890000|Add0~5_sumout\ & ( ((!\inst890000|Mux1~0_combout\ & \inst890000|Mux6~0_combout\)) # 
-- (\inst890000|Mux10~0_combout\) ) ) ) # ( \inst890000|Mux1~1_combout\ & ( !\inst890000|Add0~5_sumout\ ) ) # ( !\inst890000|Mux1~1_combout\ & ( !\inst890000|Add0~5_sumout\ & ( (!\inst890000|Mux1~0_combout\ & \inst890000|Mux6~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100111111111111111101011101010111011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux10~0_combout\,
	datab => \inst890000|ALT_INV_Mux1~0_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datae => \inst890000|ALT_INV_Mux1~1_combout\,
	dataf => \inst890000|ALT_INV_Add0~5_sumout\,
	combout => \inst890000|Mux1~2_combout\);

-- Location: FF_X18_Y4_N50
\inst5|register_r_2|d_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux1~2_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(6));

-- Location: LABCELL_X16_Y4_N36
\inst5|Mux1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux1~0_combout\ = ( \inst5|register_a_2|d_out\(6) & ( \inst|q_a\(9) & ( (!\inst|q_a\(8) & (\inst5|register_r_2|d_out\(6))) # (\inst|q_a\(8) & ((\inst5|register_0_2|d_out\(6)))) ) ) ) # ( !\inst5|register_a_2|d_out\(6) & ( \inst|q_a\(9) & ( 
-- (!\inst|q_a\(8) & (\inst5|register_r_2|d_out\(6))) # (\inst|q_a\(8) & ((\inst5|register_0_2|d_out\(6)))) ) ) ) # ( \inst5|register_a_2|d_out\(6) & ( !\inst|q_a\(9) & ( (!\inst|q_a\(8)) # (\inst5|register_b_2|d_out\(6)) ) ) ) # ( 
-- !\inst5|register_a_2|d_out\(6) & ( !\inst|q_a\(9) & ( (\inst5|register_b_2|d_out\(6) & \inst|q_a\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111110011001101010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_r_2|ALT_INV_d_out\(6),
	datab => \inst5|register_b_2|ALT_INV_d_out\(6),
	datac => \inst5|register_0_2|ALT_INV_d_out\(6),
	datad => \inst|ALT_INV_q_a\(8),
	datae => \inst5|register_a_2|ALT_INV_d_out\(6),
	dataf => \inst|ALT_INV_q_a\(9),
	combout => \inst5|Mux1|Mux1~0_combout\);

-- Location: MLABCELL_X13_Y4_N39
\inst8|Y[6]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8|Y[6]~1_combout\ = ( \inst|q_a\(6) & ( (\inst5|Mux2|Mux1~0_combout\) # (\inst|q_a\(12)) ) ) # ( !\inst|q_a\(6) & ( (!\inst|q_a\(12) & \inst5|Mux2|Mux1~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst5|Mux2|ALT_INV_Mux1~0_combout\,
	dataf => \inst|ALT_INV_q_a\(6),
	combout => \inst8|Y[6]~1_combout\);

-- Location: MLABCELL_X13_Y4_N18
\inst890000|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux1~3_combout\ = ( \inst8|Y[6]~1_combout\ & ( (!\inst5|Mux1|Mux1~0_combout\ & (((\inst890000|Mux6~0_combout\)))) # (\inst5|Mux1|Mux1~0_combout\ & (((!\inst890000|Mux6~1_combout\ & \inst890000|Mux6~0_combout\)) # 
-- (\inst890000|Mux0~1_combout\))) ) ) # ( !\inst8|Y[6]~1_combout\ & ( (\inst890000|Mux6~0_combout\ & (!\inst5|Mux1|Mux1~0_combout\ $ (!\inst890000|Mux6~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000001100000011000001110010111110000111001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|Mux1|ALT_INV_Mux1~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~1_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datad => \inst890000|ALT_INV_Mux0~1_combout\,
	dataf => \inst8|ALT_INV_Y[6]~1_combout\,
	combout => \inst890000|Mux1~3_combout\);

-- Location: LABCELL_X12_Y4_N27
\inst8|Y[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8|Y[5]~2_combout\ = ( \inst5|Mux2|Mux2~0_combout\ & ( (!\inst|q_a\(12)) # (\inst|q_a\(5)) ) ) # ( !\inst5|Mux2|Mux2~0_combout\ & ( (\inst|q_a\(12) & \inst|q_a\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_q_a\(12),
	datad => \inst|ALT_INV_q_a\(5),
	dataf => \inst5|Mux2|ALT_INV_Mux2~0_combout\,
	combout => \inst8|Y[5]~2_combout\);

-- Location: LABCELL_X12_Y4_N24
\inst890000|Mux2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux2~3_combout\ = ( \inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux2~0_combout\ & (((\inst890000|Mux6~0_combout\)))) # (\inst5|Mux1|Mux2~0_combout\ & (\inst890000|Mux0~1_combout\ & ((\inst8|Y[5]~2_combout\)))) ) ) # ( 
-- !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux2~0_combout\ & (((\inst890000|Mux6~0_combout\ & \inst8|Y[5]~2_combout\)))) # (\inst5|Mux1|Mux2~0_combout\ & (((\inst890000|Mux0~1_combout\ & \inst8|Y[5]~2_combout\)) # (\inst890000|Mux6~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100011111000000110001111100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux0~1_combout\,
	datab => \inst5|Mux1|ALT_INV_Mux2~0_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datad => \inst8|ALT_INV_Y[5]~2_combout\,
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux2~3_combout\);

-- Location: MLABCELL_X13_Y4_N0
\inst14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14~0_combout\ = ( !\inst890000|Mux2~3_combout\ & ( (!\inst890000|Mux1~3_combout\ & ((!\inst890000|Mux10~0_combout\) # ((!\inst890000|Add0~5_sumout\ & !\inst890000|Add0~9_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010001000101010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux1~3_combout\,
	datab => \inst890000|ALT_INV_Mux10~0_combout\,
	datac => \inst890000|ALT_INV_Add0~5_sumout\,
	datad => \inst890000|ALT_INV_Add0~9_sumout\,
	dataf => \inst890000|ALT_INV_Mux2~3_combout\,
	combout => \inst14~0_combout\);

-- Location: MLABCELL_X13_Y4_N12
\inst890000|Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux7~2_combout\ = ( \inst5|Mux1|Mux7~0_combout\ & ( (\inst890000|Mux0~4_combout\ & ((!\inst890000|Mux6~2_combout\ & ((\inst890000|Add0~29_sumout\))) # (\inst890000|Mux6~2_combout\ & (\inst8|Y[0]~0_combout\)))) ) ) # ( 
-- !\inst5|Mux1|Mux7~0_combout\ & ( (\inst890000|Mux0~4_combout\ & (!\inst890000|Mux6~2_combout\ & \inst890000|Add0~29_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010000000000000101000000000001010100010000000101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux0~4_combout\,
	datab => \inst8|ALT_INV_Y[0]~0_combout\,
	datac => \inst890000|ALT_INV_Mux6~2_combout\,
	datad => \inst890000|ALT_INV_Add0~29_sumout\,
	dataf => \inst5|Mux1|ALT_INV_Mux7~0_combout\,
	combout => \inst890000|Mux7~2_combout\);

-- Location: FF_X17_Y4_N29
\inst5|register_0_2|d_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst890000|Mux0~3_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	ena => \inst5|Dem|output_3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_0_2|d_out\(7));

-- Location: FF_X17_Y4_N20
\inst5|register_b_2|d_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux0~3_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_b_2|d_out\(7));

-- Location: FF_X18_Y4_N32
\inst5|register_r_2|d_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux0~3_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_r_2|d_out\(7));

-- Location: MLABCELL_X18_Y4_N42
\inst5|Mux2|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux2|Mux0~0_combout\ = ( \inst|q_a\(0) & ( \inst5|register_r_2|d_out\(7) & ( (!\inst|q_a\(1) & ((\inst5|register_b_2|d_out\(7)))) # (\inst|q_a\(1) & (\inst5|register_0_2|d_out\(7))) ) ) ) # ( !\inst|q_a\(0) & ( \inst5|register_r_2|d_out\(7) & ( 
-- (\inst|q_a\(1)) # (\inst5|register_a_2|d_out\(7)) ) ) ) # ( \inst|q_a\(0) & ( !\inst5|register_r_2|d_out\(7) & ( (!\inst|q_a\(1) & ((\inst5|register_b_2|d_out\(7)))) # (\inst|q_a\(1) & (\inst5|register_0_2|d_out\(7))) ) ) ) # ( !\inst|q_a\(0) & ( 
-- !\inst5|register_r_2|d_out\(7) & ( (\inst5|register_a_2|d_out\(7) & !\inst|q_a\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000000011110011001101010101111111110000111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_a_2|ALT_INV_d_out\(7),
	datab => \inst5|register_0_2|ALT_INV_d_out\(7),
	datac => \inst5|register_b_2|ALT_INV_d_out\(7),
	datad => \inst|ALT_INV_q_a\(1),
	datae => \inst|ALT_INV_q_a\(0),
	dataf => \inst5|register_r_2|ALT_INV_d_out\(7),
	combout => \inst5|Mux2|Mux0~0_combout\);

-- Location: LABCELL_X17_Y4_N9
\inst890000|Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~2_combout\ = ( \inst890000|Mux0~1_combout\ & ( (\inst5|Mux1|Mux0~0_combout\ & ((!\inst|q_a\(12) & (\inst5|Mux2|Mux0~0_combout\)) # (\inst|q_a\(12) & ((\inst|q_a\(7)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000100110000001000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst5|Mux1|ALT_INV_Mux0~0_combout\,
	datac => \inst5|Mux2|ALT_INV_Mux0~0_combout\,
	datad => \inst|ALT_INV_q_a\(7),
	dataf => \inst890000|ALT_INV_Mux0~1_combout\,
	combout => \inst890000|Mux0~2_combout\);

-- Location: LABCELL_X17_Y4_N6
\inst890000|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~0_combout\ = ( \inst890000|Mux6~1_combout\ & ( \inst5|Mux1|Mux0~0_combout\ ) ) # ( !\inst890000|Mux6~1_combout\ & ( (!\inst5|Mux1|Mux0~0_combout\ & ((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux0~0_combout\))) # (\inst|q_a\(12) & 
-- (!\inst|q_a\(7))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100100001000000110010000100000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst5|Mux1|ALT_INV_Mux0~0_combout\,
	datac => \inst|ALT_INV_q_a\(7),
	datad => \inst5|Mux2|ALT_INV_Mux0~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux0~0_combout\);

-- Location: LABCELL_X17_Y4_N27
\inst890000|Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~3_combout\ = ( \inst890000|Add0~1_sumout\ & ( (((\inst890000|Mux6~0_combout\ & !\inst890000|Mux0~0_combout\)) # (\inst890000|Mux0~2_combout\)) # (\inst890000|Mux10~0_combout\) ) ) # ( !\inst890000|Add0~1_sumout\ & ( 
-- ((\inst890000|Mux6~0_combout\ & !\inst890000|Mux0~0_combout\)) # (\inst890000|Mux0~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100001111001111110000111101111111010111110111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux10~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~0_combout\,
	datac => \inst890000|ALT_INV_Mux0~2_combout\,
	datad => \inst890000|ALT_INV_Mux0~0_combout\,
	dataf => \inst890000|ALT_INV_Add0~1_sumout\,
	combout => \inst890000|Mux0~3_combout\);

-- Location: FF_X16_Y4_N41
\inst5|register_a_2|d_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst890000|Mux0~3_combout\,
	clrn => \ALT_INV_RESET~input_o\,
	sload => VCC,
	ena => \inst5|Dem|output_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|register_a_2|d_out\(7));

-- Location: MLABCELL_X18_Y4_N30
\inst5|Mux1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1|Mux0~0_combout\ = ( \inst5|register_r_2|d_out\(7) & ( \inst|q_a\(9) & ( (!\inst|q_a\(8)) # (\inst5|register_0_2|d_out\(7)) ) ) ) # ( !\inst5|register_r_2|d_out\(7) & ( \inst|q_a\(9) & ( (\inst|q_a\(8) & \inst5|register_0_2|d_out\(7)) ) ) ) # ( 
-- \inst5|register_r_2|d_out\(7) & ( !\inst|q_a\(9) & ( (!\inst|q_a\(8) & (\inst5|register_a_2|d_out\(7))) # (\inst|q_a\(8) & ((\inst5|register_b_2|d_out\(7)))) ) ) ) # ( !\inst5|register_r_2|d_out\(7) & ( !\inst|q_a\(9) & ( (!\inst|q_a\(8) & 
-- (\inst5|register_a_2|d_out\(7))) # (\inst|q_a\(8) & ((\inst5|register_b_2|d_out\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011010100110101001100000000000011111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|register_a_2|ALT_INV_d_out\(7),
	datab => \inst5|register_b_2|ALT_INV_d_out\(7),
	datac => \inst|ALT_INV_q_a\(8),
	datad => \inst5|register_0_2|ALT_INV_d_out\(7),
	datae => \inst5|register_r_2|ALT_INV_d_out\(7),
	dataf => \inst|ALT_INV_q_a\(9),
	combout => \inst5|Mux1|Mux0~0_combout\);

-- Location: LABCELL_X12_Y4_N54
\inst890000|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Add0~1_sumout\ = SUM(( \inst5|Mux1|Mux0~0_combout\ ) + ( !\inst25|Mux6~0_combout\ $ (((!\inst|q_a\(12) & ((!\inst5|Mux2|Mux0~0_combout\))) # (\inst|q_a\(12) & (!\inst|q_a\(7))))) ) + ( \inst890000|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110010010110001100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst25|ALT_INV_Mux6~0_combout\,
	datac => \inst|ALT_INV_q_a\(7),
	datad => \inst5|Mux1|ALT_INV_Mux0~0_combout\,
	dataf => \inst5|Mux2|ALT_INV_Mux0~0_combout\,
	cin => \inst890000|Add0~6\,
	sumout => \inst890000|Add0~1_sumout\);

-- Location: MLABCELL_X18_Y4_N48
\inst8|Y[7]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst8|Y[7]~3_combout\ = ( \inst5|Mux2|Mux0~0_combout\ & ( (!\inst|q_a\(12)) # (\inst|q_a\(7)) ) ) # ( !\inst5|Mux2|Mux0~0_combout\ & ( (\inst|q_a\(12) & \inst|q_a\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(12),
	datab => \inst|ALT_INV_q_a\(7),
	dataf => \inst5|Mux2|ALT_INV_Mux0~0_combout\,
	combout => \inst8|Y[7]~3_combout\);

-- Location: LABCELL_X12_Y4_N12
\inst890000|Mux0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~5_combout\ = ( \inst890000|Mux0~1_combout\ & ( (!\inst8|Y[7]~3_combout\ & (\inst890000|Mux6~0_combout\ & (!\inst890000|Mux6~1_combout\ $ (!\inst5|Mux1|Mux0~0_combout\)))) # (\inst8|Y[7]~3_combout\ & (((\inst5|Mux1|Mux0~0_combout\) # 
-- (\inst890000|Mux6~0_combout\)))) ) ) # ( !\inst890000|Mux0~1_combout\ & ( (\inst890000|Mux6~0_combout\ & ((!\inst890000|Mux6~1_combout\ & ((\inst5|Mux1|Mux0~0_combout\) # (\inst8|Y[7]~3_combout\))) # (\inst890000|Mux6~1_combout\ & 
-- ((!\inst5|Mux1|Mux0~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100001010000001110000101000000111001110110000011100111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux6~1_combout\,
	datab => \inst8|ALT_INV_Y[7]~3_combout\,
	datac => \inst890000|ALT_INV_Mux6~0_combout\,
	datad => \inst5|Mux1|ALT_INV_Mux0~0_combout\,
	dataf => \inst890000|ALT_INV_Mux0~1_combout\,
	combout => \inst890000|Mux0~5_combout\);

-- Location: MLABCELL_X13_Y4_N36
\inst14~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst14~1_combout\ = ( !\inst890000|Mux7~0_combout\ & ( (!\inst890000|Mux7~2_combout\ & (!\inst890000|Mux0~5_combout\ & ((!\inst890000|Mux10~0_combout\) # (!\inst890000|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100100000000000110010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Mux10~0_combout\,
	datab => \inst890000|ALT_INV_Mux7~2_combout\,
	datac => \inst890000|ALT_INV_Add0~1_sumout\,
	datad => \inst890000|ALT_INV_Mux0~5_combout\,
	dataf => \inst890000|ALT_INV_Mux7~0_combout\,
	combout => \inst14~1_combout\);

-- Location: MLABCELL_X13_Y4_N24
inst14 : cyclonev_lcell_comb
-- Equation(s):
-- \inst14~combout\ = ( \inst14~1_combout\ & ( !\inst890000|Mux5~2_combout\ & ( (\inst14~0_combout\ & (!\inst890000|Mux6~5_combout\ & (!\inst890000|Mux4~2_combout\ & !\inst890000|Mux3~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst14~0_combout\,
	datab => \inst890000|ALT_INV_Mux6~5_combout\,
	datac => \inst890000|ALT_INV_Mux4~2_combout\,
	datad => \inst890000|ALT_INV_Mux3~2_combout\,
	datae => \ALT_INV_inst14~1_combout\,
	dataf => \inst890000|ALT_INV_Mux5~2_combout\,
	combout => \inst14~combout\);

-- Location: FF_X13_Y4_N23
zero : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \zero~feeder_combout\,
	clrn => \ALT_INV_inst14~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \zero~q\);

-- Location: LABCELL_X12_Y4_N15
\Sinal~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \Sinal~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \Sinal~feeder_combout\);

-- Location: MLABCELL_X13_Y4_N6
\inst890000|Mux0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Mux0~6_combout\ = ( \inst890000|Mux6~0_combout\ & ( \inst890000|Mux6~1_combout\ & ( ((!\inst5|Mux1|Mux0~0_combout\) # ((\inst890000|Mux0~1_combout\ & \inst8|Y[7]~3_combout\))) # (\inst890000|Add0~1_sumout\) ) ) ) # ( 
-- !\inst890000|Mux6~0_combout\ & ( \inst890000|Mux6~1_combout\ & ( ((\inst890000|Mux0~1_combout\ & (\inst5|Mux1|Mux0~0_combout\ & \inst8|Y[7]~3_combout\))) # (\inst890000|Add0~1_sumout\) ) ) ) # ( \inst890000|Mux6~0_combout\ & ( !\inst890000|Mux6~1_combout\ 
-- & ( ((\inst8|Y[7]~3_combout\) # (\inst5|Mux1|Mux0~0_combout\)) # (\inst890000|Add0~1_sumout\) ) ) ) # ( !\inst890000|Mux6~0_combout\ & ( !\inst890000|Mux6~1_combout\ & ( ((\inst890000|Mux0~1_combout\ & (\inst5|Mux1|Mux0~0_combout\ & 
-- \inst8|Y[7]~3_combout\))) # (\inst890000|Add0~1_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010111010111111111111101010101010101111111010111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst890000|ALT_INV_Add0~1_sumout\,
	datab => \inst890000|ALT_INV_Mux0~1_combout\,
	datac => \inst5|Mux1|ALT_INV_Mux0~0_combout\,
	datad => \inst8|ALT_INV_Y[7]~3_combout\,
	datae => \inst890000|ALT_INV_Mux6~0_combout\,
	dataf => \inst890000|ALT_INV_Mux6~1_combout\,
	combout => \inst890000|Mux0~6_combout\);

-- Location: MLABCELL_X13_Y4_N57
\inst890000|Sinal\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst890000|Sinal~combout\ = ( \inst890000|Mux10~0_combout\ & ( \inst890000|Mux0~6_combout\ ) ) # ( !\inst890000|Mux10~0_combout\ & ( \inst890000|Sinal~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst890000|ALT_INV_Mux0~6_combout\,
	datad => \inst890000|ALT_INV_Sinal~combout\,
	dataf => \inst890000|ALT_INV_Mux10~0_combout\,
	combout => \inst890000|Sinal~combout\);

-- Location: FF_X12_Y4_N16
Sinal : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Sinal~feeder_combout\,
	clrn => \inst890000|ALT_INV_Sinal~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sinal~q\);

-- Location: LABCELL_X12_Y3_N24
\inst12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst12~0_combout\ = ( \Sinal~q\ & ( \inst|q_a\(15) & ( (!\inst|q_a\(16) & (\inst|q_a\(14) & ((!\inst|q_a\(13)) # (!\zero~q\)))) ) ) ) # ( !\Sinal~q\ & ( \inst|q_a\(15) & ( (!\inst|q_a\(16) & (\inst|q_a\(14) & ((!\inst|q_a\(13)) # (!\zero~q\)))) ) ) ) # ( 
-- \Sinal~q\ & ( !\inst|q_a\(15) & ( (!\inst|q_a\(13) & (\inst|q_a\(16) & !\inst|q_a\(14))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000100000000000000000110010000000000011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(13),
	datab => \inst|ALT_INV_q_a\(16),
	datac => \ALT_INV_zero~q\,
	datad => \inst|ALT_INV_q_a\(14),
	datae => \ALT_INV_Sinal~q\,
	dataf => \inst|ALT_INV_q_a\(15),
	combout => \inst12~0_combout\);

-- Location: FF_X12_Y3_N53
\inst8002|pc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~1_sumout\,
	asdata => \inst|q_a\(7),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(7));

-- Location: FF_X12_Y3_N50
\inst8002|pc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~5_sumout\,
	asdata => \inst|q_a\(6),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(6));

-- Location: FF_X12_Y3_N47
\inst8002|pc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~9_sumout\,
	asdata => \inst|q_a\(5),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(5));

-- Location: FF_X12_Y3_N44
\inst8002|pc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~13_sumout\,
	asdata => \inst|q_a\(4),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(4));

-- Location: FF_X12_Y3_N41
\inst8002|pc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~17_sumout\,
	asdata => \inst|q_a\(3),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(3));

-- Location: FF_X12_Y3_N38
\inst8002|pc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~21_sumout\,
	asdata => \inst|q_a\(2),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(2));

-- Location: FF_X12_Y3_N35
\inst8002|pc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~25_sumout\,
	asdata => \inst|q_a\(1),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(1));

-- Location: FF_X12_Y3_N32
\inst8002|pc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst8002|Add0~29_sumout\,
	asdata => \inst|q_a\(0),
	clrn => \ALT_INV_RESET~input_o\,
	sload => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8002|pc\(0));

-- Location: LABCELL_X17_Y4_N12
\inst25|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst25|Mux0~0_combout\ = ( \inst|q_a\(13) & ( ((!\inst|q_a\(14) & \inst|q_a\(16))) # (\inst|q_a\(15)) ) ) # ( !\inst|q_a\(13) & ( (!\inst|q_a\(15) & ((\inst|q_a\(16)))) # (\inst|q_a\(15) & (\inst|q_a\(14))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100101111001011110010111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_q_a\(14),
	datab => \inst|ALT_INV_q_a\(16),
	datac => \inst|ALT_INV_q_a\(15),
	dataf => \inst|ALT_INV_q_a\(13),
	combout => \inst25|Mux0~0_combout\);
END structure;


