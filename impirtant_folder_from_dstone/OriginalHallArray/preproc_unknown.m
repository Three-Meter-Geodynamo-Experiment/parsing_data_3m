
if ~(exist('time') & exist('data') & exist('abstime'))
	'No experiment data loaded!'
	daqchoice = questdlg('No data. Choose .daq file now?','Error: No data!','Yes','No','Yes');
	switch daqchoice
		case 'Yes'
			
			[filename pathname filterindex] = uigetfile('*');
			if filename==0
				break
			end
			['Loading ' pathname filename]
			[data time abstime events info] = daqread([pathname filename]);
			
		case 'No'
			break
		
	end
end

if ~(exist('arraybias') & exist('stickbias'))
	'No Biases Loaded! Specify file.'
	[biasfile biaspath filterindex] = uigetfile('*.mat');
	load([biaspath biasfile])
end

dossm;
if ~(time(1)==ssm)
	'Adding start seconds since midnight to time'
	time=time+ssm;
else
	'ssm already added'
end

ddb = data(:,12:42)-ones(length(data),1)*arraybias;
stickdb = data(:,43:44)-ones(length(data),1)*stickbias;

clear daqchoice filename pathname filterindex biasfile biaspath 
