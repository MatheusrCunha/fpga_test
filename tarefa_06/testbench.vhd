--! Tarefa 06: Registrador de 16 bits
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 02/11/2024

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
     constant tam_t : integer := 16; --tamanho do registrador
end entity testbench;

architecture RTL of testbench is

    signal clk_t : std_logic;
    signal clk_ena_t: std_logic;
    signal sclr_in_t : std_logic;
    signal datain_t : unsigned((tam_t-1) downto 0);
    signal reg_out_t : unsigned((tam_t-1) downto 0);
    
begin

    reg_inst : entity work.reg
    generic map(
        tam => tam_t
    )
    port map(
        clk     => clk_t,
        sclr_in => sclr_in_t,
        clk_ena => clk_ena_t,
        datain  => datain_t,
        reg_out => reg_out_t
    );

    -- processo do clock
    stimulus_process_clk : process
    begin
        clk_t <= '0';
        wait for 5 ns;                  
        clk_t <= '1';                  
        wait for 5 ns;
    end process stimulus_process_clk;

    -- processo do clk_ena
    stimulus_process_clk_ena : process
    begin
        clk_ena_t <= '0';                 
        wait for 6 ns;
        clk_ena_t <= '1';                 
        wait;
    end process stimulus_process_clk_ena;
    
    stimulus_process_sclr_n : process
    begin
        sclr_in_t <= '0';  --! sclr começa com 0                
        wait for 12 ns;  --! espera 12 ns             
        sclr_in_t <= '1';                  
        wait for 15 ns;                
        sclr_in_t <= '0';                 
        wait;
    end process stimulus_process_sclr_n;

    process
    begin
        datain_t <= to_unsigned(10, datain_t'length); 
        wait for 6 ns; 
        datain_t <= to_unsigned(3, datain_t'length); 
        wait for 10 ns; 
        datain_t <= to_unsigned(50, datain_t'length); 
        wait for 5 ns;
        datain_t <= to_unsigned(4, datain_t'length); 
        wait for 5 ns;

    end process ;
    
end architecture RTL;
