function [] = muestraImitar(hc,hfiltros,w,figura)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
figure(figura)
subplot(3,1,1);
plot(w/pi,abs(hfiltros),w/pi,abs(hc),'r');
title('hc(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
axis([0 1 0.5 2])
subplot(3,1,2);
plot(w/pi,abs(hc));
title('hc(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(3,1,3);
plot(w/pi,20*log10(abs(hc)));
title('hlpf(z)');
ylabel('dB')
xlabel('w/Pi rad')
end

