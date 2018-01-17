%[Z, P, K] = room('jorge.cmaeso@alumnos.upm.es', 'angela.burgaleta.ledesma@alumnos.upm.es');
[Z, P, K] = room('jorge.cmaeso@alumnos.upm.es', 'angela.burgaleta.ledesma@alumnos.upm.es');
[B, A] = zp2tf(Z, P, K);
%plot_tf(B,A);
figure(1)
printFilter(B,A,'Funcion distorsionadora');
[Binv, Ainv] = calculaInversa(Z,P,K);
figure(2)
printFilter(Binv,Ainv,'Funcion Inversa Estable')


%%Definicion de Filtros
[Blpf, Alpf] = pasobajo(2,5000,48e3,13);
[Bhpf, Ahpf] = pasoalto(2,20e3,48e3,-10);
[Bpb1, Apb1] = pasobanda(1,8000,48e3,3.8);
[Bpb2, Apb2] = pasobanda(2,6300,48e3,5.4);
[Bpb3, Apb3] = pasobanda(1,12500,48e3,4);

figure(3)
printFilter(Bhpf,Ahpf,'Filtro Paso Alto');
figure(4)
printFilter(Blpf,Alpf,'Filtro Paso Bajo');
figure(5)
printFilter(Bpb1,Apb1,'Filtro Paso Banda 250');
figure(6)
printFilter(Bpb2,Apb2,'Filtro Paso Banda 2500');
figure(7)
printFilter(Bpb3,Apb3,'Filtro Paso Banda 16000');

% Combinamos los filtros
Bfiltros = [Bhpf; Blpf; Bpb1; Bpb2; Bpb3];
Afiltros = [Ahpf; Alpf; Apb1; Apb2; Apb3];



