function [] = muestraImitar(hc,hfiltros,w,figura)
%Funcion usada para ajustar los filtros visualmente

figure(figura)
subplot(2,2,1);
plot(w/pi,abs(hfiltros));
title('hfiltros(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,2);
plot(w/pi,abs(hc));
title('hc(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,4);
plot(w/pi,20*log10(abs(hc)));
title('hc(w)');
ylabel('dB')
xlabel('w/Pi rad')
subplot(2,2,3);
plot(w/pi,20*log10(abs(hfiltros)));
title('hfiltros(w)');
ylabel('dB')
xlabel('w/Pi rad')
end

