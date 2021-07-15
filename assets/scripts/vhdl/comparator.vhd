library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity comparator is
  port (
    clk      : in std_logic;
    reset    : in std_logic;
    io       : inout std_logic_vector(9 downto 0) := "ZZZZZZZZZZ";
    ST_B_X   : in bit;
    ST_B_W   : in bit;
    ST_DELTA : in bit;
    EXAKT    : out bit;
    ZU_KLEIN : out bit
  );
end entity comparator;

architecture rtl of comparator is
  component subtractor is
    port (
      B_X   : in std_logic_vector(9 downto 0);
      B_W   : in std_logic_vector(9 downto 0);
      DELTA : out std_logic_vector(9 downto 0)
    );
  end component;

  signal result : std_logic_vector(9 downto 0);
  type statetype is (reading_BX, reading_BW, calculating, output);
  signal X, W       : std_logic_vector(9 downto 0) := "0000000000";
  signal state      : statetype                    := calculating;
  signal next_state : statetype                    := calculating;
begin

  sub : subtractor
  port map(
    B_X   => X,
    B_W   => W,
    DELTA => result
  );

  WR : process (state, clk, ST_DELTA)
  begin
    if state = output and clk'event and clk = '1' then
      io <= result;
    elsif state = calculating and clk'event and clk = '1' then
      io <= (others => 'Z');
    end if;
    if result(9) = '1' then
      ZU_KLEIN <= '1';
    elsif X = W then
      EXAKT <= '1';
    else
      ZU_KLEIN <= '0';
      EXAKT    <= '0';
    end if;
  end process;

  RD : process (io, ST_B_X, clk)
  begin
    if state = reading_BX and clk'event and clk = '1' then
      X <= io;
    elsif state = reading_BW and clk'event and clk = '1' then
      W <= io;
    end if;
  end process;

  SW : process (reset, clk)
  begin
    if clk'event and clk = '1' and reset = '1' then
      state <= calculating;
    elsif clk'event then
      state <= next_state;
    end if;
  end process;

  SN : process (ST_B_W, ST_B_X, ST_DELTA, clk)
    variable counter : integer := 0;
  begin
    case state is
      when calculating =>
        io <= "ZZZZZZZZZZ";
        if ST_B_X = '1' then
          next_state <= reading_BX;
        elsif ST_B_W = '1' then
          next_state <= reading_BW;
        elsif ST_DELTA = '1' then
          next_state <= output;
        end if;
      when reading_BX =>
        if ST_B_X = '0' then
          next_state <= calculating;
        elsif ST_B_W = '1' then
          next_state <= reading_BW;
        elsif ST_DELTA = '1' then
          next_state <= output;
        end if;
      when reading_BW =>
        if ST_B_W = '0' then
          next_state <= calculating;
        elsif ST_B_X = '1' then
          next_state <= reading_BX;
        elsif ST_DELTA = '1' then
          next_state <= output;
        end if;
      when output =>
        if clk'event and clk = '1' then
          counter := counter + 1;
          if clk'event and clk = '1' and counter = 2 then
            next_state <= calculating;
            counter := 0;
          end if;
        end if;
    end case;
  end process;

end architecture;