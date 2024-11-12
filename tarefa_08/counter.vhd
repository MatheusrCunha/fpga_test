-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 08
-- Data: 03/11/24

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity counter is
    port(
        clk : in std_logic; --clock
        aclr_n : in std_logic; 
        count_out : out unsigned(1 downto 0) --! saída do contador
    );
end entity counter;

architecture RTL of counter is 
begin
    process (clk, aclr_n) --! process síncrono
        variable ct : unsigned(1 downto 0);  
    begin
        if aclr_n = '0' then  --! se aclr_n for 0
            ct := ((others => '0'));
        elsif rising_edge(clk) then
            ct := ct + 1; --! ct soma mais um
        end if;
        count_out <= ct;
    end process;
end architecture RTL;

