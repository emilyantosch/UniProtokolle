LIBRARY IEEE
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY converter IS
    PORT (
        g : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        c : IN STD_LOGIC;
        nRst : IN STD_LOGIC;

    );
END converter;
ARCHITECTURE behavior OF converter IS
    COMPONENT jkff IS
        PORT (
            Clk, nRst, J, K : IN STD_LOGIC;
            Q, NOTQ : OUT STD_LOGIC;
        );
    END COMPONENT;
BEGIN

u1: jkff port map(c => Clk, )