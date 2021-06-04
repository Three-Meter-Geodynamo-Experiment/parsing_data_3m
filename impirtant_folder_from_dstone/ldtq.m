%ldtq.m script to load and plot torque file
!tqhead torque.dat
if ~(exist('bt') && exist('at'))
    'creating filter coeffs'
[bt at] = butter(2,.5/16,'low');
end

load junk
torque = zeros(length(junk),2);
torque(:,1) = junk(:,1);
torque(:,2) = -1130/1801990 * junk(:,2);
fig1 = figure; plot(torque(:,1),filtfilt(bt,at,torque(:,2)));
lims =[min(filtfilt(bt,at,torque(:,2))) max(filtfilt(bt,at,torque(:,2)))]
ylim(lims)
std(torque(:,2))


