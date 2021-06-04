% Perevalov Sep 2019
% creates a picture with Aitoff projection using known gauss coefficients
% REQUIRES m_map package https://www.eoas.ubc.ca/~rich/map.html#download

%% Here are the gauss coeeficients array
% 
fake_gauss = zeros(1,35);
fake_gauss(25) = 1;   % this one just adds something non-zero
% fake_gauss(19) = 5;
% fake_gauss = record_stat_mag_ramp{1, 3}{1, 6}(5,:)  ;
% cs = 0.9*coils_signal(60.9,1);
% fake_data31 = record_stat_mag_ramp{12, 3}{1, 4}(301,1:31)-cs(1:31);
% fake_gauss=gcoeff3m(fake_data31-0*mean(fake_data31),probepos());

%% creating coordinates to plot onto
phi = (0:0.05:2*pi);
theta=(0:0.05:pi);
phi_deg = phi.*180/pi-180;
theta_deg = theta.*180/pi-90;

grid_coords = zeros(length(phi)*length(theta),3);

% making coordinates of the imaginary probes at these locations
for phi_i = 1:length(phi)
    for theta_i = 1:length(theta)
        k = length(theta)*(phi_i-1)+theta_i;
        grid_coords(k,1) = 1;
        grid_coords(k,2) = theta(theta_i); % theta
        grid_coords(k,3) = phi(phi_i);
    end
end

% returns the values on these imaginary probes based on the g's
B_array = gauss2_hall(fake_gauss,grid_coords);

%% converting from 1D array into 2D 
B_map = zeros(length(phi),length(theta));
for phi_i = 1:length(phi)
    for theta_i = 1:length(theta)
        k = length(theta)*(phi_i-1)+theta_i;
        B_map(phi_i,theta_i) = B_array(k);        
    end
end

%% Plotting
figure()
m_proj('Hammer-Aitoff','lat',[-90 90], 'lon',[-180 180])
m_contourf(phi_deg,theta_deg,B_map','EdgeColor','None')
colorbar;

