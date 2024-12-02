clc, clearvars, close all;
function convert_ies_to_csv(ies_filename, output_csv)
    fid = fopen(ies_filename, 'r');
    lines = {};
    tline = fgetl(fid);
    while ischar(tline)
        lines{end+1} = tline;
        tline = fgetl(fid);
    end
    fclose(fid);
    data_lines = lines(36:end);
    data_string = strjoin(data_lines, ' ');
    values = strsplit(data_string);
    vertical_header = values(1:181);
    horizontal_header = values(182:218);
    data_values = values(219:end);
    values_per_line = 181;
    num_lines = floor(length(data_values) / values_per_line);
    split_data = reshape(data_values(1:num_lines*values_per_line), values_per_line, num_lines)';
    fid = fopen(output_csv, 'w');
    fprintf(fid, 'C\\Y,');
    fprintf(fid, '%s,', vertical_header{:});
    fprintf(fid, '\n');
    for i = 1:num_lines
        fprintf(fid, '%s,', horizontal_header{i});
        fprintf(fid, '%s,', split_data{i,:});
        fprintf(fid, '\n');
    end
    fclose(fid);
end

IES_FILE = 'TLP22S2-4L_HIGH_HW3.ies';
CSV_FILE = 'Extra_2_TLP22S2-4L_Luminous_Intensity_Distribution.csv';
convert_ies_to_csv(IES_FILE, CSV_FILE);
fprintf(IES_FILE);
fprintf(" has been converted to ");
fprintf(CSV_FILE);
fprintf("\n")