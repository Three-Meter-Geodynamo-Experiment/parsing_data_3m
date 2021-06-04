% Main analysis routine
%
% BEFORE RUNNING:
% Define dates (e.g. dates={'042514','050914'}
% Define number of runs for each date (e.g. runs=[2 4])

TT0=0;
TT1=0;
disp(['Keeping ' num2str(TT0) ' seconds before each run and ' num2str(TT1) ' seconds after'])

% Should we load all data and calculate quantities?
if ( ~exist('DONOTLOAD') )
	
	% load physical and experimental constants
	load('/home/dstone/matlab/Constants3M.mat');
	
	%=======================================================================
	% data
	%=======================================================================
	
	nDates=numel(dates);
	%nRuns=sum(runs);
	if ~( nDates == numel(runs) )
		error('String of dates not same size as string of runs')
	end
	
	
	ALPHABET='ABCDEFGHIJKLMNOP';
	ExpRun=cell(max(runs),nDates);
	Conditions=zeros(max(runs),nDates);
	for k=1:nDates
		for j=1:runs(k)
			exprun=runinfo([dates{k},ALPHABET(j)]);
			ExpRun{j,k}=exprun;
			Conditions(j,k)=numel(exprun.t0);
		end
	end
	Data=cell(max(runs),nDates)
	
	
	
	for k=1:nDates % loop through all dates
		
		disp('')
		disp(['Loading ' dates{k} ' data...'])
		load(['/data/3m/' dates{k} '/torque.dat']);
		wt = load(['/data/3m/' dates{k} '/wtemp.log']); % if error loading wtemplog due to "open" field, need to manually replace "open" with "-1000"
		if (min(wt(:,1))<3600) % if there's time entries between midnight and 1 am
			wt = wt(1:(find(wt(:,1)<3600,1)-1),:); % only keep time until midnight
		end
		wt=wt(:,[1 2:2:16]); % only keep time, temps, and error codes
		load(['/data/3m/' dates{k} '/magnet.log']);
		load(['/data/3m/' dates{k} '/control.log']);
		
		
		
		
		for j=1:runs(k) % loop through all runs for a given date
			disp(['   Loading run ' num2str(j) ' data...'])
			exprun=ExpRun{j,k};
			[data time abstime events info] = daqread(['/data/3m/' dates{k} '/' exprun.daqFile '.daq']);%,'Channels',[43,44]);
			ssm=time+86400.*rem(datenum(abstime),1);
			% hallStick=data; Obsolete
			
			
			
			
			% There are four options for bias files:
			% 1. One bias file for the entire daq file/run
			% 2. Multiple bias files to be averaged for the entire daq file/run
			% 3. One bias file for each condition in a daq file/run
			% 4. Multiple bias files to be averaged for each condition in a daq file/run
			arraybias=zeros(Conditions(j,k),31);
			stickbias=zeros(Conditions(j,k),2);
			if ~iscell(exprun.biasFile{1})
				temp.arraybias=zeros(numel(exprun.biasFile),31);
				temp.stickbias=zeros(numel(exprun.biasFile),2);
				for i=1:numel(exprun.biasFile)
					dummy=load(strcat('/data/3m/',dates{k},'/',exprun.biasFile{j},'.mat'));
					temp.arraybias(i,:)=dummy.arraybias;
					temp.stickbias(i,:)=dummy.stickbias;
				end
				clear dummy
				dummy.arraybias=mean(temp.arraybias,1);
				dummy.stickbias=mean(temp.stickbias,1);
				for i=1:Conditions(j,k)
					arraybias(i,:)=dummy.arraybias;
					stickbias(i,:)=dummy.stickbias;
				end
				clear temp dummy
			else
				temp.arraybias=zeros(Conditions(j,k),31);
				temp.stickbias=zeros(Conditions(j,k),2);
				for i=1:Conditions(j,k)
					dummy=load(['/data/3m/' dates{k} '/' exprun.biasFile{j}{1} '.mat']);
					temp.arraybias(i,:)=dummy.arraybias;
					temp.stickbias(i,:)=dummy.stickbias;
				end
			end
			arraybias=temp.arraybias;
			stickbias=temp.stickbias;
			clear temp dummy
			
			
			
			
			tt=(min(exprun.t0)-TT0 <= ssm & ssm <= max(exprun.t1)+TT1);
			ttTorque=(min(exprun.t0)-TT0 <= torque(:,1) & torque(:,1) <= max(exprun.t1)+TT1);
			ttWt=(min(exprun.t0)-TT0 <= wt(:,1) & wt(:,1) <= max(exprun.t1)+TT1);
			ttMagnet=(min(exprun.t0)-TT0 <= magnet(:,1) & magnet(:,1) <= max(exprun.t1)+TT1);
			Data
			Data{j,k}=struct('arraybias',arraybias,'stickbias',stickbias,'t',ssm(tt),'data',data(tt,:), ...
				'wt',wt(ttWt,:),'torque',torque(ttTorque,:),'magnet',magnet(ttMagnet,:));
			Data
			
		end % end loop through all runs for a given date
		
		
		disp('Loading finished')
		
		
		clearvars -except C dates runs ExpRun Data ALPHABET TT0 TT1 Conditions
		
	end % end loop through all runs
	
	clear ALPHABET
	
end % finished loading data

%=======================================================================
% Data from Axl's tfpaper, stored in following script:
% DataAxlTFPaper;
%=======================================================================


%=======================================================================
% Calculations
%=======================================================================

TBEGINS=200; % time to ignore at beginning of period
TENDS=20; % time to ignore at end of period

analysisVersion=mfilename;

% Use calc3m to calculate quantities on data stored in Data variable
nConditions=sum(Conditions(:));
DataCalc=cell(1,nConditions);
DataAvg=cell(1,nConditions);
nCalcConditions=0;
for k=1:numel(dates)
	for j=1:runs(k)
		data=Data{j,k};
		exprun=ExpRun{j,k};
		[Calc Avg calc3mVersion]=calc3mV04(data,exprun,C,(TBEGINS+TT0),(TENDS+TT1)); % add TT0/TT1 because it's extra time in each element of Data that shouldn't be averaged
		if ~(calc3mVersion(end-2:end)==analysisVersion(end-2:end)) % check that calc3m version number matches analysis version number
			error('Analysis and Calc3m versions do not match')
		end
		if (k==1)
			runNum=j;
		else
			runNum=sum(runs(1:(k-1)))+j;
		end
		for i=1:Conditions(j,k)
			DataCalc{nCalcConditions+i}=Calc(i);
			DataAvg{nCalcConditions+i}.RO=Avg(i).RO
			DataAvg{nCalcConditions+i}.RM=Avg(i).RM
			DataAvg{nCalcConditions+i}.GC=Avg(i).GC
			DataAvg{nCalcConditions+i}.GCrms=Avg(i).GCrms
			DataAvg{nCalcConditions+i}.Bs=Avg(i).Bs
			DataAvg{nCalcConditions+i}.Bphi=Avg(i).Bphi
			DataAvg{nCalcConditions+i}.B=Avg(i).B
			DataAvg{nCalcConditions+i}.BS0=Avg(i).BS0
			DataAvg{nCalcConditions+i}.Torque=Avg(i).Torque
			DataAvg{nCalcConditions+i}.g=Avg(i).g
			DataAvg{nCalcConditions+i}.GINF=Avg(i).GINF
		end
		clear Calc Avg
		nCalcConditions=nCalcConditions+Conditions(j,k);
	end
end

clear nCalcConditions
