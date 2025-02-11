clc;
clear all;
close all;

figure;

sf = input("Enter sampling frequency:");
st = 1/sf;

t_max = input("SINE\nEnter time till which wave will be present (in s):");
f = input("Enter frequency:");
a = input("Amplitude:");
t = 0:st:t_max;
y = a*sin(2*pi*f*t);

scl_factor = input("Enter the scaling factor:");
shift = input("Enter time shift (in s):");
y_final = a*sin(2*pi*f*t*scl_factor) + shift;

subplot(4,2,1);
stem(t, y);

subplot(4,2,2);
stem(t, y_final);

t_max = input("COSINE\nEnter time till which wave will be present (in s):");
f = input("Enter frequency:");
a = input("Amplitude:");
t = 0:st:t_max;
y = a*cos(2*pi*f*t);

scl_factor = input("Enter the scaling factor:");
shift = input("Enter time shift (in s):");
y_final = a*cos(2*pi*f*t*scl_factor) + shift;

subplot(4,2,3);
stem(t, y);

subplot(4,2,4);
stem(t, y_final);

t_max = input("STEP\nEnter time till which wave will be present (in s):");
step_time = input("Enter step time: (in ms)");
a = input("Amplitude:");
t = 0:st:t_max;
y = zeros(length(t));

for i = 1:length(t)
    if t(i) > step_time/1000
        y(i) = a;
    end
end

scl_factor = input("Enter the scaling factor:");
shift = input("Enter time shift (in s):");
y_final = zeros(length(t));

for i = 1:length(t)
    if t(i)*scl_factor+shift > step_time/1000
        y_final(i) = a;
    end
end

subplot(4,2,5);
stem(t, y);

subplot(4,2,6);
stem(t, y_final);

t_max = input("RAMP\nEnter time till which wave will be present (in s):");
step_time = input("Enter step time (in ms):");
m = input("Enter slope:");
a = 1;
t = 0:st:t_max;
y = zeros(length(t));

for i = 1:length(t)
    if t(i) > step_time/1000
        y(i) = a * (m * (t(i) - step_time/1000));
    end
end

scl_factor = input("Enter the scaling factor:");
shift = input("Enter time shift (in s):");
y_final = zeros(length(t));

for i = 1:length(t)
    if t(i)*scl_factor+shift > step_time/1000
        y_final(i) = a * (m * (t(i)*scl_factor+shift - step_time/1000));
    end
end

subplot(4,2,7);
stem(t, y);

subplot(4,2,8);
stem(t, y_final);

return;