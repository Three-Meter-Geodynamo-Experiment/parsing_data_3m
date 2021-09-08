% Made for getting times from experimental days when parameters are stable,
% like stable rossby, or stable magnetic field etc
% as output it will give two vectors: t1 and t2 - the beginnings of the chunks
% and the end of the chunks. And should plot them on a time plot with
% blue markers at t1's and red markers at t2's

% requires functions
% import_control_magnet_logs()
% get_t1_t2()

% Artur Perevalov September 2019

%% control parameters
folder = '100912';          % which folder to work with
t_start = 56687;            % from which time (default zero)
t_end = 64041;              % up to this time (default midnight)
search_parameter = 3;              % which parameter to check (1-rossby, 2-mag field, 3 - inner rotation rate)
% you also SHOULD choose which vector to use to determine times (rossby or
% magnetic data etc), this is determined in the line that contains [t1, t2]
%% BE CAREFULL, double check your times! sometimes other parameters could change while you are not expecting
% for example magnetic field can stay fixed while rossby changes to the
% next phase, in this case consider using t1 and t2 from different data sets
%%
% importing data from logs
[data_control, data_magnet] = import_control_magnet_logs(folder);

% setting time arrays
tc = data_control(:,1);
tm = data_magnet(:,1);

% setting variables
fi =  data_control(:,14);        % inner freq
fo =  data_control(:,20);        % outer freq
fo_r=data_control(:,19)/8.297;   % outer freq real
fi_r=data_control(:,13);         % inner freq real

tq = data_control(:,21);         % torque
T1 = data_control(:,2);          % temp 1
T2 = data_control(:,3);          % temp 2

ro = (fi-fo)./fo;              % rossby requested
ro_r = (fi_r-fo_r)./fo_r;        % rossby real
mg = data_magnet(:,3);           % magnetic field

%% plotting
figure(41)
plot(tc,ro_r,'b',tm,mg/10,'r',tc,fo_r,'g',tc,fi,'c')
title(['Day ' folder])
% plot(tc,ro,'b',tm,mg/10,'r',tc,fo_r,'g',tc,fi,'c',tt, t_d/50000,'k')
title(['Rossby, f_o, f_i, and Mag field on ' folder])
legend('Ro, 1','Current, A/10','f_o, Hz','f_i, Hz','AutoUpdate','off', 'Location','northwest')
xlabel('Time in seconds since midnight')
hold on
% adding protection if user set up wrong time gaps
if t_end > tm(end)
    t_end = tm(end) - 1;
end
% if t_start < tm(1)
%     t_start = tm(1) + 1;
% end
%% actually getting the times and plotting markers on the top of the plot above
if search_parameter == 1
    [t1, t2] = get_t1_t2(tc,ro,t_start,t_end);        % this one for rossby
elseif search_parameter == 2
    [t1, t2] = get_t1_t2(tm,mg,t_start,t_end);            % this one for working with magnetic data
elseif search_parameter == 3
    [t1, t2] = get_t1_t2(tc,fi,t_start,t_end);        % this one for the inner sphere rotation rate
end
hold off 
%%

clear  data_control data_magnet tv tm fi fo fo_r fi_r tq T1 T2 ro mg tc t_end t_start ro_r