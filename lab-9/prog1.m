clc;
close all;
clear all;

figure;

frq = 2;

x_t = @(t) sin(t);
x_s = @(s) integral(@(t) x_t(t).*exp(-s.*t), 0, Inf);
x_s(frq)

syms t s;
X_T = sin(t);
X_S = laplace(X_T, s);

a = subs(X_S, s, frq);
double(a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time = 2;
x_s = @(s) 1./(s.^2 + 1);
sigma = 1;
x_t = @(t) real(integral(@(w) (1/(2*pi)) .* x_s(sigma + 1i*w) .* exp((sigma + 1i*w) .* t), -Inf, Inf, 'ArrayValued', true));
result = x_t(time);

disp(result);

syms t s;
X_S = 1/(s^2 + 1);
X_T = ilaplace(X_S, s, t);
a = subs(X_T, t, time);
disp(double(a));