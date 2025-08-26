clear variables

% Part a
a = [1 -1.3 0.72 0.081 -0.3645];
b = [2.0 2.8 1.6 -0.4 -1.2];
n = linspace(0,50,51);
h = impz(b,a,51);

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
stem(n,h);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('n', 'fontsize', 16); % x label
ylabel('h[n]', 'fontsize', 16); % y label
title('Homework 2, problem 2a', 'fontsize', 16); % title

% Part b
t = linspace(0,75,76);
n = linspace(0,30,31);
x = (n - 15).^2;
x(numel(t)) = 0;
y1 = filter(b,a,x);

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t,y1);
xlim([0 75]);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('n', 'fontsize', 16); % x label
ylabel('h[n]', 'fontsize', 16); % y label
title('Homework 2, problem 2b', 'fontsize', 16); % title

% Part c
t = linspace(0,125,126);
y2 = conv(h,x);

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t,y2);
xlim([0 75]);
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('n', 'fontsize', 16); % x label
ylabel('h[n]', 'fontsize', 16); % y label
title('Homework 2, problem 2c', 'fontsize', 16); % title

% Part d
total = 0;
for i = 1:75
    total = total + abs(y1(i) - y2(i));
end
if total == 0
    S = 'Part b and c are the same';
    disp(s)
end
total
    