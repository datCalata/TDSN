function [Bcof, Acof] = pasobanda(BW,f0,Fs,A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
w0 = 2*pi*f0/Fs;
alpha = sin(w0)*sinh( log(2)/2 * BW * w0/sin(w0));
b0 =   1 + alpha*A;
b1 =  -2*cos(w0);
b2 =   1 - alpha*A;
a0 =   1 + alpha/A;
a1 =  -2*cos(w0);
a2 =   1 - alpha/A;
Bcof = [b0 b1 b2];
Acof = [a0 a1 a2];
end
