LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY jkff IS
    PORT (
        Clk : IN STD_LOGIC;
        nRst : IN STD_LOGIC; -- Negative reset
        J : IN STD_LOGIC;
        K : IN STD_LOGIC;
        Q : OUT STD_LOGIC;
        NOTQ : OUT STD_LOGIC;
    );
END ENTITY;

ARCHITECTURE rtl OF jkff IS
BEGIN

    -- Flip-flop with synchronized reset
    PROCESS (Clk) IS
    BEGIN

        IF rising_edge(Clk) THEN
            IF nRst = '0' THEN
                Q <= '0';
                NOTQ <= '1';
            ELSE
                IF (J = '1' OR J = '0') AND NOT J = K THEN
                    Q <= J;
                    NOTQ <= K;
                ELSIF J = '1' AND K = '1' THEN
                    Q <= NOT Q;
                    NOTQ <= NOT NOTQ;
                END IF;
            END IF;

        END PROCESS;

    END ARCHITECTURE;