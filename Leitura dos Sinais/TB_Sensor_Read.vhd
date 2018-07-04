library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Sensor_Read is
--  Port ( );
end TB_Sensor_Read;

architecture Behavioral of TB_Sensor_Read is

component sensor_read is
    Port ( right : in STD_LOGIC;
           left : in STD_LOGIC;
           center : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sensor_value : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal right :  STD_LOGIC := '0';
signal left :  STD_LOGIC := '0';
signal center :  STD_LOGIC := '0';
signal clk :  STD_LOGIC := '0';
signal reset :  STD_LOGIC := '0';
signal sensor_value :  STD_LOGIC_VECTOR(2 downto 0) := "000";

begin

clk <= not clk after 5 ns; 
reset <= '0', '1' after 15 ns, '0' after 25 ns;
right <= '0' after 15 ns, '1' after 50 ns, '0' after 100 ns;
center <= '1' after 15 ns, '0' after 80 ns;
left <= '0' after 15 ns, '1' after 80 ns;


uu1: sensor_read port map(
    right => right,
    left => left,
    center => center,
    clk => clk,
    reset => reset,
    sensor_value => sensor_value
);

end Behavioral;
