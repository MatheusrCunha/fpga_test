-------------------------------------------------------
--! Tarefa 02: multiplicador de n-bits
--! Aluno: Matheus Rodrigues da Cunha
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
    constant tam : integer := 4; 
end entity testbench;

architecture stimulus of testbench is
    signal tb_dataa : unsigned(tam - 1 downto 0);
    signal tb_datab : unsigned(tam - 1 downto 0);
    signal tb_product : unsigned((tam * 2) - 1 downto 0);

begin

    mult_inst : entity work.mult -- entidade mult instanciada
    generic map(
        tam => tam
    )
    port map(
        dataa => tb_dataa, --associa a entidade para tb_dataa
        datab => tb_datab,
        product  => tb_product
    );
    
    process_dataa: process
    begin
        tb_dataa <= to_unsigned(15, tb_dataa'length);
        wait for 2 ns;  
        tb_dataa <= to_unsigned(12, tb_dataa'length);
        wait for 6 ns; 
        wait; 
    end process process_dataa;

    process_datab: process
    begin
        tb_datab <= to_unsigned(10, tb_datab'length);
        wait for 10 ns; 
        tb_datab <=  to_unsigned(11, tb_datab'length);
        wait for 15 ns; 
        wait;  
    end process process_datab;
    
end architecture stimulus;
