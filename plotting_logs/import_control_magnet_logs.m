function [data_control, data_magnet] = import_control_magnet_logs(folder)
% import_control_magnet_logs fast import control.log and magnet.log
%   going to data folder and importing logs
%   Artur Perevalov September 2019
if class(folder) == "double"
    folder = numstr(folder);
elseif class(folder) == "string"
    folder = convertStringsToChars(folder);
elseif class(folder) == "char"
    folder = convertStringsToChars(folder);
else
    error('input is not the right format')
end
way = [way_to_folders() folder];         % change this folder if you have your own storage

% Going to directories
% setting up the name of control.log file with location
filename_control = [way  '/control.log'];
% setting up the name of magnet.log file with location
filename_magnet  = [way  '/magnet.log'];

% if there are logs
if exist(filename_control, 'file') == 2 && exist(filename_magnet, 'file') == 2

% importing data 
data_control = readmatrix(filename_control);
if size(data_control,2) == 1
    1;
end
%% control.log 
% 1-time, 2:3 - Tna, 4-12 oil, 
% IS 13-f_rep, 14-f_req, 15-torque, 16-power, 17-current, 18-status
% OS 19-f_rep, 20-f_req, 21-torque, 22-power, 23-current, 24-status

data_magnet  = readmatrix(filename_magnet);
%% magnet.log
% 1-time, 2-?, 3-magnet data (current)

end

