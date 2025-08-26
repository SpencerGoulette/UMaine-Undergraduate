f1 = linspace(-10^4, 10^4, 1001);
f2 = linspace(-5*10^3, 5*10^3, 1001);
s1 = 10.^-3.*(1-f1.^2./10.^8);
s2 = 10.^-3.*(1-f2.^2./10.^8);
print = 10^-3*(1-5000^2/10^8)
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f1, s1, f2, s2);
xlim([-10^4 10^4]);