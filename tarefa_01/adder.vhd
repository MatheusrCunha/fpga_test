-------------------------------------------------------
--! Nome: Matheus Rdodrigues da Cunha
--! Tarefa 01: somador de n-bits
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	    
entity adder is
    generic (
        test : integer := 16      
    );
    port (
        dataa : in unsigned(test-1 downto 0);  -- Define a como entrada do tipo unsigned
        datab : in unsigned(test-1 downto 0);  --
        sum : out unsigned(test-1 downto 0) --
    );
end entity adder; -- end entity adder

architecture rtl of adder is
begin
    sum <= dataa + datab;
end architecture rtl;


