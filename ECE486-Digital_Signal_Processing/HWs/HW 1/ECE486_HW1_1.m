% Author: Spencer Goulette
% ECE 486 - HW #1
% January 28, 2018

clear variables;

% Declares two waveforms to be plotted:
% g1(t) = cos(2?(230)t)
% g2(t) = cos(2?(770)t)
%
% Declares two stem waveforms to be plotted
% based off of g1(t) and g2(t)

t = linspace(0,20 * 10^(-3),1001);
f = linspace(0,20 * 10^(-3),21);
g1 = cos(2 * pi * (230 * t));
g2 = cos(2 * pi * (770 * t));
h1 = cos(2 * pi * (230 * f));
h2 = cos(2 * pi * (770 * f));

% Plots the waveforms and the stems
% The x-axis goes from 0ms to 20ms
% The y-axis goes from -1 to 1

Fig1 = figure('Position', [200, 75, 850, 600]);
plot(t,g1,t,g2);
hold on;
stem(f,h1);
stem(f,h2);
hold off;
grid on;
axis ([0 20 * 10^(-3) -1 1])
set(gca, 'fontsize', 16);
xlabel('time (sec)', 'fontsize', 16);
title('HW 1, Problem 1');
legend('Cosine wave with frequency of 230 Hz','Cosine wave with frequency of 770 Hz','Sampling of 230 Hz','Sampling of 770 Hz');
