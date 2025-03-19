clc;
clear all;
close all;

t = 0:0.1:10;
h = sin(4*t);
h_new = awgn(h,2);

omega = linspace(0, 10, 1000);
res = zeros(1, length(omega));

for b = 1:length(omega)
    out = 0;
    for a = 1:length(h)
        out = out + h(a)*exp(-1i * omega(b) * t(a));
    end
    res(b) = out;
end

figure;
subplot(4,1,1);
stem(1:length(h), h);
title("H");
xlabel("Sample number");
ylabel("Amplitude");

subplot(4,1,2);
stem(1:length(h_new), h_new);
title("H with noise");
xlabel("Sample number");
ylabel("Amplitude");

subplot(4,1,3);
plot(omega, abs(res));
xlabel('Frequency (\omega)');
ylabel('|H(\omega)|');
title('Fourier Transform Magnitude Spectrum for H');
grid on;

for b = 1:length(omega)
    out = 0;
    for a = 1:length(h_new)
        out = out + h_new(a)*exp(-1i * omega(b) * t(a));
    end
    res(b) = out;
end

subplot(4,1,4);
plot(omega, abs(res));
xlabel('Frequency (\omega)');
ylabel('|H(\omega)|');
title('Fourier Transform Magnitude Spectrum for H with noise');
grid on;