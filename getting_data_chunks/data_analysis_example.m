% an example of usage grab_3mdata_chunks 
% takes chunks of data from folder and 

import = 1; % just for suppressing later

if import 
    t1 = 22+ [63573, 63899];   % times of the beginning of the chunks with some shift
    t2 =     [63894, 64215];   % times of the end of the chunks
    tb1 = t1(1);               % bias beginning time
    tb2 = t2(1);               % bias end time
    record = grab_3mdata_chunks('111412',t1,t2,tb1,tb2); 
end

