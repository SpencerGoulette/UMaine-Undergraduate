f = linspace(-10^4, 10^4, 1001);
h = (1./(((10000.*2.*pi.*f.*3.18.*10.^(-9)).^2 + 1)));

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f, h);
xlim([-10^4 10^4]);