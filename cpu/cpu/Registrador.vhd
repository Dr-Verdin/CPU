library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Registrador is
    Port ( clk    : in  STD_LOGIC;        -- Sinal de clock
           reset  : in  STD_LOGIC;        -- Sinal de reset
           enable   : in  STD_LOGIC;        -- Sinal de controle de carga
           d_in      : in  STD_LOGIC_VECTOR(7 downto 0); -- Entrada de dados
           d_out     : out STD_LOGIC_VECTOR(7 downto 0)  -- Saída (valor armazenado)
           );
end Registrador;

architecture Behavioral of Registrador is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            d_out <= (others => '0'); -- Reset do registrador
        elsif rising_edge(clk) then
            if enable = '1' then
                d_out <= d_in;  -- Carrega os dados no registrador
            end if;
        end if;
    end process;
end Behavioral;
