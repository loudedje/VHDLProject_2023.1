library ieee;
use ieee.std_logic_1164.all;

entity Elevador is
  port(sensor_andor1: in std_logic;
       sensor_andar2: in std_logic;
       sensor_andar3: in std_logic;
       sensor_andar4: in std_logic;
       clock: in std_logic;
       reset: in std_logic;
       motor1_parado: out std_logic;
       motor2_subindo: out std_logic;
       motor_descendo: out std_logic;
  );

END elevador;

ARCHITECTURE mainElevador OF elevador is
  type tipo_estado is(subindo,descendo,parado);
    SIGNAL  prox_estado, atual_estado;
  begin
    process(atual_estado,prox_estado)
      begin
        if reset ='1' then
          atual_estado=parado;  
          else if(clock'Event and clock='1')then  
          case atual_estado is
            when parado=> 
          if sensor_andar1 = '1' then
              prox_estado <= subindo;
          elsif sensor_andar2 = '1' then
              prox_estado <= subindo;
          elsif sensor_andar3 = '1' then
              prox_estado <= subindo;
          elsif sensor_andar4 = '1' then
              prox_estado <= parado;
          else
              prox_estado <= descendo;
          end if;
            when subindo=>
              if sensor_andar1='1' or sensor_andar2='1' or sensor_andar3='1' or sensor_andar4='1' then
               Prox_estado<=descendo;
              else
                prox_estado<=parado;
            when descendo=>
              if sensor_andar1='1'
              prox_estado<=parada;
              elsif sensor_andar2='1' or sensor_andar3='1' or sensor_andar4='1' then
                prox_estado<=subindo;
              else 
                prox_estado<=parada;
            when others =>
              null;
           end case
        end if  
    end process;

    motor_parado <= (atual_estado = parado) or (prox_estado = parado);
    motor_subindo <= prox_estado = subindo;
    motor_descendo <= prox_estado = descendo;
end architecture mainElevador;


    

              

  