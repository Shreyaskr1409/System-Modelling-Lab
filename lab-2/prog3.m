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

f1 = figure;

subplot(4,1,1);
plot(t, sin_wave, 'r');

subplot(4,1,2);
plot(t, cos_wave, 'r');

subplot(4,1,3);
plot(t, sqr_wave, 'r');

subplot(4,1,4);
plot(t, trn_wave, 'r');

% reverse
inp = input("Enter any word to see the reverse of the waves");
scl = -1;

sin_wave_n = a*sin(2*pi*f*t*scl + p_diff);
cos_wave_n = a*cos(2*pi*f*t*scl + p_diff);
sqr_wave_n = a*square(2*pi*f*t*scl + p_diff);
trn_wave_n = a*sawtooth(2*pi*f*t*scl + p_diff, 1/2);

subplot(4,1,1);
plot(t, sin_wave_n, t, sin_wave);

subplot(4,1,2);
plot(t, cos_wave_n, t, cos_wave);

subplot(4,1,3);
plot(t, sqr_wave_n, t, sqr_wave);

subplot(4,1,4);
plot(t, trn_wave_n, t, trn_wave);

return;