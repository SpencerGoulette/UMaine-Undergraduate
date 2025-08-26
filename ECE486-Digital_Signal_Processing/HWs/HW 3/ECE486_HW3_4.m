% Author: Spencer Goulette
% ECE 486 - HW #3 Problem 4
% February 12th, 2019

clear variables

%% Problem 4
f = linspace(-0.5,0.5,1001); % Frequency from -0.5 to 0.5
z = exp(1i .* 2 .* pi .* f); % Z
H1 = (1.0000.*z.^(2) + 1.6180.*z.^(1) + 1.0000)./(1.*z.^(2) + -1.5371.*z.^(1) + 0.9025); % Filter 1 H(z)
H2 = (1.0000.*z.^(2) - 0.6180.*z.^(1) + 1.0000)./(1.*z.^(2) - 0.8100); % Filter 2 H(z)

H1 = (20*log10(abs(H1))); % Filter 1 H(z) in dB
H2 = (20*log10(abs(H2))); % Filter 2 H(z) in dB

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,H1,f,H2); % plot
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('frequency, Hz', 'fontsize', 16); % x label
ylabel('Gain, dB', 'fontsize', 16); % y label
title('Homework 3, problem 4', 'fontsize', 16); % title

