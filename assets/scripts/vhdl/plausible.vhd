library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity plausible is
  port (
    G_X    : in bit_vector(9 downto 0);
    G_X_OK : out bit
  );
end plausible;

architecture arch of plausible is

  signal buf, plausible : bit_vector(9 downto 0);

begin

  -- Evaluates the current signal with the buffered previous data
  eval : process begin
    wait on G_X;
    plausible <= buf xor G_X;
    buf       <= G_X;
  end process eval;

  -- Counts the differences between the evaluated signal and the buffered one
  count : process
    variable sum : integer := 0;
  begin
    wait on plausible;
    sum := 0;
    for i in 0 to 9 loop
      if plausible(i) = '1' then
        sum := sum + 1;
      end if;
    end loop;
    if sum <= 1 then
      G_X_OK <= '1';
    else
      G_X_OK <= '0';
    end if;
  end process;

end architecture;