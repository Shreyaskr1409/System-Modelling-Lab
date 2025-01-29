clc;
close all;
clear all;

% Impulse

t = input("Enter time till wave will be present (in s):");
a = input("Amplitude:");
x = 0:0.001:t;
u = input("Impulse time: (in ms)");
y = zeros(length(x));

for i = 1:length(x)
    if x(i) == u/1000
        y(i) = a;
    end
end

plot(x,y);
ylim([-a-1, a+1])
grid on;

return;