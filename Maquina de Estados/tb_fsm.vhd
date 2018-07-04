

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture Behavioral of tb_fsm is


signal led : STD_LOGIC_VECTOR ( 2 downto 0 ) := "000";
signal sensor_in : STD_LOGIC_VECTOR ( 2 downto 0 ) := "000";
signal md_sentido : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
signal me_sentido : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
signal out_m1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal out_m2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal reset : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';


component FSM is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           sensor_in : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0);
           md_sentido : out STD_LOGIC_VECTOR (1 downto 0);
           me_sentido : out STD_LOGIC_VECTOR (1 downto 0);
           md_out : out STD_LOGIC_VECTOR (3 downto 0);
           me_out : out STD_LOGIC_VECTOR (3 downto 0));
end component FSM;

begin

-- gerando clock
clk <= not clk after 5 ns;

-- reset
reset <= '0', '1' after 15 ns, '0' after 25 ns;

FSM_1: component FSM port map 
    (reset => reset, 
     clk => clk, 
     sensor_in => sensor_in,
     led => led,
     md_sentido => md_sentido,
     me_sentido => me_sentido,
     md_out => out_m1,
     me_out => out_m2);
     
sensor_in <= "010" after 50 ns, "011" after 200 ns, "010" after 250 ns, "011" after 300 ns, "001" after 350 ns, "011" after 400 ns, "010" after 450 ns, "111" after 500 ns, "000" after 550 ns; 
    

end Behavioral;
