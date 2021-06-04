function [l,m] = k2lm(k)
% returns l and m numbers if given k 

max_l = 8;
k_values = 1:(max_l+1)^2-1;
l_list = fix(k_values.^0.5);
m_list = fix(((k_values - l_list.^2)+1)/2);

for k_ind = 3:(max_l+1)^2-1
    if m_list(k_ind) == m_list(k_ind-1)
        m_list(k_ind) = -m_list(k_ind);
    end
end
        
l = l_list(k);
m = m_list(k);
end

