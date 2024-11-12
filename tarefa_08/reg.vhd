--! Tarefa 06: Registrador de 16 bits
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 02/11/2024

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity reg is --inicio da entidade
    generic (
        constant tam : integer := 16 --tamanho do registrador
        );
    port(
        clk : in std_logic; --! clock
        sclr_n : in std_logic; --! entrada std_logic
        clk_ena: in std_logic; --! enable
        datain: in unsigned((tam-1) downto 0); --Entrada unsigned
        reg_out: out unsigned((tam-1) downto 0) --Saída unsigned
    );
end entity reg; --fim da entidade

architecture RTL of reg is --! início da arquitetura
begin
    process(clk, sclr_n) --! process sincrono
    begin
        if sclr_n = '0' then --! se sclr_in for 0, então
            reg_out <= (others => '0'); --! limpa a saída
        elsif rising_edge(clk) then --! se for subida de clock, então
            if clk_ena = '1' then --! se enable estiver ativado
                reg_out <= datain; --! reg_out recebe datain
            end if;
        end if;
    end process;

end architecture RTL; --! fim da arquitetura
