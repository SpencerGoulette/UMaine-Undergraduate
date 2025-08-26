% Author: Spencer Goulette
% ECE 486 - HW #8 Problem 1
% April 4th, 2019

%% Problem 1

N = 8 * 1024; % Samples
M = 150; % # of Coefficients
beta = 8; % Beta for Kaiser Window

figure(1);

% Specifications
patch([0.11 0.5 0.5 0.11],[-100 -100 -80 -80],0.9*[1 1 1]);
hold on;
patch([0 0.07 0.07 0],[-0.1 -0.1 0.1 0.1],0.9*[1 1 1]);
axis([0 0.5 -100 20]);
xlabel('Frequency (cycles/sample)');
ylabel('Filter gain (dB)');

% Frequency
f = (0:N-1)/N;
f(N/2 + 1 + 1:end) = f(N/2 + 1 + 1:end) - 1;

% Gain
Hd = (abs(f) >= 0 & abs(f) < 0.085).*10.^(0.004);
Hd = Hd .* exp(-1j.*2.*pi.*f.*(M - 1)./2);
figure(1)
%plot(f,20.*log10(abs(Hd)),'b.');

% impulse response
hd = ifft(Hd);
figure(2);
stem(0:N-1, hd, '.');
hold on;

% Window
win = kaiser(M,beta)';

% Impulse response with window
h = hd(1:M).*win;
stem(0:M - 1,h,'r.');

% Gain from window
H = fft(h,N);

figure(1);
% Plot gain
plot(f,20.*log10(abs(H)));

%% Problem 2

% Part a and b
n = linspace(0,511,512); % 512 samples
x = 3.7.*cos(2.*pi.*0.3308.*n); % x[n]
X1 = 20.*log10(fft(x,32768)); % X1[f1], 32,768-point FFT
X2 = 20.*log10(fft(x,512)); % X2[f2], 512-point FFT
f1 = linspace(0,1,32768); % f1
f2 = linspace(0,1,512); % f2

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f1,X1,f2,X2,'-o'); % plot
grid on; % grid
xlim([0.3 0.35]); % limit x axis
set(gca, 'fontsize', 16); % increase font size
xlabel('f', 'fontsize', 16); % x label
ylabel('X[f]', 'fontsize', 16); % y label
title('Homework 7, problem 3 a and b', 'fontsize', 16); % title
legend('32,768-point FFT','512-point FFT');
% Peak is 20log(512 * A / 2);
% Where A is the amplitude of the cosine which is 3.7.
% So the peak should be at 947.2 or 59.53dB, which Matlab shows the plot of
% it to be at 59.53dB

% Part c
w = kaiser(512,8.0); % window

% xw[n] = x[n]w[n] 
for i = 1:512
   x2(i) = x(i) * w(i); 
end

% X1[f]
% X2[f]
X1 = 20.*log10(fft(x2,32768));
X2 = 20.*log10(fft(x2,512));

Fig4 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f1,X1,f2,X2,'-o'); % plot
grid on; % grid
xlim([0.3 0.35]); % limit x axis
set(gca, 'fontsize', 16); % increase font size
xlabel('f', 'fontsize', 16); % x label
ylabel('X[f]', 'fontsize', 16); % y label
title('Homework 7, problem 3 c', 'fontsize', 16); % title
legend('32,768-point FFT','512-point FFT'); % legend

% Peak is 20log(512 * A / (2 * 2.3));
% Where A is the amplitude of the cosine which is 3.7.
% So the peak should be at 412 or 52.3dB, which Matlab shows the plot of
% it to be at 52.3dB

% load data
data = hw7data{1,2:513};

% FFT transform of data
x = 20.*log10(fft(data,32768));
f = linspace(0,50000,32768);

Fig5 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,x); % plot
grid on; % grid
set(gca, 'fontsize', 16); % increase font size
xlabel('f', 'fontsize', 16); % x label
ylabel('X[f]', 'fontsize', 16); % y label
title('Homework 7, problem 4', 'fontsize', 16); % title
legend('32,768-point FFT'); % legend


