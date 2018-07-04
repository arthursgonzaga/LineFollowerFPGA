library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_line_follower is
--  Port ( );
end tb_line_follower;

architecture Behavioral of tb_line_follower is

signal center_sensor : STD_LOGIC := '0';
signal led : STD_LOGIC_VECTOR ( 2 downto 0 ) := "000";
signal left_sensor : STD_LOGIC := '0';
signal md_sentido : STD_LOGIC := '0';
signal me_sentido : STD_LOGIC := '0';
signal out_m1 : STD_LOGIC := '0';
signal out_m2 : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal right_sensor : STD_LOGIC := '0';
signal sys_clock : STD_LOGIC := '0';

component design_1_wrapper is
  port (
    center_sensor : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 2 downto 0 );
    left_sensor : in STD_LOGIC;
    md_sentido : out STD_LOGIC;
    me_sentido : out STD_LOGIC;
    out_m1 : out STD_LOGIC;
    out_m2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    right_sensor : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end component;

begin

-- gerando clock
sys_clock <= not sys_clock after 5 ns;

-- reset
reset <= '0', '1' after 15 ns, '0' after 25 ns;

design_1_i: component design_1_wrapper
     port map (
      center_sensor => center_sensor,
      led(2 downto 0) => led(2 downto 0),
      left_sensor => left_sensor,
      md_sentido => md_sentido,
      me_sentido => me_sentido,
      out_m1 => out_m1,
      out_m2 => out_m2,
      reset => reset,
      right_sensor => right_sensor,
      sys_clock => sys_clock
    );
    
center_sensor <= '1' after 30 ns, '0' after 50 ns;
--left_sensor <= '';
right_sensor <= '1' after 60 ns, '0' after 90 ns; 


end Behavioral;
