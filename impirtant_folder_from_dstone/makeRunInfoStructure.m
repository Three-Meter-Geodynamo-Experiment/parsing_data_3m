% Program to generate structure with all 3 Meter data runs and 
% information about those runs such as file name, start and stop time,
% Rossby number, etc.

load runinfolist

fileNum=size(runinfolist,1);
RunInfo(fileNum)=struct('t0',[],'t1',[],'daqFile','dummy','biasFile','dummy','os',[],'is',[],'Bfield','dummy');

for i = 1:fileNum
	exprun = runinfo(runinfolist(i,:));
	if (isfield(exprun,'Bfield') == 0)
		exprun.Bfield='one coil';
	end
	RunInfo(i)=exprun;
	clear exprun
end

T0=[];
T1=[];
IS=[];
OS=[];
daqFile={};
biasFile={};
ii=0; % count number of biasFiles added
Bfield={};

for i = 1:fileNum
	T0=[T0 (RunInfo(i).t0 - 200)]; % t0 stored in runinfo as 200 seconds after start of condition, fixing here
	T1=[T1 RunInfo(i).t1];
	IS=[IS RunInfo(i).is];
	OS=[OS RunInfo(i).os];
	for j=1:size(RunInfo(i).t0,2)
		ii=ii+1;
		biasFile{ii}=RunInfo(i).biasFile{j};
		daqFile{ii}=RunInfo(i).daqFile;
		Bfield{ii}=RunInfo(i).Bfield;
	end
end


plottorques = 0
if plottorques == 1
	tt = (OS < -3);
	T0=T0(tt);
	T1=T1(tt);
	IS=IS(tt);
	OS=OS(tt);
	biasFile=biasFile(tt);
	daqFile=daqFile(tt);
	Bfield=Bfield(tt);
end
