N = 50;
dead_max = 1;
err = zeros(dead_max,N);

for dead_probes = 1:dead_max

    for exp_i = 1:N

        d31 = randn(1,31);
%         d31 = d31 - mean(d31);
        
        g_sph = gcoeff3m(d31,probepos());
        
        d31_2 = gauss2_hall(g_sph);
        
        err(dead_max,exp_i) = (mean((d31-d31_2).^2))^0.5;
        
        
%         
%         fake_data = gauss2_hall(g_c);
%         fake_data = fake_data +1/100*rand(size(fake_data));
% 
%         probes_online = [dead_probes+1:31];   % choose the probes that are okay (the first one gives bad data)
%         probes_online_positions = probepos();
%         probes_online_positions = probes_online_positions(probes_online,:);
% 
%         g_c2 = gcoeff3m(fake_data(:,probes_online),probes_online_positions); % this one for using only 31 probes
%         err(dead_probes,exp_i) = min(1,1/24*sqrt((sum((g_c-g_c2).^2))));
    end
end
plot(err)
title('Average error in g_lm if first K probes are missing')
ylabel('Average error')
xlabel('Number of probes being dead starting from HLS1')



