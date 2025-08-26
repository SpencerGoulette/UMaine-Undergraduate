clear variables;

a = linspace(0,20,1001); % creates matrix for t

b = 2000; % N value
c = fourier(b,a); % fourier function

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (µsec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 3'); % title

function f = fourier(n, t)
    k = 10;
    e = 0.1;
    w = 2*pi*10^6;
    l = n; % temporary N
    n = -l; % n = -N
    x = k*(.2*exp(2.5)-.2)/2.5; % x_{0}(t) value
    while n < l+1 % Sums all x_{N}(t) values
        s = n;
        if n ~= 0
             x = x + (k./abs(((s.*1i).^2./w^2+2.*e.*s.*1i./w+1))).*(.2*exp(2.5-1i*2*pi*200000*n*5*10^(-6)) - .2).*exp(1i.*2.*pi.*200000.*n.*t.*10^(-6))./(2.5-1i*2*pi*n*5*10^(-6)*200000);
        end
        n = n + 1;
    end
    f = x; % returns x
end