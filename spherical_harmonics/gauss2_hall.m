function [B_31] = gauss2_hall(data_sph,locs)
% Produces a signal of 31 surface hall probes if given the values of gauss
% coefficients
% Made to invert gcoeff3m()

% Artur Perevalov
if ~exist('locs', 'var')
    locs = probepos();
end

T = size(data_sph,1);
k_max = size(data_sph,2);
l_max = -1+(1+size(data_sph,2))^0.5;

B_31 = zeros(T,length(locs));

for t = 1:T
    for i_pr = 1:length(locs)
        r = locs(i_pr,1);
        theta= locs(i_pr,2);
        phi= locs(i_pr,3);
        for k = 1:k_max
            
            [l, m] = k2lm(k);
            if m < 0
                continue
            end
            Pl = legendre(l,cos(theta),'sch');
            for i_m = 1:2:l
                Pl(1+i_m)= -1*Pl(1+i_m);
            end
            
            gc = data_sph(t,k);
            gs = data_sph(t,k+1);
            B = l*(l+1)*Pl(1+abs(m)) * r^-(l+2) *(gc * cos(m*phi) + gs*sin(m*phi) );
            
            
            
            B_31(t,i_pr) = B_31(t,i_pr) + B;
        end
    end
end

end

