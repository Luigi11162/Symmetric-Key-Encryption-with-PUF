LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_2to1 IS
    PORT (
        delay : IN STD_LOGIC;   -- delay
        clock : IN STD_LOGIC;   -- clock
        sel : IN  STD_LOGIC;    -- select input
        a : IN  STD_LOGIC;      -- input
        b : IN STD_LOGIC;       -- input
        x : OUT STD_LOGIC
    );     -- output
END mux_2to1;

ARCHITECTURE Behavioral OF mux_2to1 IS
BEGIN
    PROCESS(clock)
    VARIABLE delay1 : TIME;
    VARIABLE delay2 : TIME;
    BEGIN
        IF rising_edge(clock) THEN
            IF delay = '0' THEN
                delay1 := 10 ns;
                delay2 := 500 ns;
            ELSE
                delay1 := 500 ns;
                delay2 := 10 ns;
            END IF;
            IF sel = '0' THEN
                x <= TRANSPORT a AFTER delay1;
            ELSE
                x <= TRANSPORT b AFTER delay2;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;
