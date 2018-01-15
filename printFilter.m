function [] = printFilter(B,A,titulo)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[H, w] = freqz(B, A, 4000);
mH = abs(H);          % unidades lineale s
mHdb = 20*log10(mH);
title(titulo);
subplot(2,1,1)
plot(w/pi,mH);
subplot(2,1,2)
plot(w/pi,mHdb);
end

