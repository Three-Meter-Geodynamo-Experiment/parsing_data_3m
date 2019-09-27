%load binary file - current as of 051012
%needs variables in workspace: fname = binlog/filenamebase (filenamebase.bin, filenamebase_abstime)
%and fs = sampling freq of file to open

%IMPORTANT - signal number must be number of signals plus 1 (for time)
signal_number = 49;

fnamebin = [fname '.bin'];
fnameabs = [fname '_abstime'];
abstime = load(fnameabs);
dossm
fid = fopen(fnamebin)
tdata = fread(fid,'float32');
leng = signal_number*30*fs
nchunk = length(tdata)/leng;
nchunk = floor(nchunk);
data =[]
for j = 1:nchunk
dj = reshape(tdata((j-1)*leng+1:j*leng,:),fs*30,signal_number);
data = [data;dj];
end
time = data(:,1)+ssm;
data = data(:,2:end);
fclose(fid);
