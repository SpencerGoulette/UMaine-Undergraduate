col1 = vdsid11{:, 1};
col2 = vdsid11{:, 2};
col3 = vdsid11{:, 4};
col4 = vdsid11{:, 7};
col5 = vdsid11{:, 10};
col6 = vdsid11{:, 13};
col7 = vdsid11{:, 16};
col8 = vdsid11{:, 19};
col9 = vdsid11{:, 22};
col10 = vdsid11{:, 25};
col11 = vdsid11{:, 28};
col12 = vdsid11{:, 31};
col13 = vdsid11{12:101, 13};
col14 = vdsid11{19:101, 19};
col15 = vdsid11{12:101, 14};
col16 = vdsid11{19:101, 20};

polyfit(col15,col13,1)
polyfit(col16,col14,1)

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(col2, col1, col2, col3, col2, col4, col2, col5, col2, col6, col2, col7, col2, col8, col2, col9, col2, col10, col2, col11, col2, col12);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Drain Voltage [V]', 'fontsize', 16); % x label
ylabel('Drain Current [A]', 'fontsize', 16); % y label
legend('V_{GS} = 0.0V', 'V_{GS} = 0.5V', 'V_{GS} = 1.0V', 'V_{GS} = 1.5V', 'V_{GS} = 2.0V', 'V_{GS} = 2.5V', 'V_{GS} = 3.0V', 'V_{GS} = 3.5V', 'V_{GS} = 4.0V', 'V_{GS} = 4.5V', 'V_{GS} = 5.0V');