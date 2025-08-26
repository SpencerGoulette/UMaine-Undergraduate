% Author: Spencer Goulette
% ECE 486 - HW #7
% March 25th, 2019

%% Part 1
% Part a
N = 7; % 7-points
x1 = [0,1,2,3,4]; % x1[n]
x2 = [-2,-1,0,1,2]; % x2[n]

ifft(fft(x1,N).*fft(x2,N)) % X1[k]X2[k]

% Part b
N = 9; % len(x1) + len(x2) - 1

ifft(fft(x1,N).*fft(x2,N)) % X1[k]X2[k]

% Part c
% All of Part 1

%% Part 2
% Part a
N = 512; % 512-points
n = linspace(0,N - 1,N); % 512 points from 0 to 511/512

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(n,kaiser(N,0),n,kaiser(N,2),n,kaiser(N,4),n,kaiser(N,6),n,kaiser(N,8),n,kaiser(N,10)); % plot
grid on; % grid
axis([0 511 0 1]); % axis limit
set(gca, 'fontsize', 16); % increase font size
xlabel('n', 'fontsize', 16); % x label
ylabel('w[n]', 'fontsize', 16); % y label
title('Homework 7, problem 2 a', 'fontsize', 16); % title
legend('\beta = 0','\beta = 2','\beta = 4','\beta = 6','\beta = 8','\beta = 10'); % legend

% Part b
NFFT = 16000; % 16000-point
f = linspace(0,(NFFT - 1)/NFFT,NFFT); % 16000 points from 0 to 15999/16000

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,20.*log10(fft(kaiser(N,0),NFFT)),f,20.*log10(fft(kaiser(N,2),NFFT)),f,20.*log10(fft(kaiser(N,4),NFFT)),f,20.*log10(fft(kaiser(N,6),NFFT)),f,20.*log10(fft(kaiser(N,8),NFFT)),f,20.*log10(fft(kaiser(N,10),NFFT))); % plot
grid on; % grid
xlim([0 .01]); % just look at f = 0 to 0.01
set(gca, 'fontsize', 16); % increase font size
xlabel('f', 'fontsize', 16); % x label
ylabel('W[f], dB', 'fontsize', 16); % y label
title('Homework 7, problem 2 b', 'fontsize', 16); % title
legend('\beta = 0','\beta = 2','\beta = 4','\beta = 6','\beta = 8','\beta = 10'); % legend

% Part c

% Goes through each B from Part a and sums the w(N) up and then subtracts
% W(0) to see if these points are actually the same
for B = 0:5
    w = kaiser(N,B*2);
    W = fft(w,NFFT);
    W0diff = sum(w) - W(1)
end

% Part d and e
% Increasing Beta widens the mainlobe and decreases the amplitude of the 
% sidelobes (i.e., increases the attenuation).

%% Part 3

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

%% Part 4

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

