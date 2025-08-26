clear variables;

a = linspace(0,20,1001); % creates matrix for t

b = 200; % N value
c = fourier(b,a); % fourier function

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (µsec)', 'fontsize', 16); % x label
ylabel('y_{N}(t)', 'fontsize', 16); % y label
title('Problem 2, part b, N = 200'); % title

function f = fourier(n, t)
    w = 2*pi*10^(6); % Wn
    e = 0.1; % E
    k = 10; % k
    l = n; % temporary N
    n = -l; % n = -N
    y = k*(.2*exp(2.5)-.2)/2.5; % x_{0}(t) value
    while n < l+1 % Sums all y_{N}(t) values
        s = 2*pi*200000*n*1i;
        if n ~= 0
             y = y + (k/((s)^2/w^2+2*e*s/w+1)).*(.2*exp(2.5-1i*2*pi*n) - .2).*exp(1i.*2.*pi.*200000.*n.*t.*10^(-6))./(2.5-1i*2*pi*n);
        end
        n = n + 1;
    end
    f = y; % returns x
end