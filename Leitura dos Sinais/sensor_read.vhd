library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sensor_read is
    Port ( right : in STD_LOGIC;
           left : in STD_LOGIC;
           center : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sensor_value : out STD_LOGIC_VECTOR (2 downto 0));
end sensor_read;

architecture Behavioral of sensor_read is

begin

convert: process(clk,reset)
begin
    if reset='1' then
        sensor_value <= "111";
    elsif rising_edge(clk) then
        if (left='0' and center ='0' and right='0') then
            sensor_value <= "000"; -- perdido
        elsif (left='0' and center ='0' and right='1') then
            sensor_value <= "001"; -- saiu a esquerda
        elsif (left='0' and center ='1' and right='0') then
            sensor_value <= "010"; -- seguir em frente
        elsif (left='0' and center ='1' and right='1') then
            sensor_value <= "011"; -- saindo a esquerda
        elsif (left='1' and center ='0' and right='0') then
            sensor_value <= "100"; -- saiu a direita
        elsif (left='1' and center ='1' and right='0') then
            sensor_value <= "110"; -- saindo a direita
        else
            sensor_value <= "111"; -- STOP
        end if;
    end if;    
        
end process;

end Behavioral;
