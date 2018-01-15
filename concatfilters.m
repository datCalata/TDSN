function [Hdef,w] = concatfilters(Bcofs,Acofs)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(Bcofs);
H = []; 
for i = 1 : rows
       [tmp , w] = freqz(Bcofs(i,:), Acofs(i,:), 4000); 
       H =  [H tmp];
end 
[rows, cols] = size(H)
Hdef2 = 1;
for i = 1:cols
    Hdef2 = Hdef2 .* abs(H(:,i));
end
Hdef = Hdef2;
end

