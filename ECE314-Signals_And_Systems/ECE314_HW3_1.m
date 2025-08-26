w = 2*pi*10^(6); % Wn
e = 0.1; % E
k = 10; % k
t = linspace(0,5,1001); % creates matrix for t
s = linspace(10*10^3,100*10^6,1001); % creates matrix for s
h = ((k*w)/(1-e)^(1/2)).*exp(-e.*w.*t.*10^(-6)).*sin(w.*(1-e^2).*t.*10^(-6)); % h(t)
H = 20.*log10(k./((s.*1i).^2./w^2+2.*e.*s.*1i./w+1)); % H(s)

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t, h, 'linewidth', 2.0) % plots h(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (µsec)', 'fontsize', 16); % x label
ylabel('h(t)', 'fontsize', 16); % y label
title('Problem 4, part d'); % title

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
semilogx(s, H, 'linewidth', 2.0) % plots sinc
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('s (Hz)', 'fontsize', 16); % x label
ylabel('H(s) (dB)', 'fontsize', 16); % y label
title('Problem 4, part e'); % title
