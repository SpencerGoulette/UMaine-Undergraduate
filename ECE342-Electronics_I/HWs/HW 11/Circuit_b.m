col1 = Circuitb{1:59, 2};
col2 = Circuitb{65:123, 2};
col3 = Circuitb{129:187, 2};
col4 = Circuitb{1:59, 3};
col5 = Circuitb{65:123, 3};
col6 = Circuitb{129:187, 3};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col1, col4, col2, col5, col3, col6);
xlim([0 50])
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
title('Fairchild 2N3904 NPN BJT'); % title
xlabel('TEMP [C]', 'fontsize', 16); % x label
ylabel('Collector Current [A]', 'fontsize', 16); % y label
legend('Circuit 1','Circuit 2','Circuit 3');