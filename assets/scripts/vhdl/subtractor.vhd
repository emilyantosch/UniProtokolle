library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity subtractor is
  port (
    B_X   : in std_logic_vector(9 downto 0);
    B_W   : in std_logic_vector(9 downto 0);
    DELTA : out std_logic_vector(9 downto 0)
  );
end entity subtractor;

architecture behav of subtractor is
  component carrylookahead is
    port (
      add1   : in bit_vector(9 downto 0);
      add2   : in bit_vector(9 downto 0);
      sign   : out std_logic;
      result : out std_logic_vector(8 downto 0)
    );
  end component;

  signal TC_B_W   : bit_vector(9 downto 0);
  signal sA       : bit_vector(9 downto 0);
  signal sR       : std_logic_vector(8 downto 0);
  signal signedBX : std_logic;

begin

  cla : carrylookahead
  port map(
    add1   => sA,
    add2   => TC_B_W,
    sign   => signedBX,
    result => sR
  );
  sA     <= to_bitvector(B_X);
  TC_B_W <= not(to_bitvector(B_W));
  DELTA  <= signedBX & sR;
end architecture;