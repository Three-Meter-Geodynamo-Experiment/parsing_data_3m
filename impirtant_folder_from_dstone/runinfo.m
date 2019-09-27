% Make a function to define experiment start/end times,
% rotation rates, file names, etc.

function [exprun] = runinfo(RUNNAME)

if ( RUNNAME == '042514A' )
	t0=[45200 46000 46800 47600 48400];
	t1=[46000 46800 47600 48400 49200];
	os=[-0.4900 -0.4800 -0.4700 -0.4600 -0.4500];
	is=[8.0 8.0 8.0 8.0 8.0];
	daqFile='042514_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias_2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '042514B' )
	t0=[48400:800:50800];
	t1=[49200:800:51600];
	os=[-0.45 -0.46 -0.47 -0.49];
	is=[8.0 8.0 8.0 8.0];
	daqFile='042514_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias_2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050714A' )
	t0=[52200];
	t1=[63500];
	os=[-1.0];
	is=[-3.15];
	daqFile='050714_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias','bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050814A' )
	t0=[49700];
	t1=[60400];
	os=[-1.5];
	is=[-4.73];
	daqFile='050814_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050914A' )
	%first 50 seconds is applying magnetic field, second 50 is turned off
	t0=[46200:100:47100];
	t1=[46300:100:47200];
	os=zeros(1,10);
	is=zeros(1,10);
	daqFile='magnettest';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050914B' )
	t0=[50400 51200 51400 52350 52425 53200 53500 54300 54800 55600 55900 56800];
	t1=[51200 51400 52350 52425 53200 53500 54300 54800 55600 55900 56800 57100];
	os=zeros(1,12)-0.41;
	is=zeros(1,12)+7.0;
	daqFile='050914_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias','bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050914C' )
	t0=[58100 58800 59000 59600 59700 60300 60400 61000 61100 61700];
	t1=[58800 59000 59600 59700 60300 60400 61000 61100 61700 61800];
	os=zeros(1,10)-0.42;
	is=zeros(1,10)+7.0;
	daqFile='050914_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias2','bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '050914D' )
	%first 50 seconds is applying magnetic field, second 50 is turned off
	t0=[62400:100:62800];
	t1=[62500:100:62900];
	os=zeros(1,5);
	is=zeros(1,5);
	daqFile='050914_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091614A' )
	t0=[54600 55600 56600 57600 58700 59750 60700 61700];
	t1=[55400 56400 57400 58400 59500 60500 61500 62600];
	os=[-2.0 -2.0 -2.0 -2.0 -2.0 -2.0 -2.0 -2.0];
	is=[1.0:.5:4.5];
	daqFile='091614';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'} {'bias6'} {'bias7'} {'bias8'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091714A' )
	t0=[50300:1000:53300 54400 55440];
	t1=[51100 52100 53200 54200:1000:56200];
	os=zeros(1,6)-2;
	is=[5.0:.5:7.5];
	daqFile='091714';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'} {'bias6'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091714B' )
	t0=[56700 57700:1000:59700];
	t1=[57500:1000:59500 60600];
	os=zeros(1,4)-2;
	is=[-7.5:.5:-6.0];
	daqFile='091714_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias7'} {'bias8'} {'bias9'} {'bias10'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091814A' )
	t0=[49400 51100 52200 53200 54200 ];
	t1=[50900 52000 53000 54000 55050 ];
	os=zeros(1,5)-2.0;
	is=[-5.5:.5:-3.5];
	daqFile='091814';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091814B' )
	t0=[55250 56200];
	t1=[56050 57060];
	os=[-2. -2.];
	is=[-3. -2.5];
	daqFile='091814_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias6'} {'bias7'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091914A' )
	t0=[47600 49000];
	t1=[48400 49800];
	os=[-2. -2.];
	is=[-1.0 -1.5];
	daqFile='091914';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091914B' )
	t0=[53000 54200 55400];
	t1=[53800 55000 56200];
	os=[-2. -2. -2.];
	is=[8.5 9.0 9.5];
	daqFile='091914_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

if ( RUNNAME == '091914C' )
	t0=[58000 59150 60225 61200];
	t1=[58800 59950 60900 62000];
	os=zeros(1,4)-2.0;
	is=[-8.5 -9.0 -9.5 -10.0];
	daqFile='091914_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias6'} {'bias7'} {'bias8'} {'bias9'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================

% note: Hall Array MLS4 and MLS5 bad, large spikes at rotation frequency
if ( RUNNAME == '101714A' )
	t0=[46750 47850 49650 50950 52000];
	t1=[47600 49400 50600 51740 52800];
	os=[-2.00 -2.05 -2.10 -2.15 -2.20];
	is=[-7.0 -7.0 -7.0 -7.0 -7.0];
	daqFile='101714';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '073115A' )
	% dropping 200 seconds at the beginning of each condition
	t0=[47000 48400 49650];
	t1=[48000 49400 51100];
	os=[-2.5 -2.6 -2.7];
	is=[-7.0 -7.0 -7.0];
	daqFile='073115';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '073115B' )
	t0=[51700 53200 54200];
	t1=[52600 53800 55000];
	os=[-2.8 -2.9 -3.0];
	is=[-7.0 -7.0 -7.0];
	daqFile='073115_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias4'} {'bias5'} {'bias6'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '073115C' )
	t0=[56100 57300];
	t1=[56700 58000];
	os=[-3.0 -3.0];
	is=[-6.5 -6.0];
	daqFile='073115_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias7'} {'bias8'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '073115D' )
	t0=[58500];
	t1=[59100];
	os=[-3.0];
	is=[-5.5];
	daqFile='073115_4';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias9'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081115A' )
	t0=[57900 58700 59700 60600];
	t1=[58400 59300 60300 61200];
	os=[-3.0 -3.0 -3.0 -3.0];
	is=[2.5 2.0 1.5 1.0];
	daqFile='081115_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081215A' )
	t0=[55700 56700 57600 58600];
	t1=[56300 57300 58200 59200];
	os=[-2.5 -2.6 -2.7 -2.8];
	is=[7.0 7.0 7.0 7.0];
	daqFile='081215_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081215B' )
	t0=[59600 60600];
	t1=[60200 61200];
	os=[-2.9 -3.0];
	is=[7.0 7.0];
	daqFile='081215_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081315A' )
	t0=[40925 41900 42900 44100 45100];
	t1=[41500 42500 43700 44700 45500];
	os=[-3.0 -3.0 -3.0 -3.0 -3.0];
	is=[6.5 6.0 5.5 5.0 4.5];
	daqFile='081315';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081315B' )
	t0=[46000 47000 48050 49000 50300];
	t1=[46600 47600 48600 50100 50750];
	os=[-3.0 -3.0 -3.0 -3.0 -3.0];
	is=[4.0 3.5 -7.5 -9.3 -8.5];
	daqFile='081315_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias6'} {'bias7'} {'bias8'} {'bias9'} {'bias10'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081415A' )
	t0=[46100 47100 48200 49400 50700];
	t1=[46700 47800 49000 50300 51500];
	os=[-2.9 -2.9 -2.9 -2.9 -2.9];
	is=[-8.3 -8.4 -8.5 -8.6 -8.7];
	daqFile='081415';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081415B' )
	t0=[51900 53300 55300 57300];
	t1=[52900 54500 57025 58400];
	os=[-2.9 -2.9 -2.9 -2.9];
	is=[-8.8 -8.9 -9.0 -9.0];
	daqFile='081415_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias6'} {'bias7'} {'bias8'} {'bias9'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '081415C' )
	t0=[58800 60000 61100];
	t1=[59600 60700 62000];
	os=[-2.9 -2.9 -2.9];
	is=[-9.1 -9.2 -9.3];
	daqFile='081415_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias10'} {'bias11'} {'bias12'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090115A' )
	t0=[52830 54400 55150];
	t1=[54025 54800 55750];
	os=[-3.0 -3.0 -3.0];
	is=[-8.3 -8.4 -8.5];
	daqFile='090115';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090115B' )
	t0=[56200 57200 58100 58900];
	t1=[56800 57690 58550 59500];
	os=[-3.0 -3.0 -3.0 -3.0];
	is=[-8.6 -8.7 -8.8 -8.9];
	daqFile='090115_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias4'} {'bias5'} {'bias6'} {'bias7'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090115C' )
	t0=[59900 60650];
	t1=[60300 61400];
	os=[-3.0 -3.0];
	is=[-9.0 -9.1];
	daqFile='090115_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias8'} {'bias9'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090215A' )
	t0=[44425 45550];
	t1=[45200 46450];
	os=[-3.0 -3.0];
	is=[-9.2 -9.3];
	daqFile='090215';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090215B' )
	t0=[47315 48300 49500 50500];
	t1=[47920 48900 50100 51100];
	os=[-3.1 -3.1 -3.2 -3.2];
	is=[-7.0 7.0 -7.0 7.0];
	daqFile='090215_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias3'} {'bias4'} {'bias5'} {'bias6'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090215C' )
	t0=[52100 53100 54200 55200];
	t1=[52700 53700 54800 55800];
	os=[-3.3 -3.3 -3.4 -3.4];
	is=[-7.0 7.0 -7.0 7.0];
	daqFile='090215_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias7'} {'bias8'} {'bias9'} {'bias10'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090215D' )
	t0=[56400 57400 59050];
	t1=[57000 58000 59800];
	os=[-3.5 -3.5 -3.5];
	is=[-7.0 7.0 -10.5];
	daqFile='090215_4';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias11'} {'bias12'} {'bias13'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090315A' )
	t0=[47000 49000];
	t1=[48600 50300];
	os=[-3.5 -3.5];
	is=[-10.7 -10.9];
	daqFile='090315';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090315B' )
	t0=[50800 52600];
	t1=[52200 54800];
	os=[-3.5 -3.5];
	is=[-11.1 -11.2];
	daqFile='090315_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias3'} {'bias4'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090315C' )
	t0=[56100 57200];
	t1=[56700 58000];
	os=[-3.6 -3.6];
	is=[-7.0 7.0];
	daqFile='090315_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '090315D' )
	t0=[58600 59600];
	t1=[59600 60200];
	os=[-3.7 -3.7];
	is=[7.0 -7.0];
	daqFile='090315_4';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '091815A' )
	t0=[53000 54600 56600 58100 59600];
	t1=[54200 55400 57300 59200 60400];
	os=[-3.8 -3.8 -3.8 -3.95 -3.95];
	is=[-11.2 -10.8 -11.0 -11.8 -12.0];
	daqFile='091815';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'} {'bias4'} {'bias5'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '091815B' )
	t0=[60820];
	t1=[61500];
	os=[-3.95];
	is=[-11.6];
	daqFile='091815_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias5'}}; %same as last condition from 091815A

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '092215A' )
	t0=[43400 44400 45400];
	t1=[44000 45000 46000];
	os=[-3.95 -3.95 -3.95];
	is=[-7.5 -5.0 -7.0];
	daqFile='092215';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '092215B' )
	t0=[46400 47400 48400 49400];
	t1=[47000 48000 49000 50000];
	os=[-3.95 -3.95 -3.95 -3.95];
	is=[-5.5 -6.5 -6.0 -4.5];
	daqFile='092215_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias4'} {'bias5'} {'bias6'} {'bias7'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '092215C' )
	t0=[50400 51400 52400 53400];
	t1=[51000 52000 53000 54000];
	os=[-3.95 -3.95 -3.95 -3.95];
	is=[-8.5 -9.0 -9.4 -11.3];
	daqFile='092215_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias8'} {'bias9'} {'bias10'} {'bias11'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '092315A' )
	t0=[45100 47100];
	t1=[46700 48200];
	os=[-3.95 -3.95];
	is=[-10.3 -10.3];
	daqFile='092315';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '092515A' )
	t0=[54200 55700 57400 59150];
	t1=[55230 56875 58800 59900];
	os=[-3.95 -3.95 -3.95 -3.95];
	is=[-10.55 -11.05 -10.55 -10.55];
	daqFile='092515';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102115A' )
	t0=[49500 50600 51700];
	t1=[50000 51200 52325];
	os=[-3.95 -3.95 -3.95];
	is=[1.5 2.0 2.5];
	daqFile='102115';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102115B' )
	t0=[52800 53800 54800];
	t1=[53400 54400 55500];
	os=[-3.95 -3.95 -3.95];
	is=[3.0 3.5 4.0];
	daqFile='102115_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias5'} {'bias6'} {'bias7'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102115C' )
	t0=[56000 57100 58100 59100 60200];
	t1=[56700 57700 58700 59700 60800];
	os=[-3.95 -3.95 -3.95 -3.95 -3.95];
	is=[4.5 5.0 5.5 6.0 6.5];
	daqFile='102115_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias8'} {'bias9'} {'bias10'} {'bias11'} {'bias12'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102215A' )
	t0=[47900 49000 50000]; % Hall array EQ7 intermittent issues.
	t1=[48600 49600 50600];
	os=[-3.95 -3.95 -3.95];
	is=[7.0 7.6 8.6];
	daqFile='102215';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{'bias1'} {'bias2'} {'bias3'}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102215B' )
	t0=[51000 52000 53000]; % Hall array EQ7 possible issues
	t1=[51600 52600 53600];
	os=[-3.95 -3.95 -3.95];
	is=[8.8 9.4 10.4];
	daqFile='102215_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102215C' )
	t0=[57400 58600 59800];
	t1=[58000 59200 60400];
	os=[-3.8 -3.7 -3.6];
	is=[10.4 10.4 10.4];
	daqFile='102215_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102315A' )
	t0=[50000 51400 53000];
	t1=[50800 52400 53600];
	os=[-3.8 -3.7 -3.6];
	is=[-11.2 -11.2 -11.2];
	daqFile='102315_2';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102315B' )
	t0=[54200 55200 56400 57400];
	t1=[54800 55800 57000 58000];
	os=[-3.5 -3.5 -3.4 -3.4];
	is=[-11.2 10.4 -11.2 10.4];
	daqFile='102315_3';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '102315C' )
	t0=[58600 59600];
	t1=[59200 60400];
	os=[-3.3 -3.3];
	is=[-11.2 10.4];
	daqFile='102315_4';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is);
end

%=======================================================================
if ( RUNNAME == '111715A' )
	t0=[51300 52600];
	t1=[51900 53200];
	os=[-0.52 -0.52];
	is=[8.4 8.6];
	daqFile='111715';
	
	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111715B' )
	t0=[54100 55360 56400];
	t1=[54700 55900 57100];
	os=[-0.52 -0.52 -0.52];
	is=[8.8 9.0 9.2];
	daqFile='111715_2';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111715C' )
	t0=[58800 60200];
	t1=[59700 61100];
	os=[-3.7 -3.7];
	is=[-10.4 -10.8];
	daqFile='111715_3';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111715D' )
	t0=[61700];
	t1=[62850];
	os=[-3.7];
	is=[-11.2];
	daqFile='111715_4';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111815A' )
	t0=[50700 51800 53000 53700];
	t1=[51600 51900 53500 53800];
	os=[-3.95 -3.95 -3.95 -3.95];
	is=[-5.92 -5.92 2.96 2.96];
	daqFile='111815';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111815B' )
	t0=[54700 55800 56800 58200];
	t1=[55600 56000 58000 58300];
	os=[-3.95 -3.95 -3.95 -3.95];
	is=[-10.6 -10.6 -11.0 -11.0];
	daqFile='111815_2';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '111815C' )
	t0=[61100 62100];
	t1=[61900 62100];
	os=[-3.95 -3.95];
	is=[-2.0 -2.0];
	daqFile='111815_3';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '032216A' )
	t0=[57750 59000 60600];
	t1=[58600 60200 61300];
	os=[-2.0 -2.0 -2.0];
	is=[-6.0 -6.2 -5.8];
	daqFile='032216';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '032416A' )
	t0=[49600];
	t1=[51100];
	os=[-3.7];
	is=[-11.1];
	daqFile='032416';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '032416B' )
	t0=[53400];
	t1=[53650];
	os=[-3.7];
	is=[-11.1];
	daqFile='032416_2';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '032416C' )
	t0=[58800 59050 59310 59550 59800 60300];
	t1=[58850 59110 59350 59600 60100 60200];
	os=[-0.60 -0.59 -0.58 -0.59 -0.60 -0.56];
	is=[11.2 11.2 11.2 11.2 11.2 10.6];
	daqFile='032416_3';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''} {''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '032516A' )
	t0=[54750 55675]; % some short sections of data not included here
	t1=[55300 56100]; % data from 032516_2 and 032516_3 not included
	os=[-3.99 -3.99];
	is=[-11.3 -12.0];
	daqFile='032516';

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042016A' )
	t0=[51600 53500]; % high Bfield data not included here
	t1=[51700 53700];
	os=[-0.63 -0.63];
	is=[10.3 10.4];
	daqFile='042016';

	% Added following variable once we switched to two coils
	Bfield='dipole';;

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042016B' )
	t0=[54400 55300 56200]; % high Bfield data not included here
	t1=[54600 55500 56400];
	os=[-0.63 -0.63 -0.63];
	is=[10.5 10.6 10.7];
	daqFile='042016_2';

	% Added following variable once we switched to two coils
	Bfield='dipole';;

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042016C' )
	t0=[57100]; % high Bfield data not included here
	t1=[57350];
	os=[-0.63];
	is=[10.8];
	daqFile='042016_3';

	% Added following variable once we switched to two coils
	Bfield='dipole';;

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042016D' )
	t0=[59550]; % high Bfield data not included here
	t1=[59700];
	os=[-1.87];
	is=[-11.2];
	daqFile='dipole';;;

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042016E' )
	t0=[60500];
	t1=[60600];
	os=[-1.87];
	is=[-9.35];
	daqFile='042016_5';

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116A' )
	t0=[47600];
	t1=[47800];
	os=[-1.87];
	is=[-7.5];
	daqFile='Ro3';

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116B' )
	t0=[48720];
	t1=[48910];
	os=[-1.87];
	is=[-5.6];
	daqFile='Ro2';

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116C' )
	t0=[49670];
	t1=[49875];
	os=[-1.87];
	is=[-3.75];
	daqFile='Ro1';

	% Added following variable once we switched to two coils
	Bfield='dipole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116D' )
	t0=[59750];
	t1=[59950];
	os=[-1.87];
	is=[-3.75];
	daqFile='Ro1quad';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';;

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116E' )
	t0=[60500];
	t1=[60700];
	os=[-1.87];
	is=[-5.6];
	daqFile='Ro2quad';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';;

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116F' )
	t0=[61400];
	t1=[61600];
	os=[-1.87];
	is=[-7.5];
	daqFile='Ro3quad';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116G' )
	t0=[62150];
	t1=[62350];
	os=[-1.87];
	is=[-9.35];
	daqFile='Ro4quad';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042116H' )
	t0=[62900];
	t1=[63100];
	os=[-1.87];
	is=[-11.2];
	daqFile='Ro5quad';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216A' )
	t0=[49600 50800];
	t1=[50100 51400];
	os=[-4.0 -4.0];
	is=[-11.6 -12.0];
	daqFile='042216';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''} {''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216B' )
	t0=[52450];
	t1=[52900];
	os=[-4.0];
	is=[-12.4];
	daqFile='042216_2';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216C' )
	t0=[54975];
	t1=[55200];
	os=[-2.25];
	is=[9.0];
	daqFile='042216_3';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216D' )
	t0=[57100];
	t1=[57450];
	os=[-4.0];
	is=[6.0];
	daqFile='042216_4';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216E' )
	t0=[58750];
	t1=[59100];
	os=[-4.0];
	is=[-10.68];
	daqFile='042216_5';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '042216F' )
	t0=[60025 ];
	t1=[60640 ];
	os=[-1.16 ];
	is=[-4.0 ];
	daqFile='042216_6';

	% Added following variable once we switched to two coils
	Bfield='quadrupole';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================
if ( RUNNAME == '999999Z' )
	t0=[];
	t1=[];
	os=[];
	is=[];
	daqFile='';

	% Added following variable once we switched to two coils
	Bfield='';

	% Create list of bias file names
	% If one bias file for all conditions: biasFile={{'bias'}};
	% If one separate bias file for each condition: 
	%       biasFile={{'bias1'} {'bias2'} ...}
	% If one set of bias files for all conditions:
	%       biasFile={'bias1','bias2', ...}
	% If multiple different bias files for each condition: 
	%       File={{'bias_2'} {'b1', 'b2'} ... };
	biasFile={{''}};

	exprun=struct('t0',t0,'t1',t1,'daqFile',daqFile,'biasFile',{biasFile},'os',os,'is',is,'Bfield',Bfield);
end

%=======================================================================

if ~exist('exprun')
	error('Run information not defined in runinfo.m for requested run')
end
