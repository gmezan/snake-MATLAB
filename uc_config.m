function [x,ps] = uc_config

try 
    delete(instrfind({'Port'},{'COM4'}));
    puerto_serial=serial('COM4');
    Baudios=puerto_serial.BaudRate;
    warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
    fopen(puerto_serial); 
%     for cont=1
%             valor_sensado=fscanf(puerto_serial,'%c',1);
%             fprintf("%d: %c\n",cont,valor_sensado);
% 
%             pause(0.01);
%             clc
%     end

    msgbox('Mando conectado');
    x = 0;
    ps = puerto_serial;
catch
    uiwait(msgbox('Algo no salio bien, intente de nuevo', 'Error','error'));
    x = []; %returning "NULL" value
    ps = 0;
end

    
%Cierro la conexión con el puerto serial y elimino las variables
%fclose(puerto_serial); 
%delete(puerto_serial);