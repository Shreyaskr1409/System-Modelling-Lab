clc;
close all;
clear all;

fs = 1e3;
t = 0:(1/fs):0.5;
f_t = [1 1 1]*sin(2*pi*[100 120 320]'.*t);

l1 = lowpass(f_t,250,fs);
y_l1 = fft(l1);
g_l1 = abs(y_l1)/length(l1);
f = (0:length(l1)-1)*(fs/length(l1));

f1 = figure;
figure(f1);
subplot(3,1,1)
plot(t, f_t)
subplot(3,1,2)
plot(t, l1)
subplot(3,1,3)
plot(f, g_l1)

%%%%%%%%%%%%%%%%%%%%%%%

f2 = figure;
figure(f2);
l2 = highpass(f_t,150,fs);
y_l1 = fft(l2);
g_l1 = abs(y_l1)/length(l2);
f = (0:length(l2)-1)*(fs/length(l2));
subplot(3,1,1)
plot(t, f_t)
subplot(3,1,2)
plot(t, l1)
subplot(3,1,3)
plot(f, g_l1)

%%%%%%%%%%%%%%%%%%%%%%%

f3 = figure;
figure(f3);
l3 = bandpass(f_t,[100 310],fs);
y_l1 = fft(l3);
g_l1 = abs(y_l1)/length(l3);
f = (0:length(l3)-1)*(fs/length(l3));
subplot(3,1,1)
plot(t, f_t)
subplot(3,1,2)
plot(t, l1)
subplot(3,1,3)
plot(f, g_l1)

%%%%%%%%%%%%%%%%%%%%%%

f4 = figure;
figure(f4);
l4 = bandstop(f_t,[40 50],fs);
y_l1 = fft(l4);
g_l1 = abs(y_l1)/length(l4);
f = (0:length(l4)-1)*(fs/length(l4));
subplot(3,1,1)
plot(t, f_t)
subplot(3,1,2)
plot(t, l1)
subplot(3,1,3)
plot(f, g_l1)