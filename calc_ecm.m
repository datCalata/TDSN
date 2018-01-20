function [ecm] = calc_ecm(S1,S2)
%Calcula el error cuadratico medio dadas 2 señales
%   Detailed explanation goes here
diff = (S1-S2).^2;
ecm = sum(diff)/length(S1);
ecm = sqrt(ecm); 
end

