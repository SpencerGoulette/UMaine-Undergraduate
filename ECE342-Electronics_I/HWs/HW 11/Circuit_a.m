col1 = Circuita{1:59, 2};
col2 = Circuita{65:123, 2};
col3 = Circuita{129:187, 2};
col4 = Circuita{1:59, 3};
col5 = Circuita{65:123, 3};
col6 = Circuita{129:187, 3};

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col1, col4, col2, col5, col3, col6);
xlim([0 50])
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
title('Microcap 2N3904 transistor'); % title
xlabel('TEMP [C]', 'fontsize', 16); % x label
ylabel('Collector Current [A]', 'fontsize', 16); % y label
legend('Circuit 1','Circuit 2','Circuit 3');