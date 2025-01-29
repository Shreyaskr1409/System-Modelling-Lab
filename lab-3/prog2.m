clc;
close all;
clear all;

% Exponential

t = input("Enter time till wave will be present (in s):");
x = 0:0.01:t;
y = exp(x);
a = y(length(y) - 1);

plot(x,y);
ylim([-1, a+1])
grid on;

return;