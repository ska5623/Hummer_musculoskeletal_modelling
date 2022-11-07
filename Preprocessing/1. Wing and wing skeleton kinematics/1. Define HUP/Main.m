% This script is to extract the information of skeleton angles, and the
% stroke, deviation, and pitching angles for HUP.
% the coordinates are in the frame of reference of data from Hedrick et. al..
% the wfangle are the euler angles for left wing skeleton, no direction corrections required

load('skeletal_raw_data.mat');  %load raw skeletal data

%% define the stroke plane
p0 = [0 0 0]; 
p1 = [0 0 -1];
p2 = [0 1 0];

vc1  = p1 - p0;             
ax01  = vc1/norm(vc1);              

vc2  = p2 - p0;
ax02  = vc2/norm(vc2);              

vcn = cross(ax01, ax02);     
eZ = vcn/norm(vcn);  % norm unit vector of the stroke plane

%% define HUP long, perpendicular, and chord axes, and estimate euler angles, velocities, and accelerations
skllong = zeros(3,206);
sklppl = zeros(3,206);
skeletalchord = zeros(3,206);

wfangle = zeros(3,206);
manuscent=locWing(:,3*7-2:3*7);  %manus center
secfeather = zeros(3,206);  %secondary feather location

for i = 360:1:565
  secfeather(:,i-359) = locWing(i,22:24); 
  skllong(:,i-359) = wristCent(i,:)'./norm(wristCent(i,:));
  sklppl(:,i-359) = (cross(jcnt(i,:)'./norm(jcnt(i,:)),wristCent(i,:)'./norm(wristCent(i,:))))';
  sklppl(:,i-359) = sklppl(:,i-359)/norm(sklppl(:,i-359));
  skeletalchord(:,i-359) = (cross(skllong(:,i-359)',sklppl(:,i-359)'))';
  skeletalchord(:,i-359) = skeletalchord(:,i-359)/norm(skeletalchord(:,i-359));
  
  % uncomment the following and comment the same above for elbowcentered, change the name of the file to be saved at the end to 'skeletal_axis_data_wrist.mat'
%   skllong(:,i-359) = jcnt(i,:)'./norm(jcnt(i,:));
%   sklppl(:,i-359) = (cross(jcnt(i,:)'./norm(jcnt(i,:)),wristCent(i,:)'./norm(wristCent(i,:))))';
%   sklppl(:,i-359) = sklppl(:,i-359)/norm(sklppl(:,i-359));
%   skeletalchord(:,i-359) = (cross(skllong(:,i-359)',sklppl(:,i-359)'))';
%   skeletalchord(:,i-359) = skeletalchord(:,i-359)/norm(skeletalchord(:,i-359));

  wfangle(1,i-359) = pi/2 - acos(skllong(:,i-359)'*eZ'/norm(skllong(:,i-359)));  %deviation
  ax = skllong(:,i-359); % 3*1
  ax_1 = ax; % 3*1
  ax_plane = skllong(:,i-359) - (skllong(:,i-359)'*eZ')*eZ'; % 3*1
  ax_2 =  ax_plane/norm(ax_plane); % 3*1
  ay_2 = eZ'; % 3*1
  az_2 = (cross(ax_2', ay_2'))'; % 3*1
  az_1 = az_2; % 3*1
  ay_1 = (cross(az_1',ax_1'))'; % 3*1
  
  temp = ay_1'*sklppl(:,i-359);
  cos_p = temp/norm(ay_1)/norm(sklppl(:,i-359));
  wfangle(2,i-359) = pi/2 - acos(cos_p);    %pitching
  wfangle(3,i-359) = acos(ax01*ax_plane/norm(ax_plane)) - pi/2; %stroke
end

revvel = zeros(3,204);
dt = 1/43.08/25;
for n = 1:1:204
   revvel(1,n) =  (wfangle(1,n+2) - wfangle(1,n))/2/dt;       
   revvel(2,n) =     (wfangle(2,n+2) - wfangle(2,n))/2/dt;           
   revvel(3,n) =   (wfangle(3,n+2) - wfangle(3,n))/2/dt;        
end
revaccel = zeros(3,204);
dt = 1/43.08/25;

for n = 1:1:202
   revaccel(1,n) =  (revvel(1,n+2) - revvel(1,n))/2/dt;      
   revaccel(2,n) =     (revvel(2,n+2) - revvel(2,n))/2/dt;         
   revaccel(3,n) =   (revvel(3,n+2) - revvel(3,n))/2/dt;       
end


NN = 204;
wfvel = zeros(3,204);

%% coordinate transformation to frame of reference in Luo et. al.

vstroke = (revvel(3,:)); %left wing to right wing and then transformation to that coordinate frame
vpitch = -(-revvel(2,:)); 
vdev = -(-revvel(1,:));
angstroke = (wfangle(3,:));
angpitch = -(-wfangle(2,:));
angdev = -(-wfangle(1,:));

%% estimate wing fixed velocity
omg_1 = vpitch(1:NN) + vstroke(1:NN).*sin(angdev(1:NN));
omg_2 = vstroke(1:NN).*cos(angpitch(1:NN)).*cos(angdev(1:NN)) ...
        + vdev(1:NN).*sin(angpitch(1:NN)); 
omg_3 = vdev(1:NN).*cos(angpitch(1:NN)) ...
        - vstroke(1:NN).*sin(angpitch(1:NN).*cos(angdev(1:NN)));  

%% coordinate frame transformation to the paper's frame of reference (for wingfixed velocity only)
    %back to paper's coordinate frame for right wing
wfvel(1,:) = -omg_3;    
wfvel(2,:) = -omg_1;
wfvel(3,:) =  omg_2;
    %back to left wing
 wfvel(1,:) = -wfvel(1,:);
 wfvel(2,:) = -wfvel(2,:);
    
%% averaging from 7 flapping cycles to a single flapping cycle

skllongavg = zeros(3,25);
sklpplavg = zeros(3,25);
skeletalchordavg = zeros(3,25);
jcntavg = zeros(3,25);
wfangleavg = zeros(3,25);
wfvelavg = zeros(3,25);
revvelavg = zeros(3,25);
revaccelavg = zeros(3,25);
secfavg = zeros(3,25);
for k = 1:1:7 
    secfavg = secfavg + secfeather(:,6+25*(k-1)+1:6+25*k);
    skllongavg = skllongavg + skllong(:,6+25*(k-1)+1:6+25*k);
    sklpplavg = sklpplavg + sklppl(:,6+25*(k-1)+1:6+25*k);
    skeletalchordavg = skeletalchordavg +skeletalchord(:,6+25*(k-1)+1:6+25*k);
    jcntavg = jcntavg + jcnt(359+6+25*(k-1)+1:359+6+25*k,:)';
    wfangleavg = wfangleavg + wfangle(:,6+25*(k-1)+1:6+25*k);
    wfvelavg = wfvelavg + wfvel(:,6+25*(k-1)+1:6+25*k);
    revvelavg = revvelavg + revvel(:,6+25*(k-1)+1:6+25*k);
    revaccelavg = revaccelavg + revaccel(:,6+25*(k-1)+1:6+25*k);
end
secfavg = secfavg/7;
wfangleavg = wfangleavg/7;
wfvelavg = wfvelavg/7;
revvelavg = revvelavg/7;
revaccelavg = revaccelavg/7;
skllongavg = skllongavg/7;
sklpplavg = sklpplavg/7;
skeletalchordavg = skeletalchordavg/7;
jcntavg = jcntavg/7;

wfanglefinal = zeros(3,100);
wfvelfinal = zeros(3,100);
revvelfinal = zeros(3,100);
revaccelfinal = zeros(3,100);
skllongfinal = zeros(3,100);
sklpplfinal = zeros(3,100);
skeletalchordfinal = zeros(3,100);
jcntfinal = zeros(3,100);
secffinal = zeros(3,100);

%% Interpolation from 25 points per flapping cycle to 100 points per flapping cycle, and coordinate frame transformation to the paper's frame of reference
skllongfinal(1,:) = spline(0:1/24:1,skllongavg(3,:),0.01:0.01:1);
skllongfinal(2,:) = spline(0:1/24:1,skllongavg(2,:),0.01:0.01:1);
skllongfinal(3,:) = -spline(0:1/24:1,skllongavg(1,:),0.01:0.01:1);
sklpplfinal(1,:) = spline(0:1/24:1,sklpplavg(3,:),0.01:0.01:1);
sklpplfinal(2,:) = spline(0:1/24:1,sklpplavg(2,:),0.01:0.01:1);
sklpplfinal(3,:) = -spline(0:1/24:1,sklpplavg(1,:),0.01:0.01:1);
skeletalchordfinal(1,:) = spline(0:1/24:1,skeletalchordavg(3,:),0.01:0.01:1);
skeletalchordfinal(2,:) = spline(0:1/24:1,skeletalchordavg(2,:),0.01:0.01:1);
skeletalchordfinal(3,:) = -spline(0:1/24:1,skeletalchordavg(1,:),0.01:0.01:1);
secffinal(1,:) = spline(0:1/24:1,secfavg(3,:),0.01:0.01:1);
secffinal(2,:) = spline(0:1/24:1,secfavg(2,:),0.01:0.01:1);
secffinal(3,:) = -spline(0:1/24:1,secfavg(1,:),0.01:0.01:1);

jcntfinal(1,:) = spline(0:1/24:1,jcntavg(3,:),0.01:0.01:1);
jcntfinal(2,:) = spline(0:1/24:1,jcntavg(2,:),0.01:0.01:1);
jcntfinal(3,:) = -spline(0:1/24:1,jcntavg(1,:),0.01:0.01:1);
wfanglefinal(1,:) = spline(0:1/24:1,wfangleavg(1,:),0.01:0.01:1);
wfanglefinal(2,:) = spline(0:1/24:1,wfangleavg(2,:),0.01:0.01:1);
wfanglefinal(3,:) = spline(0:1/24:1,wfangleavg(3,:),0.01:0.01:1);
wfvelfinal(1,:) = spline(0:1/24:1,wfvelavg(1,:),0.01:0.01:1);
wfvelfinal(2,:) = spline(0:1/24:1,wfvelavg(2,:),0.01:0.01:1);
wfvelfinal(3,:) = spline(0:1/24:1,wfvelavg(3,:),0.01:0.01:1);
revvelfinal(1,:) = spline(0:1/24:1,revvelavg(1,:),0.01:0.01:1);
revvelfinal(2,:) = spline(0:1/24:1,revvelavg(2,:),0.01:0.01:1);
revvelfinal(3,:) = spline(0:1/24:1,revvelavg(3,:),0.01:0.01:1);
revaccelfinal(1,:) = spline(0:1/24:1,revaccelavg(1,:),0.01:0.01:1);
revaccelfinal(2,:) = spline(0:1/24:1,revaccelavg(2,:),0.01:0.01:1);
revaccelfinal(3,:) = spline(0:1/24:1,revaccelavg(3,:),0.01:0.01:1);

save('skeletal_axis_data_wrist.mat','revvelfinal','skllongfinal','skeletalchordfinal','sklpplfinal','wfanglefinal','wfvelfinal'); %replace skeletal_axis_data_wrist.mat with skeletal_axis_data_elbow.mat for elbow-centered data

