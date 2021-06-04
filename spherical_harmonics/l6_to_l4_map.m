% plots a confusion matrix (leakage map), needed to understand where higher
% harmonics (>5) appear in linear square fitting done by "gcoeff3m()"

% requires 
% k2lm()
% gcoeff3m()


% A Perevalov, September 2019

l=6; % maximum l number to evaluate

normalize = fix(([1:24]).^0.5);

shadow = zeros(l*(l+2)+1,24+1);
for k = 1:l*(l+2)
    % creating l(l+2) zero harmonics except one
    data_24 = zeros(1,l*(l+2));
    data_24(k) = 1/fix(k^0.5);
    
    % converting harmonics into 31 probe data
    data31   = gauss2_hall(data_24);
    
    % converting back but to 24 harmonics
    data_24_2 = gcoeff3m(data31,probepos());
    
    shadow(k,1:24) = 10/log(10)*log(abs(data_24_2).*normalize);
end

namesx = cell(1,l*(l+2));
namesy = cell(1,24);

for k =1:l*(l+2)
    [l, m] = k2lm(k);
    namesx{k} = [ 'l' num2str(l) ' m' num2str(m)];
    if k <25
        namesy{k} = [ 'l' num2str(l) ' m' num2str(m)];
    end
end
    

s= pcolor(shadow');
% set(s, 'EdgeColor', 'none');
caxis([-15 1]);
colorbar

set(gca,'xtick',[1:l*(l+2)],'xticklabel',namesx)
set(gca,'ytick',[1:24],'yticklabel',namesy)

xtickangle(60)

title(['Relative power of an initial harmonic and observed, dB'])