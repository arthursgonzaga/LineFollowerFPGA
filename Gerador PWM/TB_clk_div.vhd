----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2018 17:38:42
-- Design Name: 
-- Module Name: TB_clk_div - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_clk_div is
--  Port ( );
end TB_clk_div;

architecture Behavioral of TB_clk_div is

component clk_div
 Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           duty: in STD_LOGIC_VECTOR(3 downto 0);
           sig_out : out STD_LOGIC);
 end component;
 
  signal sig_clk : std_logic := '0';
  signal sig_rst : std_logic;
  signal sig_duty    : std_logic_vector (3 downto 0) := "0000";
  signal sig_sig_out : std_logic;

begin

M1: clk_div port map (sig_clk,sig_rst,sig_duty,sig_sig_out);
 
 sig_CLK   <= not sig_CLK after 5 ns; -- clk = 100 MHz.


process

begin
wait for 20 ns;

sig_DUTY <= "0111";
wait for 250 ms;

--sig_DUTY <= "0001";
--wait for 60 ms;

sig_DUTY <= "0010";
wait for 250 ms;

--sig_DUTY <= "0011";
--wait for 60 ms;

--sig_DUTY <= "0111";
--wait for 60 ms;

sig_DUTY <= "1110";
wait for 250 ms;

--sig_DUTY <= "1111";
--wait for 60 ms;

end process;
end Behavioral;
