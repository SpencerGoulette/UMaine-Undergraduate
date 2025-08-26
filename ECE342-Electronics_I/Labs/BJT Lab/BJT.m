Vce = SS9018Vce{:, 1};  % Vce
Ic1 = SS9018Vce{:, 2};  % Ib = 1uA
Ic2 = SS9018Vce{:, 3};  % Ib = 2uA
Ic3 = SS9018Vce{:, 4};  % Ib = 3uA
Ic4 = SS9018Vce{:, 5};  % Ib = 4uA
Ic5 = SS9018Vce{:, 6};  % Ib = 5uA
Ic6 = SS9018Vce{:, 7};  % Ib = 6uA
Ic7 = SS9018Vce{:, 8};  % Ib = 7uA
Ic8 = SS9018Vce{:, 9};  % Ib = 8uA
Ic9 = SS9018Vce{:, 10};  % Ib = 9uA
Ic10 = SS9018Vce{:, 11};  % Ib = 10uA

% Polyfit lines for the active region
x = SS9018Vce{11:101, 1};
p1 = polyfit(x,SS9018Vce{11:101, 2},1);
p2 = polyfit(x,SS9018Vce{11:101, 3},1);
p3 = polyfit(x,SS9018Vce{11:101, 4},1);
p4 = polyfit(x,SS9018Vce{11:101, 5},1);
p5 = polyfit(x,SS9018Vce{11:101, 6},1);
p6 = polyfit(x,SS9018Vce{11:101, 7},1);
p7 = polyfit(x,SS9018Vce{11:101, 8},1);
p8 = polyfit(x,SS9018Vce{11:101, 9},1);
p9 = polyfit(x,SS9018Vce{11:101, 10},1);
p10 = polyfit(x,SS9018Vce{11:101, 11},1);

%Polyval lines in the active region
x1 = linspace(-100,5);
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

% Summing up the x intercepts and then finding the average
%Vatotal = fzero(f1,90) + fzero(f2,90) + fzero(f3,90) + fzero(f4,90) + fzero(f5,90) + fzero(f6,90) + fzero(f7,90) + fzero(f8,90) + fzero(f9,90) + fzero(f10,90);
%Va = Vatotal / 10
hfe = (SS9018Vce{11:11, 2}/(1*10^(-6)) + SS9018Vce{11:11, 3}/(2*10^(-6)) + SS9018Vce{11:11, 4}/(3*10^(-6)) + SS9018Vce{11:11, 5}/(4*10^(-6)) + SS9018Vce{11:11, 6}/(5*10^(-6)) + SS9018Vce{11:11, 7}/(6*10^(-6)) + SS9018Vce{11:11, 8}/(7*10^(-6)) + SS9018Vce{11:11, 9}/(8*10^(-6)) + SS9018Vce{11:11, 10}/(9*10^(-6)) + SS9018Vce{11:11, 11}/(10*10^(-6)))/10

% Plot lines
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(Vce, Ic1, Vce, Ic2, Vce, Ic3, Vce, Ic4, Vce, Ic5, Vce, Ic6, Vce, Ic7, Vce, Ic8, Vce, Ic9, Vce, Ic10); % plot Ic vs Vce
hold on
%plot(x1, f1, x1, f2, x1, f3, x1, f4, x1, f5, x1, f6, x1, f7, x1, f8, x1, f9, x1, f10); % plot Fit lines
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
%xlim([-100 5]);
xlabel('V_{CE} (V)', 'fontsize', 16); % x label
ylabel('I_{C} (A)', 'fontsize', 16); % y label
legend('I_{B} = 1uA','I_{B} = 2uA','I_{B} = 3uA','I_{B} = 4uA','I_{B} = 5uA','I_{B} = 6uA','I_{B} = 7uA','I_{B} = 8uA','I_{B} = 9uA','I_{B} = 10uA');
hold off