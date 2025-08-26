t = ECE314HW61d{:, 1};
s = ECE314HW61d{:, 2};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, s);
xlim([-2*10^-3 2*10^-3]);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time (sec)', 'fontsize', 16); % x label
ylabel('Spectrum of the Modulated Signal S(f) (V)', 'fontsize', 16); % y label
