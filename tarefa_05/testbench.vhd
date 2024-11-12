-------------------------------------------------------
--! Tarefa 05: decoder 7 segmentos
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 07/11/2024
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture RTL of testbench is
    signal input_tb : unsigned(3 downto 0); 
    signal segs_tb  : std_logic_vector(7 downto 0);
begin

    dut : entity work.seven_segment_cntrl
    port map(
        input_t => input_tb,
        segs  => segs_tb
    );

    -- entrada
    stimulus_process : process
    begin
        input_tb <= x"0"; --! imput recebe 0                
        wait for 5 ns; --! espera 5 ns
        input_tb <= x"1"; 
        wait for 5 ns;
        input_tb <= x"2"; 
        wait for 5 ns;
        input_tb <= x"3";              
        wait for 5 ns;
        input_tb <= x"4";
        wait for 5 ns;
        input_tb <= x"5";
        wait for 5 ns;
        input_tb <= x"6";
        wait for 5 ns;
        input_tb <= x"7";
        wait for 5 ns;
        input_tb <= x"8";
        wait for 5 ns;
        input_tb <= x"9";
        wait;
    end process stimulus_process;




end architecture RTL;
