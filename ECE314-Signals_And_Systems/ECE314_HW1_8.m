clear variables; % clears existing variables
x = linspace(-4,4,1001); % creates matrix for x
t = linspace(0,10,1001); % creates matrix for t
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(x, sinc(x), 'linewidth', 2.0) % plots sinc
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
axis([-4 4 -0.3 1.1]) % manually set ranges for x and y axis
xlabel('x', 'fontsize', 16); % x label
ylabel('sinc(x)', 'fontsize', 16); % y label
title('Problem 6, plot 1'); % title

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, 2.*sinc(10^3.*(t.*10^-3-3.*10^-3)), 'b', t, 3.*sinc(1./2.*10^3.*(t.*10^-3-6.*10^-3)), 'r', 'linewidth', 2.0); % plots functions
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
axis([0 10 -2 4]); % manually set ranges for x and y axis
text(3.5,1.5,'x_{1}(t)'); % adds notation for x1(t)
text(7,2,'x_{2}(t)'); % adds notation for x2(t)
xlabel('t (msec)', 'fontsize', 16); % x label
ylabel('pulse value (volts)', 'fontsize', 16); % y label
title('Problem 6, plot 2'); % title