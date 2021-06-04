function [] = plotting_logs(folder) 
% made to easily plot info from log files from 3M data folders
% useful for plotting data like rotation rates, temperature, magnetic field
% also torque if you need (check the torque data part with IF)
% Artur Perevalov September 2019


if ~exist('folder', 'var')
    warning('No input folder, do not know what to plot')
    return
end
[data_control, data_magnet] = import_control_magnet_logs(folder);


if 0   %   Set to 1 if you want to import torque data and modify plot part
    torque_data = importdata([way_to_folders() folder '/torque.dat' ]);
    tt = torque_data(:,1);     % torque time vector
    t_d = torque_data(:,2);    % tordue data vector
end

% setting time arrays
tc = data_control(:,1);
tm = data_magnet(:,1);

% setting variables
angle = data_control(:,3);   
fi =  data_control(:,14);        % inner freq
fo =  data_control(:,20);        % oiter freq
fo_r=data_control(:,19)/8.297;   % outer freq real
fi_r=data_control(:,13);         % inner freq real

tq = data_control(:,21);      % torque
T1 = data_control(:,2);       % temp 1
T2 = data_control(:,3);       % temp 2
THi = data_control(:,6);      % temp heater in
THo = data_control(:,9);      % temp heater out
P_heat=data_control(:,5);     % temp heater in

pip = data_control(:,10);     % pump inlet pressure
pop = data_control(:,11);     % pump outlet pressure

oip = data_control(:,8);     % oil inlet pressure
oop = data_control(:,7);     % oil outlet pressure

ro_r = (fi_r-fo_r)./fo_r;   % rossby real
ro = (fi-fo)./fo;            % requested rossby
mg = data_magnet(:,3);      % magnetic field


figure(42)
plot(tc,ro_r,'b',tm,mg/10,'r',tc,fo_r,'g',tc,fi_r,'c',tc,fi,'k')
% plot(tc,ro,'b',tm,mg/10,'r',tc,fo_r,'g',tc,fi,'c',tt, t_d/50000,'k')
title(['Rossby, f_o, f_i, and Mag field on ' folder])
legend('Ro, 1','Current, A/10','f_o, Hz','f_i_r, Hz','f_i req, Hz', 'Location','northwest')
xlabel('Time in seconds since midnight')

% saveas(gcf,[save_folder '102115_log.png'])

% Ek = 7e-7/2/3.14/3.95/1.03^2
figure(43)
title('Temperatures and heater power')
plot(tc,THi, tc,THo, tc,P_heat,tc,T1,tc,T2,tc,pip,tc,pop,tc,oip,tc,oop)
legend('Temp heater in','Temp heater out','Heater power','Na temp rotcomp', 'Na temp wireless','Pump inlet, psi','Pump outlet, psi','Oil inlet, psi','Oil outlet, psi','Location','southwest')

xlabel('Time in seconds since midnight')

% % 


%% Ruben annalisys (annalysis?) please comment if I forgot to do so. I love you all if you're reading
% I actually hate you, Ruben. Artur

% figure(2);scatter(ro1,bdip)
% hold on
% scatter(ro1,brad);
% scatter(ro1,bphi);scatter(ro1,bcua);hold off;
% figure(3);scatter(re,bdip)
% hold on
% scatter(re,brad);
% scatter(re,bphi);scatter(re,bcua);hold off;figure(4);scatter(ro1,gginf);hold off;
% figure(6);scatter(tim,bdip)
% hold on
% scatter(tim,brad);
% scatter(tim,bphi);scatter(tim,bcua);hold off;
% 
% clearvars angle data_control data_magnet fi fi_r fo fo_r mg
% clearvars P_heat ro ro_r T1 T2 tc THi THo tm tq