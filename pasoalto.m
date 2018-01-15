function [Bcof, Acof] = pasoalto(BW,f0,Fs,G)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = 10^(G/40);
w0 = 2*pi*f0/Fs;
alpha = sin(w0)*sinh( log(2)/2 * BW * w0/sin(w0));


            b0 =    A*( (A+1) + (A-1)*cos(w0) + 2*sqrt(A)*alpha );
            b1 = -2*A*( (A-1) + (A+1)*cos(w0)                   );
            b2 =    A*( (A+1) + (A-1)*cos(w0) - 2*sqrt(A)*alpha );
            a0 =        (A+1) - (A-1)*cos(w0) + 2*sqrt(A)*alpha;
            a1 =    2*( (A-1) - (A+1)*cos(w0)                   );
            a2 =        (A+1) - (A-1)*cos(w0) - 2*sqrt(A)*alpha;
Bcof = [b0 b1 b2];
Acof = [a0 a1 a2];
end

