clc; clearvars; close all;

T = readtable("Extra_1_Q4_Luminous_Intensity_Distribution.xlsx", VariableNamingRule="preserve");

I_C0 = T{:, 'C0'}';    
I_C15 = T{:, 'C15'}';
I_C30 = T{:, 'C30'}';
I_C45 = T{:, 'C45'}';
I_C90 = T{:, 'C90'}';

gamma = 0:2.5:90;

figure(1);
ph = makePolarGrid(...
    'ADir', 'ccw',...
    'AZeroPos', 'bottom',...
    'RLim',[0,3000],...
    'RTicks', 0:500:3000,...
    'RLabelFormat', '%.0f',...
    'RLabelAngle', 90,...
    'RUnits', '[cd]');

[px0, py0] = polgrid2cart(gamma, I_C0, ph);
[px15, py15] = polgrid2cart(gamma, I_C15, ph);
[px30, py30] = polgrid2cart(gamma, I_C30, ph);
[px45, py45] = polgrid2cart(gamma, I_C45, ph);
[px90, py90] = polgrid2cart(gamma, I_C90, ph);

hold on;
plot(px0, py0, '-b', 'LineWidth', 2, 'DisplayName', 'C0°');
plot(px15, py15, '-r', 'LineWidth', 2, 'DisplayName', 'C15°');
plot(px30, py30, '-y', 'LineWidth', 2, 'DisplayName', 'C30°');
plot(px45, py45, '-g', 'LineWidth', 2, 'DisplayName', 'C45°');
plot(px90, py90, '-k', 'LineWidth', 2, 'DisplayName', 'C90°');

title('Extra 1 Q4 Polar Curve of Luminous Intensity for C0°, C15°, C30°, C45°, C90°');
legend show;
hold off;
