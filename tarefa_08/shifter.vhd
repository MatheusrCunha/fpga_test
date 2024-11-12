-------------------------------------------------------
--! Tarefa 04: shifter
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 29/10/24
-------------------------------------------------------
--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;
--! Use conversion functions

entity shifter is -- início da entidade
    port (
        input         : in  unsigned(7 downto 0); -- Entrada de 8 bits
        shift_cntrl   : in  unsigned(1 downto 0); -- Controle de 2 bits
        shift_out     : out unsigned(15 downto 0) -- Saída de 16 bits                          
    );
end entity shifter; -- fim da entidade

architecture RTL of shifter is -- início da arquitetura
begin
    process(input, shift_cntrl) is
    begin 
        shift_out <= (others => '0');

        if shift_cntrl = "00" then -- Se shift_cntrl é zero, shift_out[7:0] igual a input[7:0]
            shift_out(7 downto 0) <= input(7 downto 0); 

        elsif shift_cntrl = "01" then -- Se shift_cntrl é 1, shift_out[11:4] igual input[7:0] -- shift de 4-bits.
            shift_out(11 downto 4) <=  input(7 downto 0) ;

        elsif shift_cntrl = "10" then -- Se shift_cntrl é 2,  shift_out[15:8] igual input[7:0] -- shift de 8-bits
            shift_out(15 downto 8) <=  input(7 downto 0);

        elsif shift_cntrl = "11" then -- Se shift_cntrl is 3, shift_out[7:0] igual input[7:0]).
            shift_out(7 downto 0) <= input(7 downto 0); 
        end if;

    end process;
end architecture RTL;
