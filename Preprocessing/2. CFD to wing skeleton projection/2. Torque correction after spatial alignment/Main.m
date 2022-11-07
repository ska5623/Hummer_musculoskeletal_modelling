%% This code is used for extracting inerital, aerodynamic, and muscle actuation torque for the shifted wing in the Xb-Yb-Zb coordinate frame

clear;

load('muscle_actuation_torque_and_kinematics.mat'); %the kinematics are for right wing in Luo et. al. frame of reference, however, T and Ta are for right wing paper's frame 
load('aerotorque_euler.mat');

Tstroke = zeros(1,12296);
Tpitch = zeros(1,12296);
Tdev = zeros(1,12296);

Tstrokeaero = zeros(1,12296);
Tpitchaero = zeros(1,12296);
Tdevaero = zeros(1,12296);

Torque_G = zeros(3,12300-4);
T_wf = zeros(3,12300-4);
Torque_G_I = zeros(3,12300-4);

for i = 1:1:12300-4
     M = [0 0 1;   %for extracting from euler frame to body-fixed frame
         cos(ang_stroke(1,i)) sin(ang_stroke(1,i)) 0;
         -cos(-ang_dev(1,i))*sin(ang_stroke(1,i)) cos(-ang_dev(1,i))*cos(ang_stroke(1,i)) sin(-ang_dev(1,i))];
     X  = inv(M)*[T(1,i) T(2,i) T(3,i)]';
     Xaero  = inv(M)*[Ta(1,i) Ta(2,i) Ta(3,i)]';
     
     Tdev(1,i) = X(1,1);
     Tpitch(1,i) = X(2,1);
     Tstroke(1,i) = X(3,1);

     Tdevaero(1,i) = Xaero(1,1);
     Tpitchaero(1,i) = Xaero(2,1);
     Tstrokeaero(1,i) = Xaero(3,1);
 
     Torque_G(:,i) = [Tdev(1,i) Tpitch(1,i) Tstroke(1,i)];
     Torque_G_aero(:,i) = [Tdevaero(1,i) Tpitchaero(1,i) Tstrokeaero(1,i)];
     Torque_G_I(:,i) = [(Tdev(1,i)-Tdevaero(1,i)) (Tpitch(1,i)-Tpitchaero(1,i)) (Tstroke(1,i)-Tstrokeaero(1,i))];
  
     RotR = rotz(180*ang_stroke(1,i)/pi)*rotx(-180*ang_dev(1,i)/pi)*roty(-180*ang_pitch(1,i)/pi);
     Twf_f(:,i) = inv(RotR)*Torque_G(:,i);
     T_wf_afinal(:,i) = inv(RotR)*Torque_G_aero(:,i);
     T_wf_ifinal(:,i) = inv(RotR)*Torque_G_I(:,i);
end

 %% averaging the data

index1 = 780;
NT = 1445;
Twf_temp = zeros(3,1445);
Twfa_temp = zeros(3,1445);
Twfi_temp = zeros(3,1445);

 for j = 1:1:7
     Twf_temp(1,:) = Twf_temp(1,:) + Twf_f(1,(j-1)*NT+index1+10:(j)*NT+index1+10-1); 
     Twf_temp(2,:) = Twf_temp(2,:) + Twf_f(2,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
     Twf_temp(3,:) = Twf_temp(3,:) + Twf_f(3,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
   
     Twfa_temp(1,:) = Twfa_temp(1,:) + T_wf_afinal(1,(j-1)*NT+index1+10:(j)*NT+index1+10-1); 
     Twfa_temp(2,:) = Twfa_temp(2,:) + T_wf_afinal(2,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
     Twfa_temp(3,:) = Twfa_temp(3,:) + T_wf_afinal(3,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
     
     Twfi_temp(1,:) = Twfi_temp(1,:) + T_wf_ifinal(1,(j-1)*NT+index1+10:(j)*NT+index1+10-1); 
     Twfi_temp(2,:) = Twfi_temp(2,:) + T_wf_ifinal(2,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
     Twfi_temp(3,:) = Twfi_temp(3,:) + T_wf_ifinal(3,(j-1)*NT+index1+10:(j)*NT+index1+10-1);
 end
 
 Twf_temp =  Twf_temp/7;
 Twfa_temp =  Twfa_temp/7;
 Twfi_temp =  Twfi_temp/7;
 
 %% interpolating from 25 points per flapping cycle to 100 points per flapping cycle

Twf(1,:) = spline(0:1/1444:1,Twf_temp(1,:),0.01:0.01:1);
Twf(2,:) = spline(0:1/1444:1,Twf_temp(2,:),0.01:0.01:1);
Twf(3,:) = spline(0:1/1444:1,Twf_temp(3,:),0.01:0.01:1);

Twf_aero(1,:) = spline(0:1/1444:1,Twfa_temp(1,:),0.01:0.01:1);
Twf_aero(2,:) = spline(0:1/1444:1,Twfa_temp(2,:),0.01:0.01:1);
Twf_aero(3,:) = spline(0:1/1444:1,Twfa_temp(3,:),0.01:0.01:1);

Twf_inertial(1,:) = spline(0:1/1444:1,Twfi_temp(1,:),0.01:0.01:1);
Twf_inertial(2,:) = spline(0:1/1444:1,Twfi_temp(2,:),0.01:0.01:1);
Twf_inertial(3,:) = spline(0:1/1444:1,Twfi_temp(3,:),0.01:0.01:1);

%% To project the torque from the unshifted to shifted wing, and finding the global torque due to the shifted torque
load('shifted_wing_angles'); %angles left wing in our frame

Tgtotal = zeros(3,100);
Tgaero = zeros(3,100);
Tginertial = zeros(3,100);

Twf = [-Twf(1,:); -Twf(2,:); Twf(3,:)]; %conversion to left wing
Twf_aero = [-Twf_aero(1,:); -Twf_aero(2,:); Twf_aero(3,:)];
Twf_inertial = [-Twf_inertial(1,:); -Twf_inertial(2,:); Twf_inertial(3,:)];

for i = 1:1:100
   RotR = rotz(180*ang_stroke(1,i)/pi)*rotx(180*ang_dev(1,i)/pi)*roty(180*ang_pitch(1,i)/pi);
   Tgtotal(:,i) = RotR*Twf(:,i);
   Tgaero(:,i) = RotR*Twf_aero(:,i);
   Tginertial(:,i) = RotR*Twf_inertial(:,i);
   
end
Tstrokeavg_new = Tgtotal(3,:); 
Tdevavg_new = Tgtotal(1,:);
Tpitchavg_new = Tgtotal(2,:);
save('torque_data_wing_corrected_final.mat','Tdevavg_new','Tpitchavg_new','Tstrokeavg_new');

Aerotor_avg = zeros(3,100);
Aerotor_avg(3,:) = Tgaero(3,:); 
Aerotor_avg(2,:) = Tgaero(2,:);
Aerotor_avg(1,:) = Tgaero(1,:);
save('aerotorque_global_shifted.mat','Aerotor_avg');

Inertialtor_avg = zeros(3,100);
Inertialtor_avg(3,:) = Tginertial(3,:);
Inertialtor_avg(2,:) = Tginertial(2,:);
Inertialtor_avg(1,:) = Tginertial(1,:);
save('inertialtorque_global_shifted.mat','Inertialtor_avg');
