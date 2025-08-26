% Author: Spencer Goulette
% ECE 486 - HW #4 Problem 1
% February 18th, 2019

clear variables

%% Problem 1
f = linspace(-0.5,0.5,1001); % Frequency from -0.5 to 0.5
z = exp(1i .* 2 .* pi .* f); % Z
r = 0.999;
H = ((1 - 2 * r * cos(2 * pi * .35) + r^2)/(1 - 2 * cos(2 * pi * .12) + 1).*(z.^(2) - 2.*z.*cos(2*pi*.12) + 1)./(z.^(2) - 2.*z.*r.*cos(2*pi*.35) + r^2)); % Filter H(z)

H = 20*log10(abs(H));

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location <--- Answer to Part B
plot(f,H); % stem plot
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('frequency, Hz', 'fontsize', 16); % x label
ylabel('Gain, V/V', 'fontsize', 16); % y label
title('Homework 3, problem 5', 'fontsize', 16); % title
legend('Gain without G','Gain with G'); % legend