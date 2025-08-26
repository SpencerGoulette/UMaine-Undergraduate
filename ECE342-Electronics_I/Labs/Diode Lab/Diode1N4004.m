col1 = N4004fwd11{:, 1};
col2 = N4004fwd11{:, 2};
col6 = N4004fwd11{:, 6};
col6 = log(col6);

col3 = circuit1{1:1001, 4};
col4 = circuit1{1007:2007, 4};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogy(col2, col1, 'b', col2, col5, 'r');
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Bias Voltage [V]', 'fontsize', 16); % x label
ylabel('Bias Current [I]', 'fontsize', 16); % y label

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col2, 100.*(col5 - col1)./col1);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Bias Voltage [V]', 'fontsize', 16); % x label
ylabel('Relative error in fit current [%]', 'fontsize', 16); % y label
