library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           sensor_in : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0);
           md_sentido : out STD_LOGIC;
           me_sentido : out STD_LOGIC;
           md_out : out STD_LOGIC_VECTOR (3 downto 0);
           me_out : out STD_LOGIC_VECTOR (3 downto 0));
end FSM;

architecture Behavioral of FSM is

type estados is (parado, perdido, leitura, direita_brusca, esquerda_brusca, direita_fina, esquerda_fina, frente);
signal estado_atual, proximo_estado : estados := parado;

-- 0 para direita e 1 para esquerda
signal ultima_rot : STD_LOGIC;

signal duty_md : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal duty_me : STD_LOGIC_VECTOR (3 downto 0) := "0000";

-- 1 para frente e 0 para tarde
signal sentido_md : STD_LOGIC := '0';
signal sentido_me : STD_LOGIC := '0';

begin

-- Lógica sequencial de mudança dos estados --
u1: process(clk, reset)
begin
    if rising_edge(clk) then
        if reset='1' then
            estado_atual <= parado;
        else
            estado_atual <= proximo_estado; 
        end if;
    end if;
end process; 

-- Lógica combinacional para mudança de estados --
u2: process(estado_atual, proximo_estado, sensor_in)
begin
    case estado_atual is
        when leitura =>
            -- está sobre a linha e irá para frente
            if sensor_in = "010" then
                proximo_estado <= frente;
            -- está começando a sair para a esquerda e irá devagar para a direita
            elsif sensor_in = "011" then
                proximo_estado <= direita_fina;
            -- já saiu muito à esquerda e irá imediatamente para a direita
            elsif sensor_in = "001" then
                proximo_estado <= direita_brusca;  
            -- está começando a sair para a direita e irá devagar para a esquerda              
            elsif sensor_in = "110" then
                proximo_estado <= esquerda_fina;
            -- já saiu muito à direita e irá imediatamente para a esquerda            
            elsif sensor_in = "100" then
                proximo_estado <= esquerda_brusca;              
            -- está perdido
            elsif sensor_in = "000" then
                proximo_estado <= perdido;
            -- possível cruzamento
            elsif sensor_in = "111" then
                proximo_estado <= frente;  
            -- parado
            else 
                proximo_estado <= parado;
            end if;   
                      
        when frente =>
            duty_md <= "1111";
            duty_me <= "1111";
            sentido_md <= '1';
            sentido_me <= '1';
            proximo_estado <= leitura;        
        
        when direita_fina =>
            duty_md <= "0111";
            duty_me <= "0111";
            sentido_md <= '0';
            sentido_me <= '1';
            ultima_rot <= '0';
            proximo_estado <= leitura;
            
        when direita_brusca =>
            duty_md <= "1100";
            duty_me <= "1100";
            sentido_md <= '0';
            sentido_me <= '1';
            ultima_rot <= '0';
            proximo_estado <= leitura;        
      
        when esquerda_fina =>
            duty_md <= "0111";
            duty_me <= "0111";
            sentido_md <= '1';
            sentido_me <= '0';
            ultima_rot <= '1';
            proximo_estado <= leitura;
            
        when esquerda_brusca =>
            duty_md <= "1100";
            duty_me <= "1100";
            sentido_md <= '1';
            sentido_me <= '0';
            ultima_rot <= '1';
            proximo_estado <= leitura;
            
        when parado =>
            duty_md <= "0000";
            duty_me <= "0000";
            sentido_md <= '1';
            sentido_me <= '1';
            proximo_estado <= leitura;        
        
        when perdido =>
            if ultima_rot = '0' then
                 duty_md <= "0111";
                 duty_me <= "0111";
                 sentido_md <= '1';
                 sentido_me <= '0';
            else
                 duty_md <= "0111";
                 duty_me <= "0111";
                 sentido_md <= '0';
                 sentido_me <= '1';
            end if;
			proximo_estado <= leitura;
        end case;
end process;

md_sentido <= sentido_md;
me_sentido <= sentido_me;
md_out <= duty_md;
me_out <= duty_me;
led <= sensor_in;

end Behavioral;
