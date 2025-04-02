clc; clear; close all;

syms T S b
Fd = 1;
Fu = 1/S;
Fr = 1/S^2;
Fe = 1/(S + b);
Fs = b/(S^2 + b^2);

assume(b > 0);
assume(S > 0);

fd = ilaplace(Fd, S, T);
fu = ilaplace(Fu, S, T);
fr = ilaplace(Fr, S, T);
fe = ilaplace(Fe, S, T);
fs = ilaplace(Fs, S, T);

disp('Inverse Transforms:');
disp("Dirac: "); disp(fd);
disp("Step: "); disp(fu);
disp("Ramp: "); disp(fr);
disp("Exp: "); disp(fe);
disp("Sin: "); disp(fs);

t = -2:0.01:5;
b_val = 1;
fd_plot = (t == 0);
fu_plot = heaviside(t);
fr_plot = t .* fu_plot;
fe_plot = exp(-b_val * t) .* fu_plot;
fs_plot = sin(b_val * t) .* fu_plot;

figure;
subplot(5,1,1); plot(t, fu_plot); title('Step');
subplot(5,1,2); stem(t, fd_plot); title('Dirac');
subplot(5,1,3); plot(t, fr_plot); title('Ramp');
subplot(5,1,4); plot(t, fe_plot); title('Exponential');
subplot(5,1,5); plot(t, fs_plot); title('Sine');