LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY graytobinary IS
    PORT (
        b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        g : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        clk : IN STD_LOGIC;
        BUFFERED : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    );
END graytobinary;

ARCHITECTURE g2b_arch OF graytobinary IS
BEGIN (clk) PROCESS

    IF clk = '0' AND clk'event THEN

        buffered(3) <= b(3);
        buffered(2) <= b(3) XOR b(2);
        buffered(1) <= b(3) XOR b(2) XOR b(1);
        buffered(0) <= b(3) XOR b(2) XOR b(1) XOR g(0);
    ELSE
        g <= buffered;
    END g2b_arch;