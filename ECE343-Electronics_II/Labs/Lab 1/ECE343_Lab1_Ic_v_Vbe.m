ic = -1 .* vbeic11{:, 1};  % Collector Current
vbe = vbeic11{:, 3};  % Base to Emitter Voltage

ic2 = -1 .* vbeic11{1:81, 1};  % Collector Current for Polyfit
vbe2 = vbeic11{1:81, 3};  % Base to Emitter Voltage for Polyfit

p = polyfit(vbe2, log(ic2), 1);
Isc = exp(p(2))
f = polyval(p,vbe);


Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogy(vbe, ic); % plots
hold on;
semilogy(vbe, exp(f));
hold off;
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Base Voltage, V_{BE}', 'fontsize', 16); % x label
ylabel('Collector Current, I_{C}', 'fontsize', 16); % y label
title('PNP BJT V_{BE}- I_{C} measurement', 'fontsize', 16); % title
legend('Experimental','Fit Line');