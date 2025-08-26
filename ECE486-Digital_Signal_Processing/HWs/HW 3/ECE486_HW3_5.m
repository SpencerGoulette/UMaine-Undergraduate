% Author: Spencer Goulette
% ECE 486 - HW #3 Problem 5
% February 12th, 2019

clear variables

%% Problem 5
f = linspace(-0.5,0.5,1001); % Frequency from -0.5 to 0.5
z = exp(1i .* 2 .* pi .* f); % Z
H1 = (1.0000.*z.^(2) + 1.6180.*z.^(1) + 1.0000)./(1.*z.^(2) + -1.5371.*z.^(1) + 0.9025); % Filter 1 H(z)
H2 = (1.0000.*z.^(2) - 0.6180.*z.^(1) + 1.0000)./(1.*z.^(2) - 0.8100); % Filter 2 H(z)

H = (20*log10(abs(H1 .* H2))); % Gain in dB without G
G = 1 / 10^(max(H) / 20) % G to make max gain 1 V/V <--- Answer to Part A
H = H1 .* H2; % Gain in V/V without G
HG = H1 .* H2 .* G; % Gain in V/V with G

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location <--- Answer to Part B
plot(f,H,f,HG); % stem plot
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('frequency, Hz', 'fontsize', 16); % x label
ylabel('Gain, V/V', 'fontsize', 16); % y label
title('Homework 3, problem 5', 'fontsize', 16); % title
legend('Gain without G','Gain with G'); % legend

x = [3 1.5 -1.8 0.2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; % x[n] for the 0<=n<=19
xG = x .* G; % After G stage

a1 = [1.0000 -1.5371 0.9025]; % Coefficients for Filter 1
b1 = [1.0000 1.6180 1.0000];
a2 = [1.0000 0.0000 -0.8100]; % Coefficients for Filter 2
b2 = [1.0000 -0.6180 1.0000];

y1 = filter(a1,b1,xG); % Filter 1
y2 = filter(a2,b2,y1); % Filter 2

x = x'; % Transpose rows to columns and rename
G = xG';
Filter1 = y1';
Filter2 = y2';

T = table(x,G,Filter1,Filter2) % Create table <--- Answer to Part C


