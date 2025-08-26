Ic1 = vceic11{:, 1};  % Collector Current 1
Ic2 = vceic11{:, 4};  % Collector Current 2
Ic3 = vceic11{:, 7};  % Collector Current 3
Ic4 = vceic11{:, 10};  % Collector Current 4
Ic5 = vceic11{:, 13};  % Collector Current 5
Ic6 = vceic11{:, 16};  % Collector Current 6
Ic7 = vceic11{:, 19};  % Collector Current 7
Ic8 = vceic11{:, 22};  % Collector Current 8
Ic9 = vceic11{:, 25};  % Collector Current 9
Ic10 = vceic11{:, 28};  % Collector Current 10

Vc1 = vceic11{:, 2};  % Collector Voltage 1
Vc2 = vceic11{:, 5};  % Collector Voltage 2
Vc3 = vceic11{:, 8};  % Collector Voltage 3
Vc4 = vceic11{:, 11};  % Collector Voltage 4
Vc5 = vceic11{:, 14};  % Collector Voltage 5
Vc6 = vceic11{:, 17};  % Collector Voltage 6
Vc7 = vceic11{:, 20};  % Collector Voltage 7
Vc8 = vceic11{:, 23};  % Collector Voltage 8
Vc9 = vceic11{:, 26};  % Collector Voltage 9
Vc10 = vceic11{:, 29};  % Collector Voltage 10

% Polyfit lines for the active region
x = vceic11{21:101, 2};
p1 = polyfit(x,vceic11{21:101, 1},1);
p2 = polyfit(x,vceic11{21:101, 4},1);
p3 = polyfit(x,vceic11{21:101, 7},1);
p4 = polyfit(x,vceic11{21:101, 10},1);
p5 = polyfit(x,vceic11{21:101, 13},1);
p6 = polyfit(x,vceic11{21:101, 16},1);
p7 = polyfit(x,vceic11{21:101, 19},1);
p8 = polyfit(x,vceic11{21:101, 22},1);
p9 = polyfit(x,vceic11{21:101, 25},1);
p10 = polyfit(x,vceic11{21:101, 28},1);

Va = (roots(p1) + roots(p2) + roots(p3) + roots(p4) + roots(p5) + roots(p6) + roots(p7) + roots(p8) + roots(p9) + roots(p10))/10

%Polyval lines in the active region
x1 = linspace(-5,100);
f1 = polyval(p1,x1);
f2 = polyval(p2,x1);
f3 = polyval(p3,x1);
f4 = polyval(p4,x1);
f5 = polyval(p5,x1);
f6 = polyval(p6,x1);
f7 = polyval(p7,x1);
f8 = polyval(p8,x1);
f9 = polyval(p9,x1);
f10 = polyval(p10,x1);

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(Vc1, Ic1, Vc2, Ic2, Vc3, Ic3, Vc4, Ic4, Vc5, Ic5, Vc6, Ic6, Vc7, Ic7, Vc8, Ic8, Vc9, Ic9, Vc10, Ic10); % plots
hold on;
plot(x1, f1, x1, f2, x1, f3, x1, f4, x1, f5, x1, f6, x1, f7, x1, f8, x1, f9, x1, f10);
grid on; % add grid
xlim([-5 100]);
set(gca, 'fontsize', 16); % increase font size
xlabel('Collector Voltage, V_{C}', 'fontsize', 16); % x label
ylabel('Collector Current, I_{C}', 'fontsize', 16); % y label
title('PNP BJT V_{C}- I_{C} measurement', 'fontsize', 16); % title
legend('I_{B} = -1uA','I_{B} = -2uA','I_{B} = -3uA','I_{B} = -4uA','I_{B} = -5uA','I_{B} = -6uA','I_{B} = -7uA','I_{B} = -8uA','I_{B} = -9uA','I_{B} = -10uA');