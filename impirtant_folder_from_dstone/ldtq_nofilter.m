%ldtq.m script to load and plot torque file
!tqhead torque.dat

load junk
torque = zeros(length(junk),2);
torque(:,1) = junk(:,1);
torque(:,2) = -1130/1801990 * junk(:,2);
fig1 = figure; plot(torque(:,1),(torque(:,2)));
lims =[min((torque(:,2))) max((torque(:,2)))]
ylim(lims)
std(torque(:,2))


