library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity carrylookahead is
  port (
    add1   : in bit_vector(9 downto 0);
    add2   : in bit_vector(9 downto 0);
    sign   : out std_logic;
    result : out std_logic_vector(8 downto 0)
  );
end entity;

architecture behav of carrylookahead is

  component fulladder
    port (
      a    : in bit;
      b    : in bit;
      cin  : in bit;
      S    : out std_logic;
      cout : out bit
    );
  end component;
  signal carry : bit_vector(10 downto 0);
  signal sum   : std_logic_vector(9 downto 0);
  signal gen   : bit_vector(10 downto 0);
  signal prop  : bit_vector(10 downto 0);
begin

  clahgen : for i in 0 to 9 generate
    fulladder_inst : fulladder
    port map(
      a    => add1(i),
      b    => add2(i),
      cin  => carry(i),
      S    => sum(i),
      cout => open
    );
  end generate;

  genprop : for j in 0 to 9 generate
    gen(j)       <= add1(j) and add2(j);
    prop(j)      <= add1(j) or add2(j);
    carry(j + 1) <= gen(j) or (prop(j) and carry(j));
  end generate;

  carry(0) <= '1';
  sign     <= sum(9);
  result   <= std_logic_vector(abs(signed(sum(result'range))));

end architecture;