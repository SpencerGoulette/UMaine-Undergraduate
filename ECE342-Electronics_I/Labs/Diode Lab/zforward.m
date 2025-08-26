col1 = -1000*zreverse11{:, 1};
col2 = -zreverse11{:, 2};

x = linspace(3.16,3.56,1001);
y = 46.3526.*col2 + -135.0831;

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col2, 100.*(y-col1)./col1, 'r');
xlim([3.16 3.56])
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Reverse Bias Voltage V_{z} [V]', 'fontsize', 16); % x label
ylabel('Relative error in fit zener current I_{fit} [%]', 'fontsize', 16); % y label