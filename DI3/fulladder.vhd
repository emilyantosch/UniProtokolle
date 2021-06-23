ENTITY fulladder IS
    PORT (
        Cin : IN STD_LOGIC;
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Cout : OUT STD_LOGIC;
        S : OUT STD_LOGIC
    );
END fulladder;

ARCHITECTURE behaviour OF fulladder IS
BEGIN
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
END behaviour;