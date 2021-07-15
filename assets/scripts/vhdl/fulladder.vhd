library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity fulladder is
  port (
    a    : in bit;
    b    : in bit;
    cin  : in bit;
    S    : out std_logic;
    cout : out bit
  );
end entity fulladder;

architecture behav of fulladder is

begin
  S    <= std_logic(a xor b xor cin);
  cout <= (a and b) or (cin and a) or (cin and b);
end architecture;