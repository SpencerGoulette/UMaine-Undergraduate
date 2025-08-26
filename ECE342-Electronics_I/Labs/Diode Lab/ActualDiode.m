
col3 = N4004fwd11{20:61, 1};
col4 = N4004fwd11{20:61, 2};
col10 = N4004fwd11{:, 1};
col11 = N4004fwd11{:, 2};
col12 = N4004fwd11{:, 6};
col13 = N4004fwd11{81, 1};
col14 = N4004fwd11{101, 1};

polyfit(col4,col3,1)
Is = exp(-21.354)
n = 1/(25.2105*.026)
Rs = .1391/(col14-col13)

x = linspace(0,1,101);
y = Is.*(exp(col11./(.026*n))-1);

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogy(col11,col10,'b',col11,col12,'r',x,y,'g');
xlim([0,1]);
ylim([1e-12,1e2]);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Bias Voltage V_{f} [V]', 'fontsize', 16); % x label
ylabel('Bias Current I_{f} [A]', 'fontsize', 16); % y label
legend('I_{measured}','I_{fit measured}','I_{fit calculated}');

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col11, log(100.*(y - col10)./col10));
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Bias Voltage V_{bias} [V]', 'fontsize', 16); % x label
ylabel('Relative error in fit current I_{fit} [log(%)]', 'fontsize', 16); % y label

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col11, log(100.*(y - col10)./col10));
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Bias Voltage V_{bias} [V]', 'fontsize', 16); % x label
ylabel('Relative error in fit current I_{fit} [log(%)]', 'fontsize', 16); % y label
