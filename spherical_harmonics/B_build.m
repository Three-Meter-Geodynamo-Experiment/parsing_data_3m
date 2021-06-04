function Bsum = B_build(r,theta,phi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to evaluate the magnetic field given gauss coefficients from
% getgauss3m.m
% Author: Sarah Burnett Oct 2019
% Input: Scalars of desired r, theta, and phi
% Output: Br-component of the magnetic field
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('gauss.mat')
lmax = 4;

Bsum = 0;
for el = 1:lmax
    B = 0; 
    Plm = legendre(el,transpose(cos(theta)),'sch');
    idx = el^2;
    for m = 0:el
       if m == 0
           B = B + g(:,idx)*Plm(m+1); 
       else
           B = B + Plm(m+1)*(g(:,idx+1)*cos(m*phi)+g(:,idx+2)*sin(-m*phi));
           idx = idx + 2; 
       end
    end
    Bsum = Bsum + el*(el+1)*r^(-(el+2))*B; 
end

end