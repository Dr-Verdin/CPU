library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- interface
entity demux is
	port(
			input_data : in STD_LOGIC; -- sinal de entrada
			Sel : in STD_LOGIC_VECTOR(1 downto 0); -- sinal de seleção
			output_0 : out STD_LOGIC; 
			output_1 : out STD_LOGIC;
			output_2 : out STD_LOGIC;
			output_3 : out STD_LOGIC
			);
end demux;

architecture Behavioral of demux is
begin
	process (input_data, Sel)
	begin
		if input_data= '0' then
			output_0 <= '0';
			output_1 <= '0';
			output_2 <= '0';
			output_3 <= '0';
		else
			case Sel is
				when "00" =>
					output_0 <= input_data;
					
					output_1 <= '0';
					output_2 <= '0';
					output_3 <= '0';
				when "01" =>
					output_1 <= input_data;
					
					output_2 <= '0';
					output_3 <= '0';
					output_0 <= '0';
				when "10" =>
					output_2 <= input_data;
					
					output_3 <= '0';
					output_0 <= '0';
					output_1 <= '0';
				when "11" =>
					output_3 <= input_data;
					
					output_0 <= '0';
					output_1 <= '0';
					output_2 <= '0';
				when others => null;
			end case;
	end if;
	end process;
end Behavioral;