--! Aluno: Matheus Rodrigues da Cunha
--! Data: 26/10/24

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
    constant tam_t : integer := 4;
end entity testbench;

architecture stimulus of testbench is
    signal mux_in_a_t : unsigned(tam_t - 1 downto 0);
    signal mux_in_b_t : unsigned(tam_t - 1 downto 0); 
    signal mux_sel_t : std_logic; 
    signal mux_sel_out : unsigned(tam_t - 1 downto 0); 
    signal mux_when_out : unsigned(tam_t - 1 downto 0);

begin

    tst1_inst : entity work.mux_sel --! instância da entidade mux_sel
    generic map(
        tam => tam_t
    )
    port map(
        mux_in_a => mux_in_a_t,
        mux_in_b => mux_in_b_t,
        mux_sel => mux_sel_t,
        mux_out => mux_sel_out
    );

    tst2_inst : entity work.mux_when --! instância da entidade mux_when
    generic map(
        tam => tam_t
    )
    port map(
        mux_in_a => mux_in_a_t,
        mux_in_b => mux_in_b_t,
        mux_sel => mux_sel_t,
        mux_out => mux_when_out
    );


    mux_in_a_process: process
    begin

        mux_in_a_t <= to_unsigned(1, mux_in_a_t'length); --! mux_in_a_t recebe o valor 1 em decimal
        wait for 5 ns; --! espera 5 ns
    
        mux_in_a_t <= to_unsigned(3, mux_in_a_t'length); 
        wait for 12 ns;
    
        mux_in_a_t <= to_unsigned(9, mux_in_a_t'length); 
        wait for 18 ns;

        wait;
        end process ;

    mux_in_b_process: process
    begin

        mux_in_b_t <= to_unsigned(5, mux_in_b_t'length); 
        wait for 10 ns; 

        mux_in_b_t <= to_unsigned(13, mux_in_b_t'length); 
        wait for 15 ns;

        mux_in_b_t <= to_unsigned(15, mux_in_b_t'length); 
        wait for 20 ns;

        wait;
    end process;
        

    mux_sel_t_process: process
    begin

        mux_sel_t <= '1'; --! mux_sel é 1
        wait for 3 ns; --! espera 3 ns

        mux_sel_t <= '0';
        wait for 8 ns;

        mux_sel_t <= '1';
        wait for  16 ns;

        wait;
    end process;


end architecture stimulus;
