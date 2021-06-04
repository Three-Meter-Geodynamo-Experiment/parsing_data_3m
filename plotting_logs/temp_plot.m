function [data] = temp_plot(folder)
%TEMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
if ~exist('folder', 'var')
    warning('No input folder, do not know what to plot')
    return
end
way = ['/data/3m/'  folder];
filename_temps  = [way  '/wtemp.log'];

if exist(filename_temps, 'file') == 2 
    data_wtemp = importdata(filename_temps);
end
chans = 2:17;
% chans = [2,3,5,15];

figure(311)
plot(data_wtemp(:,1),data_wtemp(:,chans))
legend;

end

