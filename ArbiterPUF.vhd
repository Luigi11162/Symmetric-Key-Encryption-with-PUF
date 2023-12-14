LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY arbiter_puf IS
    PORT(
        challenge : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        response : OUT STD_LOGIC
    );
END arbiter_puf;

ARCHITECTURE Behavioral OF arbiter_puf IS
    SIGNAL out_mux_0 : STD_LOGIC;
    SIGNAL out_mux_1 : STD_LOGIC;
    SIGNAL out_mux_2 : STD_LOGIC;
    SIGNAL out_mux_3 : STD_LOGIC;
    SIGNAL out_mux_4 : STD_LOGIC;
    SIGNAL out_mux_5 : STD_LOGIC;
    SIGNAL out_mux_6 : STD_LOGIC;
    SIGNAL out_mux_7 : STD_LOGIC;
    SIGNAL res : STD_LOGIC;
    SIGNAL res_n : STD_LOGIC;
    
    COMPONENT mux_2to1 IS
        PORT ( sel : IN  STD_LOGIC; -- select input
            a : IN  STD_LOGIC;      -- input
            b : IN STD_LOGIC;       -- input
            x : OUT STD_LOGIC       -- output
        );
    END COMPONENT;

    COMPONENT flip_flop IS
        PORT (
            s : IN STD_LOGIC;
            r : IN STD_LOGIC;
            q : OUT STD_LOGIC;
            q_n : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    mux_0: mux_2to1
    PORT MAP(
        sel => challenge(3),
        a=>'1',
        b=>'1',
        x=>out_mux_0
    );
    mux_1: mux_2to1
    PORT MAP(
        sel => challenge(3),
        a=>'1',
        b=>'1',
        x=>out_mux_1
    );
    mux_2: mux_2to1
    PORT MAP(
        sel => challenge(2),
        a=> out_mux_0,
        b=>out_mux_1,
        x=>out_mux_2
    );
    mux_3: mux_2to1
    PORT MAP(
        sel => challenge(2),
        a=>out_mux_1,
        b=>out_mux_0,
        x=>out_mux_3
    );
    mux_4: mux_2to1
    PORT MAP(
        sel => challenge(1),
        a=>out_mux_2,
        b=>out_mux_3,
        x=>out_mux_4
    );
    mux_5: mux_2to1
    PORT MAP(
        sel => challenge(1),
        a=>out_mux_3,
        b=>out_mux_2,
        x=>out_mux_5
    );
    mux_6: mux_2to1
    PORT MAP(
        sel => challenge(0),
        a=>out_mux_4,
        b=>out_mux_5,
        x=>out_mux_6
    );
    mux_7: mux_2to1
    PORT MAP(
        sel => challenge(0),
        a=>out_mux_5,
        b=>out_mux_4,
        x=>out_mux_7
    );
    flip_flop_0: flip_flop
    PORT MAP(
        s => out_mux_6,
        r => out_mux_7,
        q => res,
        q_n => res_n
    );
    response <= res;

END Behavioral;
