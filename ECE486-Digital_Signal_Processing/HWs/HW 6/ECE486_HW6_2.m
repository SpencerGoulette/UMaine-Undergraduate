% Author: Spencer Goulette
% ECE 486 - HW #6 Problem 2
% March 13th, 2019

clear variables
%% Part C

% Constants
bo = 1.1450039;
a1 = (bo - 10^(-.2/20))/10^(-.2/20);

% Gains
f = linspace(-0.5,0.5,1001);
hiir = 20.*log10(abs(bo .* exp(1j .* 2 .* pi .* f) ./ (exp(1j .* 2 .* pi .* f) + a1)));
hi = 20.*log10(abs(pi.*f./sin(pi.*f)));

% Difference of Gains in dB
diff = hiir - hi;

% +- .2dB
upper = 0.2.*f./f;
lower = -0.2.*f./f;

% Plot gain difference
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,diff); % plot
hold on;
plot(f,upper,'m--');
plot(f,lower,'m--');
grid on; % grid
axis([-0.5 0.5 -.4 .4]);
set(gca, 'fontsize', 16); % increase font size
xlabel('f, cycles/sample', 'fontsize', 16); % x label
ylabel('dB', 'fontsize', 16); % y label
title('Homework 6, problem 2 c', 'fontsize', 16); % title
legend('H_{IIR}(f)-H_{I}(f)','+- .2dB');

% Z for unit circle
N = 1024;
w = 2*pi*[0:N-1]/N;
z = exp(j*w);
minz = -50; 
maxz = 50;

% Poles for the IIR filter
iir_poles = [-1*(bo - 10^(-.2/20))/10^(-.2/20)];

iir_zeros = [];

% plot pole zero diagram
Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
clf;
plot(z); % plots unit circle
hold on
plot(real(iir_poles), imag(iir_poles), 'x'); % plots poles on the unit circle
plot(real(iir_zeros), imag(iir_zeros), 'o'); % plots zeros on the unit circle
axis square
axis([-1.5 1.5 -1.5 1.5]);
grid
xlabel('Re(z)');
ylabel('Im(z)');
title('Unit circle with poles and zeros');

%% Part D

% FIR equation
hfir = 20.*log10(abs((9./8 - 1./8.*cos(2.*pi.*f)).*exp(-1i.*2.*pi.*f)));

% Plot all gains
Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,hi); % plot
hold on;
plot(f,hiir);
plot(f,hfir);
grid on; % grid
axis([-0.5 0.5 0 5]);
set(gca, 'fontsize', 16); % increase font size
xlabel('f, cycles/sample', 'fontsize', 16); % x label
ylabel('dB', 'fontsize', 16); % y label
title('Homework 6, problem 2 d', 'fontsize', 16); % title
legend('H_{I}(f)','H_{IIR}(f)','H_{FIR}(f)');
