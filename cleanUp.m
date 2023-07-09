function output = cleanUp(data_folder)
%CLEAN_UP Summary of this function goes here
%   Remove empty rows from excel table
%   Remove file name extension from cleaned up file 
%   for cleaner files
arguments
    data_folder = 'Participant_Data_test/';
end

original_files=dir([data_folder '/*']);
for k=4:length(original_files)
    filename=[data_folder '/' original_files(k).name];
    T = readtable(strcat(filename));
    T_clean = T(1:7, :)
    %fullfilename = fullfile('/Users/meg/Dropbox/MSC_LIVE/', filename)
    fullfilename = fullfile(filename)
    [path, file, extension]=fileparts(fullfilename)
    table_path_format = fullfile(path, strcat(file, '_CLEAN.xlsx'))
    writetable(T, table_path_format)
end


end