% Author: Spencer Goulette
% ECE 486 - HW #5 Problem 4
% February 26th, 2019

clear variables
%% Part A
% Load data
y = load('homework_x1.mat','-ascii');
z = load('homework_x2.mat','-ascii');

% Create plot points
x = linspace(0,10,10000);
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(x,y); % plot
grid on; % grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time, sec', 'fontsize', 16); % x label
ylabel('Volts', 'fontsize', 16); % y label
title('Homework 5, problem 4 a', 'fontsize', 16); % title

% Answers to variance and std deviation
% Comes out to variance = 9.2135 and std deviation = 3.0354
v = var(y)
s = std(y)


%% Part B
% var(new) = var(original) / M -> M = var(original) / var(new)
% M should be at least 112 for the RMS to be below 0.3 volts
M = 10 / (0.3)^2

%% Part C
% Run first running average with M equal to 10
M = 10;
total = 0;
w = z;

% Running average
for n = 1:10000
   for i = 1:M
       if (n - i) > 0
            total = total + z(n - i);
       end
   end
   w(n) = total / M;
   total = 0;
end

% Calculates the RMS
% Answer Comes out to 1.2823
RMS = sqrt(var(z) / M)

% Plot
Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(x,z,x,w); % plot
grid on; % grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time, sec', 'fontsize', 16); % x label
ylabel('Volts', 'fontsize', 16); % y label
title('Homework 5, problem 4 c', 'fontsize', 16); % title
legend('Original','Averaged with M = 10');

% Run second running average with M equal to 50
M = 50;

% Running average
for n = 1:10000
   for i = 1:M
       if (n - i) > 0
            total = total + z(n - i);
       end
   end
   w(n) = total / M;
   total = 0;
end

% Calculates the RMS
% Answer Comes out to 0.5735
RMS = sqrt(var(z) / M)

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(x,z,x,w); % plot
grid on; %grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time, sec', 'fontsize', 16); % x label
ylabel('Volts', 'fontsize', 16); % y label
title('Homework 5, problem 4 c', 'fontsize', 16); % title
legend('Original','Averaged with M = 50'); % legend

% Run last running average with M equal to 100
M = 100;

% Running average
for n = 1:10000
   for i = 1:M
       if (n - i) > 0
            total = total + z(n - i);
       end
   end
   w(n) = total / M;
   total = 0;
end

% Calculates the RMS
% Answer Comes out to 0.4055
RMS = sqrt(var(z) / M)

Fig4 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(x,z,x,w); % plot
grid on; % grid
set(gca, 'fontsize', 16); % increase font size
xlabel('Time, sec', 'fontsize', 16); % x label
ylabel('Volts', 'fontsize', 16); % y label
title('Homework 5, problem 4 c', 'fontsize', 16); % title
legend('Original','Averaged with M = 100'); % legend
