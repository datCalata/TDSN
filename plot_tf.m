function [] = plot_tf(NUM,DEN)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
figure(1);
bode(tf(NUM,DEN));
figure(2);
zplane(NUM, DEN)
end
