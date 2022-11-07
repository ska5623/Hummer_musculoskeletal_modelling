% This script is to shift the original wing trajectory obtained from Luo et.
% al. to that of Hedrick at. al, and subseqeuntly obtain the euler angles for the
% shifted wing. 

clear all
load('skeletal_raw_data.mat'); %skeletal marker raw data from Hedrick et. al.
Locwingmesh = zeros(701,3,15);
X = zeros(701,14);
Y = zeros(701,14);
Z = zeros(701,14);

for i = 1:1:701
    Locwingmesh(i,:,:) = reshape(locWing(i,:),3,15); 

    X(i,1:7) = Locwingmesh(i,1,1:7);
    Y(i,1:7) = Locwingmesh(i,2,1:7);
    Z(i,1:7) = Locwingmesh(i,3,1:7);
    X(i,8) = Locwingmesh(i,1,9);
    X(i,9) = Locwingmesh(i,1,10);
    X(i,10) = Locwingmesh(i,1,13);
    X(i,11) = Locwingmesh(i,1,11);
    X(i,12) = Locwingmesh(i,1,12);
    X(i,13) = Locwingmesh(i,1,8);
    X(i,14) = Locwingmesh(i,1,1);
    Y(i,8) = Locwingmesh(i,2,9);
    Y(i,9) = Locwingmesh(i,2,10);
    Y(i,10) = Locwingmesh(i,2,13);
    Y(i,11) = Locwingmesh(i,2,11);
    Y(i,12) = Locwingmesh(i,2,12);
    Y(i,13) = Locwingmesh(i,2,8);
    Y(i,14) = Locwingmesh(i,2,1);
    Z(i,8) = Locwingmesh(i,3,9);
    Z(i,9) = Locwingmesh(i,3,10);
    Z(i,10) = Locwingmesh(i,3,13);
    Z(i,11) = Locwingmesh(i,3,11);
    Z(i,12) = Locwingmesh(i,3,12);
    Z(i,13) = Locwingmesh(i,3,8);
    Z(i,14) = Locwingmesh(i,3,1);
end


Xrot = X;
Yrot = Y;
Zrot = Z;

load('left_wing_raw_CFD_data.mat');  %raw data from Luo et. al.

for i = 1:1:15563  %shifting of origin for both datasets to have common origin
    P  = posl(i,3,:);
    for j = 1:1:615
       posl(i,j,:) = posl(i,j,:) -  P;
    end
end

posl2 = posl;

poslavg = zeros(1445,615,3);
Xrotavg = zeros(25,14);
Yrotavg = zeros(25,14);
Zrotavg = zeros(25,14);
NT1 = 25;
NT2 = 1445;

for i = 1:1:7    %averaging from 7 flapping cycles to a single flapping cycle
     for  j = 1:1:615
        poslavg(:,j,:) =  poslavg(:,j,:) + posl2(781+(i-1)*NT2:780+i*NT2,j,:); 
     end
    Xrotavg = Xrotavg + Xrot(366+(i-1)*NT1:365+i*NT1,:);
    Yrotavg = Yrotavg + Yrot(366+(i-1)*NT1:365+i*NT1,:);
    Zrotavg = Zrotavg + Zrot(366+(i-1)*NT1:365+i*NT1,:);
end

poslfinal = zeros(615,3,100);

for j = 1:1:615   %converting to 100 time instants
   poslfinal(j,1,:) = spline(0:1/1444:1,poslavg(:,j,1),0.01:0.01:1)*1000/7; 
   poslfinal(j,2,:) = spline(0:1/1444:1,poslavg(:,j,2),0.01:0.01:1)*1000/7; 
   poslfinal(j,3,:) = spline(0:1/1444:1,poslavg(:,j,3),0.01:0.01:1)*1000/7; 
end

Xrotfinal = zeros(100,14);
Yrotfinal = zeros(100,14);
Zrotfinal = zeros(100,14);
for i = 1:1:14  %converting to 100 time instants
 Xrotfinal(:,i) = spline(0:1/24:1,Xrotavg(:,i),0.01:0.01:1)/7;
 Yrotfinal(:,i) = spline(0:1/24:1,Yrotavg(:,i),0.01:0.01:1)/7;
 Zrotfinal(:,i) = spline(0:1/24:1,Zrotavg(:,i),0.01:0.01:1)/7;
end

for j = 1:1:615   %changing the coordinate frame from Luo et. al. to Hedrick et. al.
    poslfinal(j,:,:) = [-poslfinal(j,3,:); poslfinal(j,2,:); poslfinal(j,1,:)];
end

for i = 1:1:100  %first rotation
    P1 = zeros(1,3);
    P1(:,:) = poslfinal(613,:,i)/norm(poslfinal(613,:,i));
    tip = [Xrotfinal(i,10)-mean(Xrotfinal(i,3:4)) Yrotfinal(i,10)-mean(Yrotfinal(i,3:4)) Zrotfinal(i,10)-mean(Zrotfinal(i,3:4))]; 
    P2 = tip/norm(tip);
    ang = acos(P1*P2'/(norm(P1)*norm(P2)));
    ax = cross(P1,P2);
    for k = 1:1:615
        P1(:,:) = poslfinal(k,:,i);
        poslfinal(k,:,i) = angleaxisRotation(P1,ax,ang);
    end
end
 
for i = 1:1:100 %second rotation
A1 = zeros(1,3);
A2 = zeros(1,3);
A1(:,:) = [Xrotfinal(i,13)-mean(Xrotfinal(i,3:4)) Yrotfinal(i,13)-mean(Yrotfinal(i,3:4)) Zrotfinal(i,13)-mean(Zrotfinal(i,3:4))];
A2(:,:) = poslfinal(17,:,i) - poslfinal(3,:,i); 
ax = poslfinal(613,:,i) - poslfinal(3,:,i);
[ang, notrequired] = angleFinderLA_v1(A2,A1,ax);
  for k = 1:1:615
        P1(:,:) = poslfinal(k,:,i);
        poslfinal(k,:,i) = angleaxisRotation(P1,ax,ang);
  end
end


%% Euler angle calculation
con = load('connec.dat');
tri = con(:,2:4);          % element connection
Num = 100;                 % num of time step
dt = 1.6063741e-05;
 
p0 = [0 0 0];
p1 = [0 0 -1];
p2 = [0 1 0];

vc1  = p1 - p0;             
ax01  = vc1/norm(vc1);              % pivot to backmost point unit vector
vc2  = p2 - p0;
ax02  = vc2/norm(vc2);              % pivot to frontmost point unit vector
vcn = cross(ax01, ax02);     
eZ = vcn/norm(vcn);  % norm unit vector of the stroke plane, upward

sx = [9 613 51 1 3];         % base - original

wing = [3:17:496 513 528 542 555 567 578 588 597 605 612];
 
for n = 1:100
    tip(1,1:3) = poslfinal(sx(2),1:3,n);
    base(1,1:3) = poslfinal(sx(5),1:3,n);

    p_ax1(1:3) = poslfinal(sx(1),1:3,n);     % base point
    p_ax2(1:3) = poslfinal(sx(2),1:3,n);     % tip point 

    axis1 = p_ax2 - p_ax1;   
    ax = axis1/norm(axis1);            % axis one: long axis
    
    p_ax3(1:3) = poslfinal(sx(3),1:3,n);
    p_ax4(1:3) = poslfinal(sx(4),1:3,n);
    
    axis2 = p_ax4 - p_ax3;
    ax2 = axis2/norm(axis2);           % axis two(temporary): chord axis

    axis3 = cross(ax,ax2);
    az = axis3/norm(axis3);            % axis three: norm axis normal to wing
    ay = cross(az,ax);                 % axis two: chord axis alon the wing chord

    lax = norm(axis1);
    ln = axis1*eZ'; 
    ax_plane = axis1 - ln*eZ; % in the plane

    ang_dev(n) = pi/2 - acos(ln/lax);      % deviation angle

    ax_2 =  ax_plane/norm( ax_plane);
    ay_2 = eZ;
    az_2 = cross(ax_2, ay_2);

    ax_1 = ax;
    az_1 = az_2;
    ay_1 = cross(az_1,ax_1);

    ln = ax01*ax_plane';
    lax_plane = norm(ax_plane);

    ang_stroke(n) = acos(ln/lax_plane);    % stroke angle

    selp = [3 357 603];

    pp1(1:3) = poslfinal(selp(1),:,n);
    pp2(1:3) = poslfinal(selp(2),:,n);
    pp3(1:3) = poslfinal(selp(3),:,n);

    vp12 = pp2 - pp1;
    vp13 = pp3 - pp1;

    az_m = cross(vp13, vp12);

    temp = ay_1*az_m';
    cos_p = temp/norm(ay_1)/norm(az_m);
    ang_pitch_m(n) = acos(cos_p)-pi/2; %pitching angle
end

ang_pitch = ang_pitch_m;
ang_stroke = ang_stroke - pi/2;
   
for n = 1:Num -2
   v_ang_stroke(n) =  (ang_stroke(n+2) -ang_stroke(n))/2/dt;        
   v_ang_dev(n) =     (ang_dev(n+2) - ang_dev(n))/2/dt;            
   v_ang_pitch(n) =   (ang_pitch(n+2) - ang_pitch(n))/2/dt;        
end

for n = 1:Num -4 
    a_ang_stroke(n) = (v_ang_stroke(n+2) -v_ang_stroke(n))/2/dt;  
    a_ang_dev(n) = (v_ang_dev(n+2) -v_ang_dev(n))/2/dt;           
    a_ang_pitch(n) = (v_ang_pitch(n+2) -v_ang_pitch(n))/2/dt;   
end
 
save('shifted_wing_angles.mat','ang_dev','ang_pitch','ang_stroke','v_ang_dev','v_ang_pitch','v_ang_stroke','a_ang_stroke','a_ang_dev','a_ang_pitch');
