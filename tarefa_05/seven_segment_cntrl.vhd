-------------------------------------------------------
--! Tarefa 05: decoder 7 segmentos
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 07/11/2024
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment_cntrl is --!início da entidade
    port(
        input_t : in unsigned(3 downto 0); --! entrada 
        segs : out std_logic_vector(7 downto 0) --! saída
    );
end entity seven_segment_cntrl; --!fim da entidade

architecture Behavioral of seven_segment_cntrl is --! início da arquitetura
begin
    process (input_t)
    begin
        case input_t is        -- abcdefggp
            when x"0" => segs <= "00000011"; --! segs recebe 0 quando a entrada for x"0"
            when x"1" => segs <= "10011111";
            when x"2" => segs <= "00100101";
            when x"3" => segs <= "00001101";
            when x"4" => segs <= "10011001";
            when x"5" => segs <= "01001001";
            when x"6" => segs <= "01000001";
            when x"7" => segs <= "00011111";
            when x"8" => segs <= "00000001";
            when x"9" => segs <= "00001001";
            when others => segs <= "11111110";
        end case;
    end process;
end architecture Behavioral; --! fim da arquitetura
