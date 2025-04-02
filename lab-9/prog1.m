clc; clear; close all;

syms T S b
u = heaviside(T);
d = dirac(T);
r = T * u;
e = exp(-b*T) * u;
s = sin(b*T) * u;

assume(b > 0);
assume(S > 0);

Ld = int(d * exp(-S*T), T, -inf, inf);
Lu = int(u * exp(-S*T), T, -inf, inf);
Lr = int(r * exp(-S*T), T, -inf, inf);
Le = int(e * exp(-S*T), T, -inf, inf);
Ls = int(s * exp(-S*T), T, -inf, inf);

disp('Transforms:');
disp("Dirac: "); disp(Ld);
disp("Step: "); disp(Lu);
disp("Ramp: "); disp(Lr);
disp("Exp: "); disp(Le);
disp("Sin: "); disp(Ls);

t = -2:0.01:5;
b_val = 1;
d_plot = (t == 0);
u_plot = heaviside(t);
r_plot = t .* u_plot;
e_plot = exp(-b_val * t) .* u_plot;
s_plot = sin(b_val * t) .* u_plot;

figure;
subplot(5,1,1); plot(t, u_plot); title('Step');
subplot(5,1,2); stem(t, d_plot); title('Dirac');
subplot(5,1,3); plot(t, r_plot); title('Ramp');
subplot(5,1,4); plot(t, e_plot); title('Exponential');
subplot(5,1,5); plot(t, s_plot); title('Sine');