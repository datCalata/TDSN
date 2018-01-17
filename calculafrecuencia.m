function [] = calculafrecuencia(w)
%calculafrecuencia
%   funcion para no tener que usar la calculadora calculando fc
fs = 48e3;
fc = w*fs/2;
fprintf('Frecuencia: %f\n',fc)
end

