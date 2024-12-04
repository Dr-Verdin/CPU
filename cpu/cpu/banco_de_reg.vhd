library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity banco_de_reg is
	port(
		clk : in std_logic;
		reg_write : in std_logic; -- enable 
		reset :in std_logic;
		WR : in std_logic_vector(1 downto 0);
		WD : in std_logic_vector(7 downto 0);
		end_RA : in std_logic_vector(1 downto 0);
		end_RB : in std_logic_vector(1 downto 0);
		RA : out std_logic_vector(7 downto 0);
		RB : out std_logic_vector(7 downto 0)
	);
end banco_de_reg;
	
architecture hardware of banco_de_reg is
signal write_d : std_logic_vector(7 downto 0);
signal sigAmux1, sigBmux1, sigRmux1, sig0mux1, sigAmux2, sigBmux2, sigRmux2, sig0mux2,r_a, r_b : std_logic_vector(7 downto 0);
signal enable_a, enable_b, enable_r, enable_zero : std_logic;

--instanciação do demux
	component demux is
		port(
			input_data : in STD_LOGIC; -- sinal de entrada
			Sel : in STD_LOGIC_VECTOR(1 downto 0); -- sinal de seleção
			output_0 : out STD_LOGIC; 
			output_1 : out STD_LOGIC;
			output_2 : out STD_LOGIC;
			output_3 : out STD_LOGIC
		);
	end component;
	
--instanciação do reg A
	component Registrador is
		port(
			clk    : in  STD_LOGIC;        -- Sinal de clock
         reset  : in  STD_LOGIC;        -- Sinal de reset
         enable   : in  STD_LOGIC;        -- Sinal de controle de carga
         d_in      : in  STD_LOGIC_VECTOR(7 downto 0); -- Entrada de dados
         d_out     : out STD_LOGIC_VECTOR(7 downto 0)  -- Saída (valor armazenado)
		);
		
	end component;
	
--instanciação do mux
	component mux_eight_four is
		port(
			A : in STD_LOGIC_VECTOR(7 downto 0); -- entrada A
			B : in STD_LOGIC_VECTOR(7 downto 0); -- entrada B
			C : in STD_LOGIC_VECTOR(7 downto 0); -- entrada R
			D : in STD_LOGIC_VECTOR(7 downto 0); -- entrada zero
			Sel : in STD_LOGIC_VECTOR(1 downto 0); -- para a seleção
			Y : out STD_LOGIC_VECTOR(7 downto 0) -- saída
		);
	end component;
	
begin
	Dem : demux
		port map(
			input_data => reg_write,
			sel => WR,
			output_0 => enable_a,
			output_1 => enable_b,
			output_2 => enable_r,
			output_3 => enable_zero
		);
		
	register_a_1 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_a,
			d_in => WD,
			d_out => sigAmux1
		);
	
	register_b_1 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_b,
			d_in => WD,
			d_out => sigBmux1
		);
		
	register_r_1 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_r,
			d_in => WD,
			d_out => sigRmux1
		);
		
	register_0_1 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_zero,
			d_in => WD,
			d_out => sig0mux1
		);
		
		register_a_2 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_a,
			d_in => WD,
			d_out => sigAmux2
		);
	
	register_b_2 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_b,
			d_in => WD,
			d_out => sigBmux2
		);
		
	register_r_2 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_r,
			d_in => WD,
			d_out => sigRmux2
		);
		
	register_0_2 : Registrador
		port map(
			clk => clk,
			reset => reset,
			enable => enable_zero,
			d_in => WD,
			d_out => sig0mux2
		);
		
	Mux1 : mux_eight_four
		port map(
			A => sigAmux1,
			B => sigBmux1,
			C => sigRmux1,
			D => sig0mux1,
			Sel => end_RA,
			Y => r_a
		);
		
	Mux2 : mux_eight_four
		port map(
			A => sigAmux2,
			B => sigBmux2,
			C => sigRmux2,
			D => sig0mux2,
			Sel => end_RB,
			Y => r_b
		);
		
	RA <= r_a;
	RB <= r_b;



end hardware;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		