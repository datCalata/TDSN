%% Calculos 
clear
clc

%Generar Funcion Distorsionadora
fs = 48e3;
[Z, P, K] = room('jorge.cmaeso@alumnos.upm.es', 'angela.burgaleta.ledesma@alumnos.upm.es');

%Calculo de H
ceros_fuera = Z(abs(Z) > 1); 
ceros_dentro = Z(abs(Z) < 1);
ceros_compensar = 1./ceros_fuera;
ceros_hmin = [ceros_dentro; ceros_compensar];
polos_hmin = P;
ceros_hap = ceros_fuera;
polos_hap = ceros_compensar;

%Calculo de costantes A->Hmin y B->Hap

a_hmin = prod(-ceros_hap);
b_hap = 1/a_hmin;
k_hc = 1/(a_hmin*K);

%Calculo de coeficientes
[B_sist, A_sist] = zp2tf(Z,P,K);
[B_hmin, A_hmin] = zp2tf(ceros_hmin,polos_hmin,K*a_hmin);
[B_hap, A_hap] = zp2tf(ceros_hap,polos_hap,b_hap);
[B_hc, A_hc] = zp2tf(polos_hmin,ceros_hmin,k_hc);

%Espectros de las distintas h del sistema
[hsist, w] = freqz(B_sist,A_sist,4000);
hmin = freqz(B_hmin,A_hmin,4000);
hap = freqz(B_hap,A_hap,4000);
hc = freqz(B_hc,A_hc,4000);

%Calculo de los filtros
[B_lpf, A_lpf] = pasobajo(2.2,2500,48e3,3.8);
[B_hpf, A_hpf] = pasoalto(2/3,20e3,48e3,-6);
[B_pbf1, A_pbf1] = pasobanda(2,10000,48e3,0.4);
[B_pbf2, A_pbf2] = pasobanda(1,8000,48e3,1.4);
[B_pbf3, A_pbf3] = pasobanda(1,16000,48e3,-4);

hlpf = freqz(B_lpf,A_lpf,4000);
hpb1 = freqz(B_pbf1,A_pbf1,4000);
hhpf = freqz(B_hpf,A_hpf,4000);
hpb2 = freqz(B_pbf2,A_pbf2,4000);
hpb3 = freqz(B_pbf3,A_pbf3,4000);

bcoefs = [B_lpf;B_pbf1;B_pbf2;B_pbf3;B_hpf];
acoefs = [A_lpf;A_pbf1;A_pbf2;A_pbf3;A_hpf];
hfiltros = concatfilters(bcoefs,acoefs);


%Comprobaciones de las H
hideal = hc.*hsist;
hcomp = hfiltros.*hsist;
hcomp2 = hfiltros.*hmin;
%Comprobacion Ecm
ecm_hfiltros = calc_ecm(abs(hc),abs(hfiltros))
%% Senales de prueba
[x8, fs8] = audioread('test_8.wav');
[x16, fs16] = audioread('test_16.wav');
[x44, fs44] = audioread('test_44.wav');
%Calculo de cambio de frecuencia fraccionario
[P8, Q8] = rat(fs/fs8);
[P16, Q16] = rat(fs/fs16);
[P44, Q44] = rat(fs/fs44);
%Calculo de beta
beta = 0.1102*(100-8.7);

% Resample
x81 = resample(x8,P8,Q8,10,beta);
x161 = resample(x16,P16,Q16,10,beta);
x441 = resample(x44,P44,Q44,10,beta);

%Senales Procesadas
Y8 = procesar_senal(bcoefs,acoefs,B_sist,A_sist,x81);
Y16 = procesar_senal(bcoefs,acoefs,B_sist,A_sist,x161);
Y44 = procesar_senal(bcoefs,acoefs,B_sist,A_sist,x441);

%Senales distorsionadas
Ysist8 = filter(B_sist,A_sist,x81);
Ysist16 = filter(B_sist,A_sist,x161);
Ysist44 = filter(B_sist,A_sist,x441);

%Espectrogramas
print_espectrograma(x81,Y8,1);
print_espectrograma(x161,Y16,2);
print_espectrograma(x441,Y44,3);

%Calculo ECM
ECM8 = calc_ecm(x81,Y8)
ECM16 = calc_ecm(x161,Y16)
ECM44 = calc_ecm(x441,Y44)
ECM8sist = calc_ecm(x81,Ysist8)
ECM16sist = calc_ecm(x161,Ysist16)
ECM44sist = calc_ecm(x441,Ysist44)

%% Representacion
figure(1)
subplot(2,2,1);
zplane(Z,P)
title('H(z)');
subplot(2,2,2);
zplane(ceros_hmin,polos_hmin);
title('Hmin(z)');
subplot(2,2,3);
zplane(ceros_hap,polos_hap);
title('Hap(z)');
subplot(2,2,4);
zplane(polos_hmin,ceros_hmin);
title('Hinv(z)');

%Plot Funciones Interesantes
figure(2)
subplot(2,2,1);
plot(w/pi,abs(hsist))
title('H(w)');
subplot(2,2,2);
plot(w/pi,abs(hmin))
title('Hmin(w)');
subplot(2,2,3);
plot(w/pi,abs(hap))
title('Hap(w)');
subplot(2,2,4);
plot(w/pi,abs(hc))
title('Hinv(w)');

%Plot Funcion a simular
figure(3)
subplot(2,2,1);
plot(w/pi,abs(hc))
title('Hc(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,2);
plot(w/pi,abs(hfiltros))
title('Hfiltros(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,3);
plot(w/pi,20*log10(abs(hc)))
title('Hc(w)');
ylabel('dB')
xlabel('w/Pi rad')
subplot(2,2,4);
plot(w/pi,abs(hc))
plot(w/pi,20*log10(abs(hfiltros)))
title('Hfiltos(w)');
ylabel('dB')
xlabel('w/Pi rad')

%Plot imitar
muestraImitar(hc,hfiltros,w,4);

%Comprobacion h
figure(5)
subplot(2,2,1);
plot(w/pi,abs(hap))
title('Hap(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,3);
plot(w/pi,abs(hcomp))
title('Hcomp = Hfiltros(w)*Hsist(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,2);
plot(w/pi,abs(hideal))
title('Hideal(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')
subplot(2,2,4);
plot(w/pi,abs(hcomp2))
title('Hcomp2 = Hfiltros(w)*Hmin(w)');
ylabel('Unidades Lineales')
xlabel('w/Pi rad')

%Filtros por separado
printFilter(B_lpf,A_lpf,'Paso Bajo',6);
printFilter(B_hpf,A_hpf,'Paso Alto',7);
printFilter(B_pbf1,A_pbf1,'Paso Banda 1',8);
printFilter(B_pbf2,A_pbf2,'Paso Banda 2',9);
printFilter(B_pbf3,A_pbf3,'Paso Banda 3',10);
%filtros juntos
figure(11)
plot(w,abs(hlpf),w,abs(hhpf),w,abs(hpb1),w,abs(hpb2),w,abs(hpb3))
%hc vs hfiltros
figure(12)
plot(w/pi,abs(hfiltros),w/pi,abs(hc),'-r')
title('Hc(w) vs Hfiltros(w)');
legend('Hfiltros','Hc');
figure(13)
plot(w/pi,20*log10(abs(hfiltros)),w/pi,20*log10(abs(hc)),'-r');
title('Hc(w) vs Hfiltros(w)');
legend('Hfiltros','Hc');
%Diferencia
figure(14)
subplot(2,1,1);
plot(w/pi,-abs(hfiltros)+abs(hc),0:0.05:1,-0.07,'.r',0:0.05:1,+0.07,'.r');
title('Hc(w) - Hfiltros(w)');
subplot(2,1,2);
plot(w/pi,-20*log10(abs(hfiltros))+20*log10(abs(hc)));
title('Hc(w) - Hfiltros(w)');