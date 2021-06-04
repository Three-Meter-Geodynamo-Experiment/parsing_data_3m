% Simple program for creating .mat file with physics constants and 
% constants for 3 Meter

RO=1.46;
RI=0.51;
ETA=0.079; % magnetic diffusivity, =(sigma mu_0)^-1, m^2/s
STICKVB = 0.0315; % volts per Gauss, hall probes inserted into sodium ???and also hall array probes???
MAGBI= 8./15.; % ~average Gauss per ampere for single electromagnet
BS0FAC = 0.068; % Gauss per ampere
RHO=921.16; % approximate average density, mean from gginf vlrns
NU=6.76E-7; % approximate kinematic viscosity, m^2/s, mean from gginf vlrns
HALLARRAYVB=0.0315; % volts per Gauss, hall array

% Create a structure of constants
C=struct('RO',RO,'RI',RI,'ETA',ETA,'STICKVB',STICKVB,'MAGBI',MAGBI,'BS0FAC',BS0FAC,...
	'RHO',RHO,'NU',NU,'HALLARRAYVB',HALLARRAYVB);

save('Constants3M.mat', 'C');

clear
