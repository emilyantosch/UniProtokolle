entity comparator is
  port (
    clk      : in std_logic;
    reset    : in std_logic;
    B_X      : in bit_vector(9 downto 0);
    B_W      : in bit_vector(9 downto 0);
    ST_B_X   : in bit;
    ST_B_W   : in bit;
    ST_DELTA : in bit;
    DELTA    : out bit_vector(9 downto 0);
    EXAKT    : out bit;
    ZU_KLEIN : out bit;
  );
end entity comparator;

architecture rtl of comparator is

  signal result    : bit_vector(9 downto 0);
  signal secondCLK : bit;
  type statetype is (reading_BX, reading_BW, calculating, output);
  signal X, W              : bit_vector(9 downto 0);
  signal state, next_state : statetype;
begin

  WR : process (state)
  begin
    if state = output and clk'event and clk = '1' then
      DELTA <= result;
    end if;
    if DELTA(9) = '1' then
      ZU_KLEIN <= '1';
    else if X = W then
      EXAKT <= '1';
    else
      ZU_KLEIN <= '0';
      EXAKT    <= '0';
    end process;

    RD : process (B_X, ST_B_X, clk)
    begin
      if state = reading_BX and clk'event and clk = '1' then
        X <= B_X;
      else if state = reading_BW and clk'event and clk = '1' then
        W <= B_W;
      end if;
    end process;

    SW : process (reset, clk)
    begin
      if clk'event and clk = '1' and reset = '1' then
        state      <= calculating;
        next_state <= state;
      else if clk'event and clk = '1' then
        state <= next_state;
      end if;
    end process;

    SN : process
    begin
      case state is
        when calculating =>
          if ST_B_X = '1' then
            next_state       <= reading_BX;
          else if ST_B_W   <= '1' then
            next_state       <= reading_BW;
          else if ST_DELTA <= '1' then
            next_state       <= output;
          end if;
        when reading_BX =>
          if ST_B_X = '0' and clk'event and clk = '0' then
            next_state <= calculating;
          end if;
        when reading_BW =>
          if ST_B_W = '0' and clk'event and clk = '0' then
            next_state <= calculating;
          end if;
        when output =>
          if clk'event and clk = '1' then
            secondCLK <= '1';
            if clk'event and clk = '1' and secondCLK = '1' then
              next_state <= calculating;
              secondCLK = '0';
            end if;
          end case;
      end process;

    end architecture;