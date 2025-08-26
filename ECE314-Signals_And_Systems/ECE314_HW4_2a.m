clear variables 

k = 10;
e = 0.1;
w = 2*pi*10^6;
s = linspace(0, 200000*20, 20);
H = 20*log10(k./((s.*1i).^2./w^2+2.*e.*s.*1i./w+1)); % dB gain
stem(H) % Stem plot of the dB magnitudes of the first 20 harmonics
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Harmonics', 'fontsize', 16); % x label
ylabel('H(s) (dB)', 'fontsize', 16); % y label
title('Problem 2, part a'); % title