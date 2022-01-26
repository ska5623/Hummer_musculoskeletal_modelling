%% This code for obtaining the total work done by the muscle actuation torque

bfvel2 = zeros(3,100);
load('skeletal_axis_data_wrist.mat') 
load torque_data_wing_corrected_final.mat
dt = 1/43.08/100;

for i = 1:1:100
    RotR = rotz((180*wfanglefinal(3,i))/pi)*rotx((180*wfanglefinal(1,i))/pi)*roty((180*wfanglefinal(2,i))/pi);    
    bfvel2(:,i) = RotR*wfvelfinal(:,i);
end

Work3 = zeros(3,100);
Worktotal = zeros(1,100);
dt = 1/43.08/100;

for i = 2:1:100
    Work3(1,i) = Work3(1,i-1) + 0.5*(bfvel2(1,i)+bfvel2(1,i-1))*dt*(Tdevavg_new(1,i-1)+Tdevavg_new(1,i))*0.5;
    Work3(2,i) = Work3(2,i-1) + 0.5*(bfvel2(2,i)+bfvel2(2,i-1))*dt*(Tpitchavg_new(1,i-1)+Tpitchavg_new(1,i))*0.5;
    Work3(3,i) = Work3(3,i-1) + 0.5*(bfvel2(3,i)+bfvel2(3,i-1))*dt*(Tstrokeavg_new(1,i-1)+Tstrokeavg_new(1,i))*0.5;
    Worktotal(1,i) = Work3(1,i) + Work3(2,i) + Work3(3,i);
end

save('global_work_wrist.mat','Work3','Worktotal','bfvel2'); %change to global_work_elbow.mat for elbow skeletal data