-------------------------------------------------------
--! Tarefa 04: shifter
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 29/10/24
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is -- entidade testbench
end entity testbench;

architecture stimulus of testbench is -- arquitetura da entidade testbench
    signal input_t : unsigned(7 downto 0);
    signal shift_cntrl_t : unsigned(1 downto 0);
    signal shift_out_t : unsigned(15 downto 0);

begin

    shifter_inst : entity work.shifter -- instancia da entidade shifter
    port map(
        input => input_t, 
        shift_cntrl => shift_cntrl_t,
        shift_out  => shift_out_t
    );
    
    process_a: process
    begin

        input_t <= to_unsigned(7, 8);  -- input recebe o valor 7 em binario, input é de 8 bits    
        shift_cntrl_t <= to_unsigned(0, 2);  -- inícia com o valor 0, tamanho de 2 bits        
        wait for 5 ns;
              
        shift_cntrl_t <= to_unsigned(1, 2); -- shift_cntrl_t vale 1            
        wait for 5 ns;
     
        shift_cntrl_t <= to_unsigned(2, 2);  -- shift_cntrl_t vale 2            
        wait for 5 ns;

        shift_cntrl_t <= to_unsigned(3, 2);  -- shift_cntrl_t vale 3            

        wait;
    end process process_a;

end architecture stimulus;