-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 08
-- Data: 03/11/24

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
end entity testbench;

architecture stimulus of testbench is
    signal clk_t : std_logic;
    signal aclr_n_t : std_logic;
    signal count_out_t : unsigned(1 downto 0);

begin
    -- instância de adder como nome adder_inst
    counter_inst : entity work.counter
    port map(
        clk => clk_t,
        aclr_n => aclr_n_t,
        count_out => count_out_t
    );
  -- gera um clok
    process
    begin
      clk_t <= '0';
      wait for 1 ns;
      clk_t <= '1';
      wait for 1 ns;
    end process;

  --gera enable
    process
    begin
      aclr_n_t <= '0';
      wait for 2 ns;
      aclr_n_t <= '1';
      wait for 2 ns;
      aclr_n_t <= '0';
      wait for 2 ns;
      aclr_n_t <= '1';
      wait;
    end process;

  
end architecture stimulus;