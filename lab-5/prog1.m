clc;
close all;

% Linear convolution

input("Press enter to start with Linear convolution");
x = [2 3 5 6];
h = [1 4 5 2];
len = length(x) + length(h);
y = zeros(1, len);

for i = -len : len

    out = 0;

    for k = -len : len
        x_t = 0;
        h_t = 0;

        if k <= length(x) && k > 0
            x_t = x(k);
        end
        if i-k <= length(h) && i-k > 0
            h_t = h(i-k);
        end

        out = out + h_t * x_t;
    end

    y(len + i + 1) = out;
    
end

y
conv(x, h)

figure;

subplot(3,1,1);
stem(1:length(x), x);
title("X");
xlabel("Sample number");
ylabel("Amplitude");

subplot(3,1,2);
stem(1:length(h), h);
title("H");
xlabel("Sample number");
ylabel("Amplitude");

subplot(3,1,3);
stem(-len:len, y);
title("Convoluted result");
xlabel("Sample number");
ylabel("Amplitude");

return;