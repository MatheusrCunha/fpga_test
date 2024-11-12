-- Multiplicador 8x8
-- Nome: Matheus Rodrigues da Cunha
-- Data: 26/08/2023

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture RTL of testbench is
    signal clk_t : std_logic; --clock
    signal reset_a_t: std_logic;
    signal start_t:  std_logic;
    signal tb_dataa :  unsigned (7 downto 0);
    signal tb_datab :  unsigned (7 downto 0);
    signal product8x8_out_t: unsigned (15 downto 0);
    signal done_flag_t: std_logic;
    signal seg_out_t : std_logic_vector(7 downto 0);

    signal seg_out_resized_t : unsigned(7 downto 0);
    

begin
    multiplicador: entity work.multiplicador8x8
        port map(
            clk            => clk_t,
            reset_a        => reset_a_t,
            start          => start_t,
            dataa          => tb_dataa,
            datab          => tb_datab,
            product8x8_out => product8x8_out_t,
            done_flag      => done_flag_t,
            seg_out        => seg_out_resized_t
          
        );

    seg_out_t <= std_logic_vector(seg_out_resized_t);

    clk_process: process
    begin-- faz o processo do clock 1 seg em cada nivel logico
        clk_t <= '0';
        wait for 1 ns;
        clk_t <= '1';
        wait for 1 ns;
    end process;

    reset_process: process
    begin
        reset_a_t <= '1';
        wait for 5 ns;
        reset_a_t <= '0';
        wait;
    end process;

    start_process: process
    begin
        start_t <= '0';
        wait for 5 ns;
        start_t <= '1';
        wait for 1 ns;
        start_t <= '0';
        wait;
    end process;

    dataa_process: process
    begin
        tb_dataa <= to_unsigned(150, tb_dataa'length);
        tb_datab <= to_unsigned(72, tb_datab'length);
        wait;
    end process;
    
         
end architecture RTL;
