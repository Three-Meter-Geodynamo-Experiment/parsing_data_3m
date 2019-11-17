N = 50;
dead_max = 14;
err = zeros(dead_max,N);

for dead_probes = 1:dead_max

    for exp_i = 1:N

        g_c = rand(1,24);

        fake_data = gauss2_hall(g_c);
        fake_data = fake_data +1/100*rand(size(fake_data));


        probes_online = [dead_probes+1:31];   % choose the probes that are okay (the first one gives bad data)
        probes_online_positions = probepos();
        probes_online_positions = probes_online_positions(probes_online,:);

        g_c2 = gcoeff3m(fake_data(:,probes_online),probes_online_positions); % this one for using only 31 probes
        err(dead_probes,exp_i) = min(1,1/24*sqrt((sum((g_c-g_c2).^2))));
    end
end
plot(mean(err,2))
title('Average error in g_lm if first K probes are missing')
ylabel('Average error')
xlabel('Number of probes being dead starting from HLS1')