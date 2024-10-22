-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 01

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is -- inicio da entidade adder
    generic (
        constant tam : integer := 16 -- define um generic chamado data do tipo inteiro com 16
    );
    port (
        dataa : in unsigned(tam-1 downto 0);  -- define dataa como entrada do tipo unsigned
        datab : in unsigned(tam-1 downto 0);  -- define datab como entrada do tipo unsigned
        sum : out unsigned(tam-1 downto 0) -- define sum como saída do tipo unsigned
    );
end entity adder; -- fim da entity adder

architecture rtl of adder is -- início da arquitetura
begin
    sum <= dataa + datab;  -- sum recebe a soma de dataa + datab
end architecture rtl; -- fim da arquitetura


