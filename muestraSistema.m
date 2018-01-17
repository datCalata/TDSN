function [] = muestraSistema(hlpf,hhpf,hbpf1,hbpf2,hbpf3,hfiltros,w,figura)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
figure(figura)
figure(3)
subplot(2,3,1);
plot(w/pi,abs(hlpf))
title('hlpf(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,3,2);
plot(w/pi,abs(hhpf))
title('hhpf(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,3,3);
plot(w/pi,abs(hbpf1))
title('hbpf1(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,3,4);
plot(w/pi,abs(hbpf2))
title('hlpf(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,3,5);
plot(w/pi,abs(hbpf3))
title('hlpf(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,3,6);
plot(w/pi,abs(hfiltros))
title('hfiltros(z)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
end

