LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY carryripple IS
    PORT (
        result : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        n : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        m : IN STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END carryripple;
ARCHITECTURE behavior OF carryripple IS
    COMPONENT fulladder IS
        PORT (
            Cin : IN STD_LOGIC;
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Cout : OUT STD_LOGIC;
            S : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL carry : STD_LOGIC_VECTOR(11 DOWNTO 0);
BEGIN

    fa1 : fulladder PORT MAP(Cin => carry(0), A => n(0), B => m(0), Cout => carry(1), S => result(0));
    fa2 : fulladder PORT MAP(Cin => carry(1), A => n(1), B => m(1), Cout => carry(2), S => sum(1));
    fa3 : fulladder PORT MAP(Cin => carry(2), A => n(2), B => m(2), Cout => carry(3), S => sum(2));
    fa4 : fulladder PORT MAP(Cin => carry(3), A => n(3), B => m(3), Cout => carry(4), S => sum(3));
    fa5 : fulladder PORT MAP(Cin => carry(4), A => n(4), B => m(4), Cout => carry(5), S => sum(4));
    fa6 : fulladder PORT MAP(Cin => carry(5), A => n(5), B => m(5), Cout => carry(6), S => sum(5));
    fa7 : fulladder PORT MAP(Cin => carry(6), A => n(6), B => m(6), Cout => carry(7), S => sum(6));
    fa8 : fulladder PORT MAP(Cin => carry(7), A => n(7), B => m(7), Cout => carry(8), S => sum(7));
    fa9 : fulladder PORT MAP(Cin => carry(8), A => n(8), B => m(8), Cout => carry(9), S => sum(8));
    fa10 : fulladder PORT MAP(Cin => carry(9), A => n(9), B => m(9), Cout => carry(10), S => sum(9));
    fa11 : fulladder PORT MAP(Cin => carry(10), A => n(10), B => m(10), Cout => carry(11), S => sum(10));
    carry(0) <= '0';
    result(11) <= carry(11);
END behavior;