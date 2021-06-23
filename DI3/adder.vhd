LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        input : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        i_o : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        enable : IN STD_LOGIC;
        bufsig : IN STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );

END adder;

ARCHITECTURE behav OF adder IS
    COMPONENT carryripple IS
        PORT (
            result : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            n : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            m : IN STD_LOGIC_VECTOR(10 DOWNTO 0)
        );
    END COMPONENT;

    TYPE statetype IS (first, second, third, fourth);
    SIGNAL state, next_state : statetype;
    SIGNAL buf : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL buf2 : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL iobuf : STD_LOGIC_VECTOR(11 DOWNTO 0);
BEGIN
    cr : carryripple PORT MAP(
        result(0) => iobuf(0), result(1) => iobuf(1), result(2) => iobuf(2), result(3) => iobuf(3),
        result(4) => iobuf(4), result(5) => iobuf(5), result(6) => iobuf(6), result(7) => iobuf(7), result(8) => iobuf(8), result(9) => iobuf(9),
        result(10) => iobuf(10), result(11) => iobuf(11), n(0) => buf(0), n(1) => buf(1), n(2) => buf(2), n(3) => buf(3), n(4) => buf(4),
        n(5) => buf(5), n(6) => buf(6), n(7) => buf(7), n(8) => buf(8), n(9) => buf(9), n(10) => buf(10), m(0) => buf2(0), m(1) => buf2(1), m(2) => buf2(2),
        m(3) => buf2(3), m(4) => buf2(4), m(5) => buf2(5), m(6) => buf2(6), m(7) => buf2(7), m(8) => buf2(8), m(9) => buf2(9), m(10) => buf2(10));
    WRITE : PROCESS (enable, bufsig) BEGIN
        IF clk'event AND clk = '0' AND state = fourth THEN
            output <= i_o;
        ELSE
            i_o <= (OTHERS => 'Z');
        END IF;
    END PROCESS;

    READ : PROCESS (reset, i_o, enable, input, clk) BEGIN
        IF reset = '1' THEN
            state <= first;
        END IF;
        IF enable = '1' AND state = first AND clk'event AND clk = '1' THEN
            i_o <= input;
            buf <= i_o AFTER 2 ns;
        ELSIF enable = '1' AND state = second AND clk'event AND clk = '1' THEN

            i_o <= input;
            buf2 <= i_o AFTER 25 ns;

        ELSE
            state <= next_state;
        END IF;
    END PROCESS;

    SN : PROCESS BEGIN
        next_state <= state;

        CASE State IS
            WHEN first => IF enable = '1' AND i_o'event THEN
                next_state <= second;
        END IF;
        WHEN second =>
        IF clk'event THEN
            next_state <= third;
        END IF;
        WHEN third => next_state <= fourth;
        WHEN fourth => IF bufsig = '1' AND clk'event AND clk = '1' THEN
        next_state <= first;
    END IF;
END CASE;
END PROCESS;
END behav;