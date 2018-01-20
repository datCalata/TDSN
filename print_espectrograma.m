function [] = print_espectrograma(X,Y,figura)
%print_espectrograma Imprime el espectrograma de dos señales
%   Detailed explanation goes here
figure(figura)
subplot(2,2,1)
specgram(X(:,1));
title('Canal 1 Original');
subplot(2,2,2)
specgram(X(:,2));
title('Canal 2 Original');
subplot(2,2,3)
specgram(Y(:,1));
title('Canal 1 Procesado');
subplot(2,2,4)
specgram(Y(:,2));
title('Canal 2 Procesado');
end

