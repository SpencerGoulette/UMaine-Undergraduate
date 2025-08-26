in = a1{1:90, 2};  % Vin
out = a1{1:90, 3};  % Vout

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(in, out); % plot
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('V_{BE} (V)', 'fontsize', 16); % x label
ylabel('V_{OUT} (V)', 'fontsize', 16); % y label
title('V_{OUT} vs. V_{BE}'); % title

f = b{1:1001, 2};  % Vin
gain = b{1:1001, 4};  % Vout

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogx(f, gain); % plot
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Frequency (Hz)', 'fontsize', 16); % x label
ylabel('A_{v} (dB)', 'fontsize', 16); % y label
title('A_{v} vs. Frequency'); % title
