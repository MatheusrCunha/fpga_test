
-- Multiplicador 8x8
-- Matheus Rodrigues da Cunha
-- Data: 10/11/2024

--! Use standard library
library ieee;
--! Use standard logic elements
use ieee.std_logic_1164.all;
--! Use conversion functions
use ieee.numeric_std.all;

entity multiplicador8x8 is
    port(
        clk            : in  std_logic; 
        reset_a        : in  std_logic;
        start          : in  std_logic;
        dataa          : in  unsigned(7 downto 0);
        datab          : in  unsigned(7 downto 0);
        product8x8_out : out unsigned(15 downto 0);
        done_flag      : out std_logic;
        seg_out        : out unsigned(7 downto 0)
    );
end entity multiplicador8x8;

architecture RTL of multiplicador8x8 is

    signal sel        : unsigned(1 downto 0); --sinal sel
    signal aout       : unsigned(3 downto 0); --sinal aout
    signal bout       : unsigned(3 downto 0); --sinal bout
    signal product    : unsigned(7 downto 0); --sinal prduct
    signal shift      : unsigned(1 downto 0); --sinal shift
    signal shift_out  : unsigned(15 downto 0);
    signal product8x8 : unsigned(15 downto 0);
    signal sum        : unsigned(15 downto 0);
    signal count      : unsigned(1 downto 0);
    signal state_out  : unsigned(2 downto 0);
    signal clk_ena    : std_logic;
    signal sclr_n     : std_logic;
    signal start_not  : std_logic;

    signal state_out_resized : unsigned(3 downto 0);

begin

    state_out_resized <= resize(state_out, 4);
    start_not         <= not start;
    mux4a : entity work.mux_sel
        generic map(
            tam => 4
        )

        port map(
            mux_in_a => dataa(3 downto 0),
            mux_in_b => dataa(7 downto 4),
            mux_sel  => sel(1),
            mux_out  => aout
        );
    mux4b : entity work.mux_when
        generic map(
            tam => 4
        )
        port map(
            mux_in_a => datab(3 downto 0),
            mux_in_b => datab(7 downto 4),
            mux_sel  => sel(0),
            mux_out  => bout
        );

    mult4x4 : entity work.mult
        generic map(
            tam => 4
        )
        port map(
            dataa   => aout, --ligo o sinal
            datab   => bout,
            product => product
        );
    shifter : entity work.shifter
        port map(
            shift_out   => shift_out,
            input       => product,
            shift_cntrl => shift
        );
    adder : entity work.adder
        generic map(
            tam => 16
        )
        port map(
            dataa => shift_out,
            datab => product8x8,
            sum   => sum
        );
    reg16 : entity work.reg
        generic map(
            tam => 16
        )
        port map(
            clk     => clk,
            sclr_n  => sclr_n,
            clk_ena => clk_ena,
            datain  => sum,
            reg_out => product8x8
        );
    counter : entity work.counter
        port map(
            clk       => clk,
            aclr_n    => start_not,
            count_out => count
        );
    mult_control : entity work.mult_control
        port map(
            clk       => clk,
            reset_a   => reset_a,
            start     => start,
            count     => count,
            input_sel => sel,
            shift_sel => shift,
            state_out => state_out,
            done      => done_flag,
            clk_ena   => clk_ena,
            sclr_n    => sclr_n
        );

    seven_segment_cntrl : entity work.seven_segment_cntrl
        port map(
            input_t => state_out_resized,
            segs => seg_out
         
        );
    product8x8_out <= product8x8;

end architecture RTL;
