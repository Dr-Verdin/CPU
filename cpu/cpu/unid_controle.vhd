library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity unid_controle is
	port (
			code : in std_logic_vector(16 downto 0); -- entrada do code
			WR : out std_logic_vector(1 downto 0); -- saída WR
			end_RA : out std_logic_vector(1 downto 0); -- endereço de RA
			end_RB : out std_logic_vector(1 downto 0); -- endereço de RB
			Imm : out std_logic_vector(7 downto 0); -- Immediate
			RegWrite: out std_logic; -- saída RegWrite
			ALUOp : out std_logic_vector(3 downto 0); -- Indicar quando usa a ULA
			ALUSrc : out std_logic; -- sinal do Immediate
			PCSrc : out std_logic_vector(1 downto 0); -- JMP
			cmp: out std_logic
			);
end unid_controle;

architecture Behavioral of unid_controle is
begin
	process(code)
	begin
		WR <= code(11 downto 10);
		end_RA <= code(9 downto 8);
		end_RB <= code(1 downto 0);
		Imm <= code(7 downto 0);
		ALUSrc <= code(12);
		
		case code(16 downto 13) is -- pega os quatro primeirs bits
			when "0000" => -- ADD
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0000";
			when "0001" => -- SUB
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0001";
			when "0010" => -- AND
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0010";
			when "0011" => -- OR
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0011";
			when "0100" => -- NOT
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0100";
			when "0101" => -- CMP
				RegWrite <= '0';
				PCSrc <= "11";
				ALUOp <= "1111"; -- SEM OPERAÇÃO NA ULA = 1111
				cmp <= '1';
			when "0110" => -- JMP
				RegWrite <= '0';
				PCSrc <= "00";
				ALUOp <= "1111";
			when "0111" => -- JEQ
				RegWrite <= '0';
				PCSrc <= "01";
				ALUOp <= "1111";
			when "1000" => -- JGR
				RegWrite <= '0';
				PCSrc <= "10";
				ALUOp <= "1111";
			when "1001" => -- LOAD
				RegWrite <= 'X';
				PCSrc <= "11";
				ALUOp <= "1111";
			when "1010" => -- STORE
				RegWrite <= 'X';
				PCSrc <= "11";
				ALUOp <= "1111";
			when "1011" => -- MOV
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "0000"; -- o move funciona como sendo um add com o registrador zero
			when "1100" => -- IN
				RegWrite <= '1';
				PCSrc <= "11";
				ALUOp <= "1111";
			when "1101" => -- OUT
				RegWrite <= '0';
				PCSrc <= "11";
				ALUOp <= "1111";
			when "1110" => -- WAIT
				RegWrite <= 'X';
				PCSrc <= "11";
				ALUOp <= "1111";
			when others =>
				RegWrite <= 'X';
				PCSrc <= "11";
				ALUOp <= "1111";
		end case;
	end process;
end Behavioral;