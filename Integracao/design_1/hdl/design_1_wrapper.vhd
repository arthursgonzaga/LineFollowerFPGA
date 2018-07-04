--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Tue Jul  3 10:07:29 2018
--Host        : DESKTOP-PJCBN9K running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    center_sensor : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 2 downto 0 );
    led_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    left_sensor : in STD_LOGIC;
    md_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    me_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_m1 : out STD_LOGIC;
    out_m2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    right_sensor : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    center_sensor : in STD_LOGIC;
    left_sensor : in STD_LOGIC;
    right_sensor : in STD_LOGIC;
    out_m1 : out STD_LOGIC;
    out_m2 : out STD_LOGIC;
    sys_clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 2 downto 0 );
    md_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    me_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led_0 : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      center_sensor => center_sensor,
      led(2 downto 0) => led(2 downto 0),
      led_0(2 downto 0) => led_0(2 downto 0),
      left_sensor => left_sensor,
      md_sentido(1 downto 0) => md_sentido(1 downto 0),
      me_sentido(1 downto 0) => me_sentido(1 downto 0),
      out_m1 => out_m1,
      out_m2 => out_m2,
      reset => reset,
      right_sensor => right_sensor,
      sys_clock => sys_clock
    );
end STRUCTURE;
