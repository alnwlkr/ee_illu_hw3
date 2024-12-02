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
[px0s, py0s] = polgrid2cart(-1 .* gamma , I_C0, ph);

hold on;
plot(px0, py0, '-b', 'LineWidth', 2, 'DisplayName', 'C0° (Positive Gamma)');
plot(px0s, py0s, '-r', 'LineWidth', 2, 'DisplayName', 'C0° (Negative Gamma)');

title('TLP22S2-4L Polar Curve of Luminous Intensity for C0° (Symmetrical Plotting)');
legend show;
hold off;
