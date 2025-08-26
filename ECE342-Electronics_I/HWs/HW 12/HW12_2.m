in = circuit22I{72:580, 2};  % Vin
out = circuit22I{72:580, 3};  % Vout

in_tot = 0;     % Input total
out_tot = 0;    % Output total

in_av = zeros(1,51);    % Input av matrix
out_av = zeros(1,51);   % Output av matrix
for i = 0:10:500
    for j = 1:10
        if i + j < 509
           in_tot = in_tot + in(i + j); % Input total
           out_tot = out_tot + out(i + j); % Output total
        end
    end
    in_av((i/10) + 1) = in_tot / 10;    % Take Input average every 10 points
    out_av((i/10) + 1) = out_tot / 10;  % Take Output average every 10 points
    in_tot = 0;
    out_tot = 0;
end

din = diff(in_av);   % dVin
dout = diff(out_av);   % dVout

a = dout ./ din;   %Av

Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location
plot(in_av(1:(end - 1)), a); % plot s(t)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('V_{GS} (V)', 'fontsize', 16); % x label
ylabel('A_{v} (V/V)', 'fontsize', 16); % y label
title('A_{v} vs. V_{IN} = V_{GS}'); % title
