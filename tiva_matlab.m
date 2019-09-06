
delete(instrfind({'Port'},{'COM4'}));
puerto_serial=serial('COM4');
Baudios=puerto_serial.BaudRate;
%Advertencia si hay problemas en la comunicacion serial
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%Abro el puerto serial
fopen(puerto_serial); 
for cont=1:100
        valor_sensado=fscanf(puerto_serial,'%c',1);
        fprintf("%d: %c\n",cont,valor_sensado);

        pause(0.01);
        if valor_sensado == 'r'
            msgbox("r");
        end
        if valor_sensado == 'l'
            msgbox("l");
        end
        
end

%Cierro la conexión con el puerto serial y elimino las variables
fclose(puerto_serial); 
delete(puerto_serial);

