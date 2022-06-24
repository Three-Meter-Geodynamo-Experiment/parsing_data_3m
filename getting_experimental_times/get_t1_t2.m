function [t_vect1,t_vect2] = get_t1_t2(time,data,t1,t2,range)
% time vector, data_vector, range of variables (1% of range is the
% threshold), time1 - where to start, t2 - where to end

time = time(~isnan(data));
data = data(~isnan(data));

time = time(data ~= Inf);
data = data(data ~= Inf);
time = time(data ~= -Inf);
data = data(data ~= -Inf);

if ~exist('t1','var')
    t1 = time(1);
    t2 = time(end);
end

T_gap = 50;
gap_points = find(time > time(100)+T_gap, 1, 'first')-100; 
tolerance = 1/50;
step = 3;

if ~exist('range','var')
    data_srt= sort(data);
    data_srt= data_srt(fix(0.05*length(data_srt)):end-fix(0.05*length(data_srt)));
    range = abs(data_srt(1)-data_srt(end));
    
end

i_t1 = find(time > t1, 1, 'first')+1;
i_t2 = find(time > t2-1, 1, 'first') -1;
i_t2 = min(i_t2,length(time)-1);

ind = i_t1;

t_vect1 = [];
t_vect2 = [];

while ind < i_t2 - gap_points

    if std(data(ind:ind+gap_points)) < range*tolerance
        
        data_i = mean(data(ind:ind+gap_points));
        
        t_1i = time(ind)+step;
        t_2i = t_1i;
        
        ind2 = ind+gap_points;
        while ind2 <= i_t2
            if ind2 == i_t2
                t_2i = time(ind2) - step;
                break
            end
                
            if std(data(ind2-gap_points:ind2)) > range*tolerance
                t_2i = time(ind2) - step;
                break
            end
            ind2 = ind2 + 1;
        end
        
        if t_2i ~= t_1i
            t_vect1 = [t_vect1,t_1i];
            t_vect2 = [t_vect2,t_2i];
        end
        ind = ind2;
    end
    ind = ind+1;
end

t_vect1 = fix(t_vect1);
t_vect2 = fix(t_vect2);

% figure(10)
% plot(time,data)
% hold on

for i=1:length(t_vect1)
    
    line([t_vect1(i) t_vect1(i)],[-100*range 100*range],'color','b','linestyle','--')
    line([t_vect2(i) t_vect2(i)],[-100*range 100*range],'color','r','linestyle','--')
    text(t_vect1(i),0,['\uparrow' num2str(i)]) %creates label to select range later
end

xlim([t1-25 t2+25])
% 
% hold off



end

