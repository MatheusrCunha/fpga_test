-------------------------------------------------------
--! Tarefa 02: multiplicador de n-bits
--! Aluno: Matheus Rodrigues da Cunha
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	    

entity mult is
    generic (constant tam : integer := 4);
    port (
        dataa : in unsigned(tam - 1  downto 0);
        datab : in unsigned(tam - 1 downto 0);
        product : out unsigned((tam * 2) - 1 downto 0)
    );
end entity mult;

architecture rtl of mult is

begin

    product <= dataa * datab;

end architecture rtl;