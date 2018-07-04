----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2018 15:56:40
-- Design Name: 
-- Module Name: clk_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
use IEEE.STD_LOGIC_arith.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_div is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           duty: in STD_LOGIC_VECTOR(3 downto 0);
           sig_out : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is

signal div: std_logic := '1';
signal count :  integer range 0 to 1700000 :=0;

begin

process(clk,rst,duty)
--variable count :  integer range 0 to 1700000;

begin
if (rst = '1') then
    div <='0';
    count <= 0;

elsif rising_edge(clk) then
   
    count <= count+1;
  
  --duty 0000
    if(duty="0000") and (count=106250) then
        div<= '0';
        
  --duty 0001
            elsif(duty="0001") and (count=212500) then
                div<='0';  
  
  --duty 0010
            elsif(duty="0010") and (count=318750) then
                div<='0'; 
                  
  --duty 0011
            elsif(duty="0011") and (count=425000) then
                div<='0';
                                  
  --duty 0100
            elsif(duty="0100") and (count=531250) then
                div<='0';
                                                  
  --duty 0101
            elsif(duty="0101") and (count=637500) then
                div<='0';
                                                                  
  --duty 0110
            elsif(duty="0110") and (count=743750) then
                div<='0';
                                                                                   
  --duty 0111
            elsif(duty="0111") and (count=850000) then
                div<='0';
                
  --duty 1000
            elsif(duty="1000") and (count=956250) then
                if(div='0') then
                div<='0';
                end if;
                                
  --duty 1001
            elsif(duty="1001") and (count=1062500) then
                div<='0';
                                                
  --duty 1010
            elsif(duty="1010") and (count=1168750) then
                div<='0'; 
                
  --duty 1011
            elsif(duty="1011") and (count=1275000) then
                div<='0';
                                
  --duty 1100
            elsif(duty="1100") and (count=1381250) then
                div<='0';
                                                
  --duty 1101
            elsif(duty="1101") and (count=1487500) then
                div<='0'; 
                                                                
  --duty 1110
            elsif(duty="1110") and (count=1593750) then
                div<='0';
  
  --duty 1111 
           elsif(duty="1111") then     
                div<='1';
                count<= 0;
                
  --end 
           elsif (count=1700000) then     
                div<='1';
                count<= 0; 
    end if;
end if;
end process;

sig_out <= div;

end Behavioral;
