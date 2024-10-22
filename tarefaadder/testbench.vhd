
-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 01

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
    constant tam_t : integer := 16; 
end entity testbench;

architecture stimulus of testbench is
    signal tb_dataa : unsigned(tam_t - 1 downto 0);
    signal tb_datab : unsigned(tam_t - 1 downto 0);
    signal tb_sum : unsigned(tam_t - 1 downto 0);

begin
    -- instância de adder como nome adder_inst
    adder_inst : entity work.adder
    generic map(
        tam => tam_t
    )
    port map(
        dataa => tb_dataa,
        datab => tb_datab,
        sum   => tb_sum
    );
    -- dataa - processo sequencial
    process_dataa: process
    begin
        tb_dataa <= to_unsigned(5, tb_dataa'length);
        wait for 2 ns;  
        tb_dataa <= to_unsigned(12, tb_dataa'length);
        wait for 5 ns;  
        tb_dataa <= to_unsigned(10, tb_dataa'length);
        wait for 3 ns; 
        tb_dataa <= to_unsigned(5, tb_dataa'length);
        wait for 5 ns;
        wait; 
    end process process_dataa;

    -- datab - processo sequencial
    process_datab: process
    begin
        tb_datab <= to_unsigned(5, tb_datab'length);
        wait for 5 ns;  
        tb_datab <= to_unsigned(10, tb_datab'length);
        wait for 5 ns; 
        tb_datab <= to_unsigned(15, tb_datab'length);
        wait for 5 ns; 
        wait;  
    end process process_datab;
    
    
end architecture stimulus;
