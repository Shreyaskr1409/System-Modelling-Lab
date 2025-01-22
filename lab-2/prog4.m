clc;
close all;
clear all;

a = input("Enter amplitude: ");
f = input("Enter frequency: ");
p_diff = input("Enter phase difference in radians: ");
t = 0:0.001:1;

sin_wave = a*sin(2*pi*f*t + p_diff);
cos_wave = a*cos(2*pi*f*t + p_diff);
sqr_wave = a*square(2*pi*f*t + p_diff);
trn_wave = a*sawtooth(2*pi*f*t + p_diff, 1/2);

figure;

subplot(4,1,1);
plot(t, sin_wave, 'r');

subplot(4,1,2);
plot(t, cos_wave, 'r');

subplot(4,1,3);
plot(t, sqr_wave, 'r');

subplot(4,1,4);
plot(t, trn_wave, 'r');

% amplitude scale
scl = input("Amplitude scaling: ");

sin_wave_n = a*scl*sin(2*pi*f*t + p_diff);
cos_wave_n = a*scl*cos(2*pi*f*t + p_diff);
sqr_wave_n = a*scl*square(2*pi*f*t + p_diff);
trn_wave_n = a*scl*sawtooth(2*pi*f*t + p_diff, 1/2);

subplot(4,1,1);
plot(t, sin_wave_n, t, sin_wave);

subplot(4,1,2);
plot(t, cos_wave_n, t, cos_wave);

subplot(4,1,3);
plot(t, sqr_wave_n, t, sqr_wave);

subplot(4,1,4);
plot(t, trn_wave_n, t, trn_wave);

return;