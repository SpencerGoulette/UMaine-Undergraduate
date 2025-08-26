t = HW14{:, 1};  % Time
s = HW14{:, 2};  % s(t)

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, s); % plot
xlim([-2*10^-3 2*10^-3]);   % limits x axis
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time (sec)', 'fontsize', 16); % x label
ylabel('Spectrum of the Modulated Signal S(f) (V)', 'fontsize', 16); % y label
