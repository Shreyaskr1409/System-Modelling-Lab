clc;
close all;
clear all;

% Pulse

t = input("Enter time till wave will be present (in s):");
a = input("Amplitude:");
x = 0:0.001:t;
u = input("Up time: (in ms)");
d = input("Down time: (in ms)");
y = zeros(length(x));

for i = 1:length(x)
    if rem(x(i), (u+d)/1000) < u/1000
        y(i) = a;
    end
end

plot(x,y);
ylim([-a-1, a+1])
grid on;

return;