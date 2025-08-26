[x_long,Fs] = audioread('guitar10min.ogg');
x = x_long(55*Fs:65*Fs,1);

g1 = 69;
g2 = 1;
M = 151;
D = (M-1)/2;

total = 0;

y1 = x;
y2 = x;
y3 = x;

for n = 1:length(x)
    for k = 1:M
        if (n - k) > 0 
            total = total + x(n - k);
        end
    end
    y1(n) = total / M;
    total = 0;
    if (n - D) > 0
        y2(n) = x(n - D) - y1(n);
    else
        y2(n) = 0;
    end
    y3(n) = g1 .* y1(n) + g2 .* y2(n);
end
y3 = y3/max(abs(y3)); % (The player saturates for
                   % values outside of +/- 1)
obj1 = audioplayer(y3,Fs);
playblocking(obj1)
obj1 = audioplayer(x,Fs);
playblocking(obj1)