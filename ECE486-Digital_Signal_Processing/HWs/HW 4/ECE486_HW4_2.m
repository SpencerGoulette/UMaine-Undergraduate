% Author: Spencer Goulette
% ECE 486 - HW #4 Problem 1
% February 18th, 2019

clear variables

%% Problem 2

% Load the image, and convert to doubles for processing.
Fig1 = figure('Position', [200, 75, 850, 600]); % set figure size and location <--- Answer to Part B
p1 = double(imread('Cavvy_bw.jpg'));
p2 = p1;
p3 = p1;
% Display the image in a figure: Pixels range from 0 (dark) to 255 (light)
imshow(p1,[0 255]);
total = 1;
Q = 1.3;
M = 4;
for i = M:1024-M-1
    for j = 1:768
        for k = -M:M
            total = total + 0.47 .* exp(-0.5.*(k./Q).^2) * p1(j,i + k + 1);
        end
        p2(j,i) = total;
        total = 1;
    end
end

Fig2 = figure('Position', [200, 75, 850, 600]); % set figure size and location <--- Answer to Part B
imshow(p2,[0 255]);

total = 1;
Q = 1.3;
M = 4;
for i = M:1024-M-1
    for j = 1:768
        for k = -M:M
            total = total - 0.47 .* (k ./ Q^2) .* exp(-0.5.*(k./Q).^2) * p1(j,i + k + 1);
        end
        p3(j,i) = total;
        total = 1;
    end
end

Fig3 = figure('Position', [200, 75, 850, 600]); % set figure size and location <--- Answer to Part B
imshow(p3,[-20 20]);
