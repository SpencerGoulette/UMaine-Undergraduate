clear variables; % clears existing variables
t = linspace(-10,10,1001); % creates matrix for t
y1 = (5.*cos(5.*t)+3.*sin(5.*t)).*exp(-3.*t);
y2 = (5+15.*t).*exp(-3.*t);
y3 = (25./3).*exp(-2.*t)-(10./3).*exp(-5.*t);

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, y1, 'linewidth', 2.0) % plots sinc
grid on; % add grid
text(-8,1*10^(13),'y(t)=e^{-3t}(5cos(5t)+3sin(5t))'); % adds notation for y1(t)
set(gca, 'fontsize', 16); % increase font size
xlabel('t', 'fontsize', 16); % x label
ylabel('y(t)', 'fontsize', 16); % y label
title('Problem 3, part a'); % title

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, y2, 'linewidth', 2.0) % plots sinc
grid on; % add grid
text(-8,-2*10^(14),'y(t)=e^{-3t}(5+15t)'); % adds notation for y2(t)
set(gca, 'fontsize', 16); % increase font size
xlabel('t', 'fontsize', 16); % x label
ylabel('y(t)', 'fontsize', 16); % y label
title('Problem 3, part b'); % title

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, y3, 'linewidth', 2.0) % plots sinc
grid on; % add grid
text(-8,-2*10^(21),'y(t)=(25/3)e^{-2t}-10/3e^{-5t}'); % adds notation for y3(t)
set(gca, 'fontsize', 16); % increase font size
xlabel('t', 'fontsize', 16); % x label
ylabel('y(t)', 'fontsize', 16); % y label
title('Problem 3, part c'); % title