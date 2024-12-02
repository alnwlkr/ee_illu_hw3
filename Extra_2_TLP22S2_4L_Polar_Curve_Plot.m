clc; clearvars; close all;

T = readtable("Extra_2_TLP22S2-4L_Luminous_Intensity_Distribution.csv", VariableNamingRule="preserve");

T = rows2vars(T);

newHeaders = T{1, 2:end};
newHeaders = strcat('C', string(newHeaders));

emptyHeaders = cellfun(@isempty, cellstr(newHeaders));
newHeaders(emptyHeaders) = "Unknown";

T.Properties.VariableNames(2:end) = newHeaders;  

T(1, :) = [];

I_C0 = T{:, 'C0'}';    
I_C30 = T{:, 'C30'}';
I_C60 = T{:, 'C60'}';
I_C90 = T{:, 'C90'}';

gamma = 0:1:180;

figure(1);
ph = makePolarGrid(...
    'ADir', 'ccw',...
    'AZeroPos', 'bottom',...
    'RTicks', 0:500:2000,...
    'RLabelFormat', '%.0f',...
    'RLabelAngle', 90,...
    'RUnits', '[cd]');           

[px0, py0] = polgrid2cart(gamma, I_C0, ph);
[px30, py30] = polgrid2cart(gamma, I_C30, ph);
[px60, py60] = polgrid2cart(gamma, I_C60, ph);
[px90, py90] = polgrid2cart(gamma, I_C90, ph);

hold on;
plot(px0, py0, '-b', 'LineWidth', 2, 'DisplayName', 'C0°');
plot(px30, py30, '-r', 'LineWidth', 2, 'DisplayName', 'C30°');
plot(px60, py60, '-y', 'LineWidth', 2, 'DisplayName', 'C60°');
plot(px90, py90, '-g', 'LineWidth', 2, 'DisplayName', 'C90°');

title('TLP22S2-4L Polar Curve of Luminous Intensity for C0°, C30°, C60°, C90°');
legend show;
hold off;
