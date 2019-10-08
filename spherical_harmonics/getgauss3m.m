function g = getgauss3m(d)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to get the gauss coefficients from the 3-meter experiment
% Author: Sarah Burnett Oct 2019
% d - is the diabiased hall probe data
% Ex: gauss = getgauss3m(debiaseddata(:,1:31))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Probe positions, from probepos()
r = 1.0522; 
theta = [2.70648207106761,2.70491127474081,2.70491127474081,2.72219003433556,2.14291525559864,2.14902390798062,2.16071761396898,2.17101505655575,2.18532675642210,2.19405340268207,2.13750473491746,1.61582582149635,1.62228353972873,1.63205738353990,1.64252935905186,1.58702788883844,1.59366013999602,1.60081598992920,1.60081598992920,1.61181156421676,1.08175507038609,1.09135438127205,1.10234995555962,1.10741141039040,1.11770885297717,1.13202055284352,1.07669361555530,0.645597290312703,0.671253630317019,0.679631210726592,0.636870644052731];
phi = [0.785572696322648,2.35636902311754,3.92594361943604,5.49778714378214,0.448549617762543,1.34582338621283,2.24449341806471,3.14159265358979,4.03869188911488,4.93753645389196,5.83481022234224,0,0.697957167872533,1.39643793452066,2.09544229994439,2.78606908495855,3.49083303691386,4.19053553403839,4.88744550435972,5.58505360638185,0.448549617762543,1.34582338621283,2.24449341806471,3.14159265358979,4.03869188911488,4.93753645389196,5.83446115649184,0.394269878025519,1.96733513284801,3.53656066331611,5.10264460113062];

lmax = 4;
ncoef = lmax*(lmax+2); 
[Nt, nprobes] = size(d);

%Build the basis functions
f=zeros(ncoef,nprobes);
for el = 1:lmax
    B = 0; 
    Plm = legendre(el,cos(theta),'sch');
    idx = el^2;
    for m = 0:el
       if m == 0
           f(idx,:) = el*(el+1)*r^(-(el+2))*Plm(m+1,:); 
       else
           f(idx+1,:) = el*(el+1)*r^(-(el+2))*Plm(m+1,:).*cos(m*phi);
           f(idx+2,:) = el*(el+1)*r^(-(el+2))*Plm(m+1,:).*sin(-m*phi);
           idx = idx + 2; 
       end
    end
end


%What we would like to do is solve for the gauss coefficients based on the
%basic functions evaluated at the points of the probes and the Br-component
%(called d) measured by the hall probes. Something like: d = g*f or g = d*f^-1.
%However, since f is not square and therefore not invertible, we multiple
%both sides on the left of d = g*f by f^T. This gives d*f^T = g*f*f^T.
%First, we create matrix M = f*f'. Then compute d*f^T. Then solve for g
%using the backslash which implements Gaussian elimination for efficiency.
%This is solve at each time for the gaussian coefficient at time t. 

M(1:ncoef,1:ncoef) = 0;

for i=1:ncoef
    for j=1:ncoef
        M(i,j)=f(i,:)*f(j,:)';
    end
end

fd=d*f';

g=zeros(Nt,ncoef); 
for idx=1:Nt 
      g(idx,:) = fd(idx,:)/M; %same as fd*M^-1
end

save('gauss.mat','g');

end

