col1 = circuit1{1:1001 , 1};
col2 = circuit1{1007:2007, 1};
col3 = circuit1{1:1001, 4};
col4 = circuit1{1007:2007, 4};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogx(col1, col3);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('f (Hz)', 'fontsize', 16); % x label
ylabel('Gain (dB)', 'fontsize', 16); % y label

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogx(col2, col4);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('f (Hz)', 'fontsize', 16); % x label
ylabel('Phase (Degrees)', 'fontsize', 16); % y label