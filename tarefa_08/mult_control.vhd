-- Controlador
-- Matheus Rodrigues da Cunha
-- Data: 10/11/2024

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult_control is
    port(
        clk       : in  std_logic;
        reset_a   : in  std_logic;
        start     : in  std_logic;
        count     : in  unsigned;
        input_sel : out unsigned(1 downto 0);
        shift_sel : out unsigned(1 downto 0);
        state_out : out unsigned(2 downto 0);
        done      : out std_logic;
        clk_ena   : out std_logic;
        sclr_n    : out std_logic
    );

end entity mult_control;

architecture RTL of mult_control is

    type state_type is (IDLE, LSB, MID, MSB, CALC_DONE, ERR);
    signal state : state_type;

begin
    state_machine : process(reset_a, clk)
    begin
        if reset_a = '1' then
            state <= IDLE;

        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if start = '1' then
                        state <= LSB;
                    else
                        state <= IDLE;
                    end if;

                when LSB =>
                    if start = '0' and count = "00" then
                        state <= MID;
                    else
                        state <= ERR;
                    end if;

                when MID =>
                    if start = '0' and count = "10" then
                        state <= MSB;
                    elsif start = '0' and count = "01" then
                        state <= MID;
                    else
                        state <= ERR;
                    end if;

                when MSB =>
                    if start = '0' and count = "11" then
                        state <= CALC_DONE;
                    else
                        state <= ERR;
                    end if;

                when CALC_DONE =>
                    if start = '0' then
                        state <= IDLE;
                    else
                        state <= ERR;
                    end if;

                when ERR =>
                    if start = '1' then
                        state <= LSB;
                    else
                        state <= ERR;
                    end if;
            end case;
        end if;
    end process state_machine;

    output : process(state)
    begin
        state_out <= "000";
        case state is
            when IDLE =>
                state_out <= "000";
            when LSB =>
                state_out <= "001";
            when MID =>
                state_out <= "010";
            when MSB =>
                state_out <= "011";
            when CALC_DONE =>
                state_out <= "100";
            when ERR =>
                state_out <= "101";
        end case;
    end process;

    output_mealy : process(state, count, start)
    begin
        done      <= '0';
        clk_ena   <= '0';
        sclr_n    <= '0';
        input_sel <= "00";
        shift_sel <= "00";

        case state is
            when IDLE =>
                if start = '0' then
                    sclr_n <= '1';
                else
                    clk_ena <= '1';
                end if;

            when LSB =>
                if start = '0' and count = "00" then
                    sclr_n    <= '1';
                    clk_ena   <= '1';
                    input_sel <= "00";
                    shift_sel <= "00";
                else
                    sclr_n <= '1';
                end if;

            when MID =>
                if start = '0' and count = "01" then
                    sclr_n    <= '1';
                    clk_ena   <= '1';
                    input_sel <= "01";
                    shift_sel <= "01";
                elsif start = '0' and count = "10" then
                    sclr_n    <= '1';
                    clk_ena   <= '1';
                    input_sel <= "10";
                    shift_sel <= "01";
                else
                    sclr_n <= '1';
                end if;

            when MSB =>
                if start = '0' and count = "11" then
                    sclr_n    <= '1';
                    clk_ena   <= '1';
                    input_sel <= "11";
                    shift_sel <= "10";
                else
                    sclr_n <= '1';
                end if;

            when CALC_DONE =>
                if start = '0' then
                    done   <= '1';
                    sclr_n <= '1';
                else
                    sclr_n <= '1';
                end if;
            when ERR =>
                if start = '1' then
                    clk_ena <= '1';
                else
                    sclr_n <= '1';
                end if;
        end case;
    end process;

end architecture RTL;
