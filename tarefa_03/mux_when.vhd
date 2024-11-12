--! Aluno: Matheus Rodrigues da Cunha
--! Data: 26/10/24

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity mux_when is --! início da entidade
    generic (
        constant tam : integer := 4 --! contante para mudar o tamanho da portas 
    );
    port (
        mux_in_a   : in  unsigned(tam - 1 downto 0); --! entrada a do multiplexador
        mux_in_b   : in  unsigned(tam- 1 downto 0); --! entrada a do multiplexador
        mux_sel    : in std_logic; --! seleção do multiplexador                  
        mux_out    : out  unsigned(tam - 1 downto 0) --! saída do multiplexador  
    );
end entity mux_when; --! fim da entidade

architecture RTL of mux_when is --! início da arquitetura
    
begin

    mux_out <= mux_in_a when mux_sel = '0' else --! mux_ou recebe mux_in_a quando mux_sel for 0, senão recebe mux_in_b
               mux_in_b;

end architecture RTL;

