function [k] = lm2k(l,m)

if abs(m) > l 
    warning('something is wrong here, your |m|>l')
end
if m==0
    ki=0;
elseif m>0
    ki = 2*(m-1)+1;
else 
    ki = 1-2*(m+1)+1;
end
k = l^2+ki;
end

