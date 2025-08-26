% Author: Spencer Goulette
% ECE 486 - HW #9
% April 14th, 2018

% Reads in audio at a samples per second of 44,100, Fs
% Samples are stored in x_long
[x_long,Fs] = audioread('avengers_endgame.ogg');

%% Part 1
Vmax = max(abs(x_long)) % Maximum magnitude of x_long
Vvariance = var(x_long) % Variance of x_long

%% Part 2
for i = 1:5 % n = 4, 8, 12, 16, 20
    delta = 2*Vmax / 2^(i*4)    % Delta 
    NoiseP = delta * delta / 12;    % Noise Power
    SignalP = mean(x_long .* x_long);   % Signal Power
    SNR = 10*log10(SignalP / NoiseP)    % SNR
    Xq = delta * round(x_long / delta); % Quantized samples
    obj1 = audioplayer(Xq,Fs);  % Play Quantized Samples
    playblocking(obj1);
end

%% Part 3
for i = 1:5 % n = 4, 8, 12, 16, 20
    sinSNR = 10*log10(3/2)+20*i*log10(2)    % Sinusoidal SNR
    diff = sinSNR - SNR     % Difference between SNR and sinusoidal SNR
end
