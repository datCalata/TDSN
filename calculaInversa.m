function [B,A] = calculaInversa(Z,P,K)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Pn = Z(abs(Z) < 1); %Descarta aquellos ceros que no pueden ser compensados
Zn = P;
[B, A] = zp2tf(Zn, Pn, 1);
end

