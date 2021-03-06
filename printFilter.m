function [] = printFilter(B,A,titulo,figura)
%Dibuja la respuesta en frecuencia dadaos una serie de coeficientes A B
[H, w] = freqz(B, A, 4000);
mH = abs(H);          % unidades lineale s
mHdb = 20*log10(mH);
figure(figura);
subplot(2,1,1)
plot(w/pi,mH);
title(titulo);
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,1,2)
plot(w/pi,mHdb);
ylabel('dB')
xlabel('w/Pi rad')
end

