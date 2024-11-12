--! Aluno: Matheus Rodrigues da Cunha
--! Data: 26/10/24

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity mux_sel is --! início da entidade
    generic (
        constant tam : integer := 4 --! contante para mudar o tamanho da portas 
    );
    port (
        mux_in_a   : in  unsigned(tam - 1 downto 0);  --! entrada a do multiplexador
        mux_in_b   : in  unsigned(tam- 1 downto 0);  --! entrada b do multiplexador
        mux_sel    : in std_logic;                   --! seleção do multiplexador
        mux_out    : out  unsigned(tam - 1 downto 0)   --! saída do multiplexador
    );
end entity mux_sel; -- fim da entidade

architecture RTL of mux_sel is --! início da arquitetura
    
begin
    with mux_sel select  
        mux_out <= mux_in_a when '0', --! mux_out recebe mux_in_a quando mux_sel for 0
                   mux_in_b when others; --! mux_out recebe mux_in_b quando mux_sel for others
end architecture RTL; --! fim da arquiterura



