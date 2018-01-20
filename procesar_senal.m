function [Y] = procesar_senal(bcoefs,acoefs,Bsis,Asis,X)
%PROCESASENAL procesa la señal por el sistema distorsionador y compensador
%   
%Filtro del sistema distorsionador
tmp = filter(Bsis,Asis,X);
%Filtros del sistema compensador
[rows, cols] = size(bcoefs);
for i = 1 : rows
       tmp = filter(bcoefs(i,:), acoefs(i,:), tmp); 
end
Y = tmp;

end

