--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Tue Jul  3 10:07:29 2018
--Host        : DESKTOP-PJCBN9K running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=1,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_sensor_read_0_0 is
  port (
    right : in STD_LOGIC;
    left : in STD_LOGIC;
    center : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sensor_value : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component design_1_sensor_read_0_0;
  component design_1_clk_wiz_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0;
  component design_1_rst_clk_wiz_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_clk_wiz_100M_0;
  component design_1_PWM_Gen_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    duty : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sig_out : out STD_LOGIC
  );
  end component design_1_PWM_Gen_0_0;
  component design_1_PWM_Gen_1_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    duty : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sig_out : out STD_LOGIC
  );
  end component design_1_PWM_Gen_1_0;
  component design_1_FSM_Controller_0_0 is
  port (
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    sensor_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    led : out STD_LOGIC_VECTOR ( 2 downto 0 );
    md_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    me_sentido : out STD_LOGIC_VECTOR ( 1 downto 0 );
    md_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    me_out : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_1_FSM_Controller_0_0;
  signal FSM_Controller_0_led : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal FSM_Controller_0_md_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal FSM_Controller_0_md_sentido : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal FSM_Controller_0_me_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal FSM_Controller_0_me_sentido : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PWM_Gen_0_sig_out : STD_LOGIC;
  signal PWM_Gen_1_sig_out : STD_LOGIC;
  signal center_0_1 : STD_LOGIC;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal clk_wiz_locked : STD_LOGIC;
  signal left_0_1 : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal right_0_1 : STD_LOGIC;
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sensor_read_0_sensor_value : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal sys_clock_1 : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 100000000, PHASE 0.000";
begin
  center_0_1 <= center_sensor;
  led(2 downto 0) <= sensor_read_0_sensor_value(2 downto 0);
  led_0(2 downto 0) <= FSM_Controller_0_led(2 downto 0);
  left_0_1 <= left_sensor;
  md_sentido(1 downto 0) <= FSM_Controller_0_md_sentido(1 downto 0);
  me_sentido(1 downto 0) <= FSM_Controller_0_me_sentido(1 downto 0);
  out_m1 <= PWM_Gen_0_sig_out;
  out_m2 <= PWM_Gen_1_sig_out;
  reset_1 <= reset;
  right_0_1 <= right_sensor;
  sys_clock_1 <= sys_clock;
FSM_Controller_0: component design_1_FSM_Controller_0_0
     port map (
      clk => clk_wiz_clk_out1,
      led(2 downto 0) => FSM_Controller_0_led(2 downto 0),
      md_out(3 downto 0) => FSM_Controller_0_md_out(3 downto 0),
      md_sentido(1 downto 0) => FSM_Controller_0_md_sentido(1 downto 0),
      me_out(3 downto 0) => FSM_Controller_0_me_out(3 downto 0),
      me_sentido(1 downto 0) => FSM_Controller_0_me_sentido(1 downto 0),
      reset => rst_clk_wiz_100M_peripheral_aresetn(0),
      sensor_in(2 downto 0) => sensor_read_0_sensor_value(2 downto 0)
    );
PWM_Gen_0: component design_1_PWM_Gen_0_0
     port map (
      clk => clk_wiz_clk_out1,
      duty(3 downto 0) => FSM_Controller_0_md_out(3 downto 0),
      rst => rst_clk_wiz_100M_peripheral_aresetn(0),
      sig_out => PWM_Gen_0_sig_out
    );
PWM_Gen_1: component design_1_PWM_Gen_1_0
     port map (
      clk => clk_wiz_clk_out1,
      duty(3 downto 0) => FSM_Controller_0_me_out(3 downto 0),
      rst => rst_clk_wiz_100M_peripheral_aresetn(0),
      sig_out => PWM_Gen_1_sig_out
    );
clk_wiz: component design_1_clk_wiz_0
     port map (
      clk_in1 => sys_clock_1,
      clk_out1 => clk_wiz_clk_out1,
      locked => clk_wiz_locked,
      reset => reset_1
    );
rst_clk_wiz_100M: component design_1_rst_clk_wiz_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_locked,
      ext_reset_in => reset_1,
      interconnect_aresetn(0) => NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_clk_out1
    );
sensor_read_0: component design_1_sensor_read_0_0
     port map (
      center => center_0_1,
      clk => clk_wiz_clk_out1,
      left => left_0_1,
      reset => rst_clk_wiz_100M_peripheral_aresetn(0),
      right => right_0_1,
      sensor_value(2 downto 0) => sensor_read_0_sensor_value(2 downto 0)
    );
end STRUCTURE;
