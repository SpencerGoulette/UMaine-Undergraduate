clear variables;

a = linspace(0,20,1001); % creates matrix for t

b = 3; % N value
c = fourier(b,a); % fourier function

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (탎ec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 3'); % title

b = 5; % N value
c = fourier(b,a); % fourier function

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (탎ec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 5'); % title

b = 10; % N value
c = fourier(b,a); % fourier function

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (탎ec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 10'); % title

b = 20; % N value
c = fourier(b,a); % fourier function

Fig4 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(a, c, 'linewidth', 2.0) % plots x_{N}(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (탎ec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 20'); % title

function f = fourier(n, t)
    l = n; % temporary N
    n = -l; % n = -N
    x = (.2*exp(2.5)-.2)/2.5; % x_{0}(t) value
    while n < l+1 % Sums all x_{N}(t) values
        if n ~= 0
            x = x + (.2*exp(2.5-1i*2*pi*n) - .2).*exp(1i.*2.*pi.*200000.*n.*t.*10^(-6))./(2.5-1i*2*pi*n);
        end
        n = n + 1;
    end
    f = x; % returns x
end