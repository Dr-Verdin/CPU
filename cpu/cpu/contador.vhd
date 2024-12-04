library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
    Port (
        clk_in   : in STD_LOGIC;          -- Clock do processador
        reset_in : in STD_LOGIC;          -- Reset para reiniciar o PC
        pc_op_in : in STD_LOGIC_VECTOR(1 downto 0); -- Operação do PC
        pc_in    : in STD_LOGIC_VECTOR(7 downto 0); -- Endereço de Branch
        pc_out   : out STD_LOGIC_VECTOR(7 downto 0) -- Endereço atual
    );
end contador;

architecture hardware of contador is
    signal pc: STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Inicializado com 0
begin
    process (clk_in, reset_in)
    begin
        if reset_in = '1' then
            pc <= (others => '0'); -- Reset do PC
        elsif rising_edge(clk_in) then
            case pc_op_in is
                when "00" => -- Incremento (próxima instrução)
                    pc <= STD_LOGIC_VECTOR(unsigned(pc) + 1);
                when "01" => -- Branch (salto para endereço)
                    pc <= pc_in;
                when "10" => -- NOP (não faz nada, mantém o valor)
                    pc <= pc;
                when others =>
                    pc <= pc; -- Default
            end case;
        end if;
    end process;

    pc_out <= pc; -- Saída do PC
end hardware;