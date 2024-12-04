-- true table
-- sel2 sel1 sel0 |   out
------------------|--------
--  0    0    0   | A + B            [a0..a3]  [b0..b3]
--  0    0    1   | A - B             _____   _____
--  0    1    0   | A and B  [s0..s2] \    \ /    /
--  0    1    1   | A or B             \   ULA   /   
--  1    0    0   | not A               \_______/
--  1    0    1   | not B                [00..03]
--  1    1    0   |   z
--  1    1    1   |   z


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port (
        A : in std_logic_vector(7 downto 0); -- Primeiro operando
        B : in std_logic_vector(7 downto 0); -- Segundo operando
        Op : in std_logic_vector(3 downto 0); -- Código da operação
        Result : out std_logic_vector(7 downto 0); -- Resultado da operação
        Zero : out std_logic; -- Flag Zero
        Sinal : out std_logic; -- Flag Sinal
        Carry : out std_logic; -- Flag Carry
        Overflow : out std_logic -- Flag Overflow
    );
end alu;

architecture hardware of alu is
signal temp_result_out : std_logic_vector(7 downto 0);
begin
    process(A, B, Op, temp_result_out)
    variable temp_result : std_logic_vector(8 downto 0); -- Resultado temporário para Carry
    begin
        case Op is
            when "0000" => -- ADD
                temp_result := ('0' & A) + ('0' & B);
                temp_result_out <= temp_result(7 downto 0);
                Carry <= temp_result(8);
                Overflow <= (A(7) and B(7) and not temp_result_out(7)) or (not A(7) and not B(7) and temp_result_out(7));
					 Sinal <= temp_result_out(7);
                
            when "0001" => -- SUB
                temp_result := ('0' & A) - ('0' & B);
                temp_result_out <= temp_result(7 downto 0);
                Carry <= temp_result(8);
                Overflow <= (A(7) and not B(7) and not temp_result_out(7)) or (not A(7) and B(7) and temp_result_out(7));
					 Sinal <= temp_result_out(7);
                
            when "0010" => -- AND
                temp_result_out <= A and B;
                Carry <= '0';
                Overflow <= '0';
                
            when "0011" => -- OR
                temp_result_out <= A or B;
                Carry <= '0';
                Overflow <= '0';
                
            when "0100" => -- NOT
                temp_result_out <= not A;
                Carry <= '0';
                Overflow <= '0';
                
            when others =>
                temp_result_out <= (others => '0');
                Carry <= '0';
                Overflow <= '0';
        end case;

        -- Atualizar flags Zero e Sinal
        if temp_result_out = "00000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
		  Result <= temp_result_out;
    end process;
end hardware;