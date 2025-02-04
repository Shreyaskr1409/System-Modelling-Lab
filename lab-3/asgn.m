clc;
close all;
clear all;

figure;

% Ramp
m = input("RAMP\nEnter slope: ");
t = input("Enter time till wave will be present (in s): ");
shift = input("Enter time shift (in s): ");
scale = input("Enter time scaling factor: ");

x = 0:0.01:t;
y = m * x;

% Time scaling and shifting
y_scaled = m * x * scale + shift;

subplot(5,2,1);
plot(x, y, 'r');
title('Original Ramp');
grid on;

subplot(5,2,2);
plot(x, y_scaled, 'b');
title('Time-Scaled and Time-Shifted Ramp');
grid on;

% Exponential
t = input("EXPONENTIAL\nEnter time till wave will be present (in s): ");
shift = input("Enter time shift (in s): ");
scale = input("Enter time scaling factor: ");

x = 0:0.01:t;
y = exp(x);

% Time scaling and shifting
y_scaled = exp(x * scale + shift);

subplot(5,2,3);
plot(x, y, 'r');
title('Original Exponential');
grid on;

subplot(5,2,4);
plot(x, y_scaled, 'b');
title('Time-Scaled and Time-Shifted Exponential');
grid on;

% Pulse
t = input("PULSE\nEnter time till wave will be present (in s): ");
a = input("Amplitude: ");
u = input("Up time (in ms): ");
d = input("Down time (in ms): ");
shift = input("Enter time shift (in s): ");
scale = input("Enter time scaling factor: ");

x = 0:0.001:t;
y = zeros(1, length(x));
for i = 1:length(x)
    if rem(x(i), (u + d) / 1000) < u / 1000
        y(i) = a;
    end
end

% Time scaling and shifting
y_scaled = zeros(1, length(x));
for i = 1:length(x)
    if rem(x(i) * scale + shift, (u + d) / 1000) < u / 1000
        y_scaled(i) = a;
    end
end

subplot(5,2,5);
plot(x, y, 'r');
title('Original Pulse');
grid on;

subplot(5,2,6);
plot(x, y_scaled, 'b');
title('Time-Scaled and Time-Shifted Pulse');
grid on;

% Step
t = input("STEP\nEnter time till wave will be present (in s): ");
a = input("Amplitude: ");
u = input("Step time (in ms): ");
shift = input("Enter time shift (in s): ");
scale = input("Enter time scaling factor: ");

x = 0:0.001:t;
y = zeros(1, length(x));
for i = 1:length(x)
    if x(i) >= u / 1000
        y(i) = a;
    end
end

% Time scaling and shifting
y_scaled = zeros(1, length(x));
for i = 1:length(x)
    if x(i) * scale + shift >= u / 1000
        y_scaled(i) = a;
    end
end

subplot(5,2,7);
plot(x, y, 'r');
title('Original Step');
grid on;

subplot(5,2,8);
plot(x, y_scaled, 'b');
title('Time-Scaled and Time-Shifted Step');
grid on;

% Impulse
t = input("IMPULSE\nEnter time till wave will be present (in s): ");
a = input("Amplitude: ");
u = input("Impulse time (in ms): ");
shift = input("Enter time shift (in s): ");
scale = input("Enter time scaling factor: ");

x = 0:0.001:t;
y = zeros(1, length(x));
for i = 1:length(x)
    if x(i) == u / 1000
        y(i) = a;
    end
end

% Time scaling and shifting
y_scaled = zeros(1, length(x));
for i = 1:length(x)
    if abs(x(i) * scale + shift - u / 1000) < 1e-6
        y_scaled(i) = a;
    end
end

subplot(5,2,9);
plot(x, y, 'r');
title('Original Impulse');
grid on;

subplot(5,2,10);
plot(x, y_scaled, 'b');
title('Time-Scaled and Time-Shifted Impulse');
grid on;

return;