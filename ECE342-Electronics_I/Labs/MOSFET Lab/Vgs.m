col1 = vgsid11{:, 1};
col2 = vgsid11{:, 2};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col2, col1, 'r');
xlim([0 5])
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Gate Voltage [V]', 'fontsize', 16); % x label
ylabel('Drain Current [A]', 'fontsize', 16); % y label