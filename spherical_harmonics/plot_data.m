%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots the Aitoff projection of the Br-component using the function 'B'. 
% Author: Sarah Burnett Oct 2019
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(groot,'defaultLineLineWidth',2.0)
set(groot,'defaultAxesFontSize',14)
load('data.mat','time')
N = 20; 
phi = linspace(0,2*pi,2*N+1);
phi = phi(1:end-1); %remove duplicate point
theta = linspace(0,pi,N);
R = 1.0522;
 
for idx = 1:N
    for jdx = 1:2*N
        BR(jdx,idx,:) = B_build(R,theta(idx),phi(jdx));
    end
end


phi_deg = phi.*180/pi-180;
theta_deg = theta.*180/pi-90;
figure(1),
m_proj('Hammer-Aitoff','lat',[-90 90], 'lon',[-180 180])
m_contourf(phi_deg,theta_deg,BR(:,:,1)','EdgeColor','None')
str = sprintf('t = %2.3fs',time(1)-time(1));
title(str)
colorbar
caxis([-0.02 0.06])

%% Make a movie

vidfile = VideoWriter('Ro-49e-2.mp4'); %name the movie
open(vidfile);

for idx = 1:20:length(time) %fewer frames for a smaller file
    figure(1),
    m_proj('Hammer-Aitoff','lat',[-90 90], 'lon',[-180 180])
    m_contourf(phi_deg,theta_deg,BR(:,:,idx)','EdgeColor','None')
    str = sprintf('t = %2.3fs',time(idx)-time(1));
    title(str)
    colorbar
    caxis([-0.02 0.06])
    F(1) = getframe(gcf);
    writeVideo(vidfile, F(1));
end

close(vidfile)
