library IEEE;
use ieee.STD_LOGIC_1164.ALL;

-- interface
entity mux_eight_four is
	port (
			A : in STD_LOGIC_VECTOR(7 downto 0); -- entrada A
			B : in STD_LOGIC_VECTOR(7 downto 0); -- entrada B
			C : in STD_LOGIC_VECTOR(7 downto 0); -- entrada R
			D : in STD_LOGIC_VECTOR(7 downto 0); -- entrada zero
			Sel : in STD_LOGIC_VECTOR(1 downto 0); -- para a seleção
			Y : out STD_LOGIC_VECTOR(7 downto 0) -- saída
			);
end mux_eight_four;

-- arquitetura
architecture Behavioral of mux_eight_four is
begin
	process(A, B, C, D, Sel)
	begin
		case Sel is
			when "00" =>
				Y<= A;
			when "01" =>
				Y<= B;
			when "10" =>
				Y<= C;
			when "11" =>
				Y<= D;
			when others =>
				Y<= (others => '0');
		end case;
	end process;
end Behavioral;