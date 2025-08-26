col1 = 1000*zreverse11{:, 1};
col2 = zreverse11{:, 2};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col2, col1);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Reverse Bias Voltage V_{r} [V]', 'fontsize', 16); % x label
ylabel('Reverse Bias Current I_{r} [mA]', 'fontsize', 16); % y label