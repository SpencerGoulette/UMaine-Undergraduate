t = linspace(-pi*10^-3, pi*10^-3, 1001);
s = (1+.5.*sin(2.*pi.*10^3.*t)).*cos(2.*pi.*10^6.*t);
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(t,s);
xlim([-2*10^-3 2*10^-3]);

f = linspace(-10^7, 10^7, 1001);
sf = 1./2.*(dirac(f-10^6) + dirac(f+10^6) + 0.5./(1i).*(dirac(f-10^6-10^3) + dirac(f-10^6+10^3) + dirac(f+10^6-10^3) + dirac(f+10^6+10^3)));
idx = sf == Inf; % find Inf
sf(idx) = 1;     % set Inf to finite value
Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(f,sf);
xlim([-2*10^6 2*10^6]);