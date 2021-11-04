function [time_12, data_p12, data_m12, data12] = data_chunk_tpmd(data,time,t1,t2,bias,day)
% data_chunk_tpmd gets DATA variable and crops it into parts, input: 
%   time_12 - time, data_p12 - pressure probes, data_m12 - mag probes,
%   data12 - all data
if str2num(day(5:6)) > 20
    channels = [7:41];
else
    channels = [12:44];
end

i1 = find(time > t1, 1, 'first');
i2 = find(time > t2, 1, 'first');

time_12 = time(i1:i2);
data_p12= data(i1:i2,[1,2,3,5]);   % pressure data
data12  = data(i1:i2,:);           % raw data
data_m12= data(i1:i2,channels)-bias;  % magnetic debiassed data

end

