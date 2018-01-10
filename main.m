%[Z, P, K] = room('jorge.cmaeso@alumnos.upm.es', 'angela.burgaleta.ledesma@alumnos.upm.es');
[Z, P, K] = room('jorge.cmaeso@alumnos.upm.es', 'angela.burgaleta.ledesma@alumnos.upm.es');
[B, A] = zp2tf(Z, P, K);
%plot_tf(B,A);
figure(1)
title('Funcion distorsionadora')
printFilter(B,A);
[Binv, Ainv] = calculaInversa(Z,P,K);
figure(2)
printFilter(Binv,Ainv)
title('Funcion Inversa Estable')
[Blpf, Alpf] = pasobajo(1,5000,48e3,2);
figure(3)
printFilter(Blpf,Alpf)
[Bhpf, Ahpf] = pasoalto(1,16e3,48e3,0.5);
figure(4)
printFilter(Bhpf,Ahpf)
[B2, A2] = pasobanda(1,9e3,48e3,1.5);
figure(5)
printFilter(B2,A2)
