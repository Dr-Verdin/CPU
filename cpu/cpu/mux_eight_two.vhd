library IEEE;
use ieee.STD_LOGIC_1164.ALL;

-- interface
entity mux_eight_two is
	port (
			A : in STD_LOGIC_VECTOR(7 downto 0); -- entrada A
			B : in STD_LOGIC_VECTOR(7 downto 0); -- entrada B
			Sel : in STD_LOGIC; -- para a seleção
			Y : out STD_LOGIC_VECTOR(7 downto 0) -- saída
			);
end mux_eight_two;

-- arquitetura
architecture Behavioral of mux_eight_two is
begin
	process(A, B, Sel)
	begin
		if Sel = '0' then
			Y <= A;
		else 
			Y <= B;
		end if;
	end process;
end Behavioral;