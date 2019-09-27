%%% Function to do basic calculations for 3 Meter analysis
%%% Assumes data already loaded by load3m.m and stored in data (i.e. "D")

function [Calc Avg calc3mVersion] = calc3m(D,exp,C,TBEGINS,TENDS)

if ~(nargin==5)
	error('Usage: datecalc = calc3m(data,exp,C,TBEGINS,TENDS)');
end

% get calc3m filename/version number
calc3mVersion=mfilename;

n=size(exp.t0,2);

wtSodiumAvg=zeros(1,n);
for i = 1:n
	wtSodiumAvg(i)=mean(D.wt((exp.t0(i)+TBEGINS < D.wt(:,1) & D.wt(:,1) < exp.t1(i)-TENDS),2));
end
[RHO NU] = naprop(wtSodiumAvg);
disp('Using density = ')
disp(RHO)
disp('and using viscosity = ')
disp(NU)

OS=exp.os*(2*pi); % outer sphere angular frequency (rad/s)
IS=exp.is*(2*pi); % inner sphere angular frequency (rad/s)
RE=abs(IS-OS).*((C.RO-C.RI)^2)./C.NU; % Reynolds number (Eq. from tfpaper's GGINF.m, HAS WRONG UNITS!!! Kinematic viscosity is m^2/s so RE=(IS-OS)*(ro-ri)^2/NU)
RM=abs(IS-OS).*((C.RO-C.RI)^2)./C.ETA;
RO=(IS-OS)./OS; % Rossby number
GINF=0.003642.*RE.^1.89; % Torque with outer sphere stationary i.e. Ro=infinity

% Convert Hall sensor data to magnetic fields
B_mag=D.magnet(:,3)*C.MAGBI; % Average applied magnetic field in gauss (B0)
Bs0=D.magnet(:,3)*C.BS0FAC; % Applied cylindrical radial field at stick
t_mag=D.magnet(:,1);

% calibrate and lowpass filter torque
% following code based on /home/axl/matlab/ldtq.m
[bt at] = butter(2,.5/16,'low');
D.torque(:,2) = (-1130/1801990 * D.torque(:,2));
lowpassTorque=filtfilt(bt,at,D.torque(:,2));

BsAvg=zeros(1,n); BphiAvg=zeros(1,n);BAvg=zeros(1,n);Bs0Avg=zeros(1,n);torqueAvg=zeros(1,n);GCAvg=zeros(4,n);GCrmsAvg=zeros(24,n);
tCalc=cell(1,n); BsCalc=cell(1,n); BphiCalc=cell(1,n);tBCalc=cell(1,n);BCalc=cell(1,n);Bs0Calc=cell(1,n); torqueCalc=cell(1,n); tTorqueCalc=cell(1,n); GCCalc=cell(1,n);GCrmsCalc=cell(1,n);
for i=1:n
	BsAvg(i)=mean((D.data((exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS),43)-D.stickbias(i,1))/C.STICKVB);
	BphiAvg(i)=mean((D.data((exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS),44)-D.stickbias(i,2))/C.STICKVB);
	BAvg(i)=mean(B_mag(exp.t0(i)+TBEGINS < t_mag & t_mag < exp.t1(i)-TENDS));
	Bs0Avg(i)=mean(Bs0(exp.t0(i)+TBEGINS < t_mag & t_mag < exp.t1(i)-TENDS));
	torqueAvg(i)=mean(lowpassTorque(exp.t0(i)+TBEGINS < D.torque(:,1) & D.torque(:,1) < exp.t1(i)-TENDS));
	ddb=bsxfun(@minus,D.data((exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS),12:42),D.arraybias(i,:));
	ddb=ddb./C.HALLARRAYVB;
	GC=gcoeff3m(ddb,probepos);
	size(GC)
	mean(GC,1)
	axisymmetric=[1 4 9 16]; % m=0 harmonics only
	GCAvg(:,i)=mean(GC(:,axisymmetric));
	GCrmsAvg(:,i)=mean(((bsxfun(@minus,GC,mean(GC,1))).^2).^.5);
	
	tCalc{i}=D.t(exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS);
	BsCalc{i}=(D.data((exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS),43)-D.stickbias(i,1))/C.STICKVB;
	BphiCalc{i}=(D.data((exp.t0(i)+TBEGINS < D.t & D.t < exp.t1(i)-TENDS),44)-D.stickbias(i,2))/C.STICKVB;
	tBCalc{i}=t_mag(exp.t0(i)+TBEGINS < t_mag & t_mag < exp.t1(i)-TENDS);
	BCalc{i}=B_mag(exp.t0(i)+TBEGINS < t_mag & t_mag < exp.t1(i)-TENDS);
	Bs0Calc{i}=Bs0(exp.t0(i)+TBEGINS < t_mag & t_mag < exp.t1(i)-TENDS);
	torqueCalc{i}=lowpassTorque(exp.t0(i)+TBEGINS < D.torque(:,1) & D.torque(:,1) < exp.t1(i)-TENDS);
	tTorqueCalc{i}=D.torque(exp.t0(i)+TBEGINS < D.torque(:,1) & D.torque(:,1) < exp.t1(i)-TENDS,1);
	axisymmetric=[1 4 9 16]; % m=0 harmonics only
	GCCalc{i}=GC(:,axisymmetric);
	GCrmsCalc{i}=((bsxfun(@minus,GC,mean(GC,1))).^2).^.5;
end

% dimensionless torque
g=(abs(torqueAvg)-16.5)./(RHO.*NU.^2.*C.RI); %16.5 N*m is seal torque

%D.RO=RO;
%D.RM=RM;
%D.g=g;
%D.GINF=GINF;
%D.GC=GC;

Avg=zeros(1,n);


for i=1:n
	Avg(i)=struct('RO',RO(i),'RM',RM(i),'GC',GCAvg(4,i),'GCrms',GCrmsAvg(24,i),'Bs',BsAvg(i),'Bphi',BphiAvg(i),'B',BAvg(i),'Bs0',Bs0Avg(i),'Torque',torqueAvg(i),'g',g(i),'GINF',GINF(i));
end
Calc=struct('t',tCalc,'GC',GCCalc,'GCrms',GCrmsCalc,'Bs',BsCalc,'Bphi',BphiCalc,'tB',tBCalc,'B',BCalc,'Bs0',Bs0Calc,'tTorque',tTorqueCalc,'Torque',torqueCalc);
