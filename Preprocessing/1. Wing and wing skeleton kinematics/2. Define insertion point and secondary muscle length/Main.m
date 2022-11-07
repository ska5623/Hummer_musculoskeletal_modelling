% This script is used for finding the coordinate data of PECT and SUPRA insertion, as well as humerus long axis
% All raw data is found using the humerus CAD file (see supplementary material for details)

Praw = [-0.55 -1.1 1.2];  % Pect insertion upper limit in humerus frame of reference 
Praw2 = [-0.5 -1.1 -1];   % Pect insertion lower limit in humerus frame of reference
Sraw = [0.75 -1.2 1.2];  % Supra insertion in humerus frame of reference
PBraw = [4.67 3.7 8.4571];  % PB in bird's body frame
SBraw = [0 0.85 0];  % SB in bird's body frame
Jraw = [0 0 0]; % sholder joint
Eraw = [-0.37 0.53 -2.2]; % elbow insertion in humerus frame of reference
MHraw = [0 -2 0.75];

ax1raw = [1 0 0]; %axis 1 for CAD file
ax2raw = [0 0 1]; %axis 2 for CAD file
STraw = [0,-4,0]; % humerus end (opposite to shoulder) in humerus frame of reference

STdata = [-2.0754   -1.5456  4.4278]; %canonical position of the end of humerus found using hummerJointKinematicsData.mat

MH1 = zeros(206,3);
MH2 = zeros(206,3);
MH3 = zeros(206,3);

S1 = zeros(206,3);
S2 = zeros(206,3);
S3 = zeros(206,3);

P1 = zeros(206,3);
P2 = zeros(206,3);
P3 = zeros(206,3);

P21 = zeros(206,3);
P22 = zeros(206,3);
P23 = zeros(206,3);

ax31 = zeros(206,3);
ax32 = zeros(206,3);

ax11 = zeros(206,3);
ax12 = zeros(206,3);
ax13 = zeros(206,3);

ax21 = zeros(206,3);
ax22 = zeros(206,3);
ax23 = zeros(206,3);

load shoulderdata.mat; %shoulder rotation angle obtained from Hedrick et. al.
load('skeletal_raw_data.mat');

sholderang1 = sholderang1raw; 
sholderang2 = sholderang2raw; 
sholderang3 = sholderang3raw;
shAxes = shAxesraw;
correctionangle = 110*pi/180; %correction angle of 110 degrees for qualitatively matching the humerus orientation in canonical position and the humerus position after the rotation by angs as shown below, see appendix for details

angs = angleFinder_v3(STraw,STdata,[1 0 0],[0 0 1]);
 [STrot1, ax2a]=do2axRotation_v1(STraw,[1 0 0],[0 0 1],angs);
 [Srot1, ax2a]=do2axRotation_v1(Sraw,[1 0 0],[0 0 1],angs);
 [Prot1, ax2a]=do2axRotation_v1(Praw,[1 0 0],[0 0 1],angs);
 [P2rot1, ax2a]=do2axRotation_v1(Praw2,[1 0 0],[0 0 1],angs);
 [MHrot1, ax2a]=do2axRotation_v1(MHraw,[1 0 0],[0 0 1],angs);
 [ax1rot1, ax2a]=do2axRotation_v1(ax1raw,[1 0 0],[0 0 1],angs);
 [ax2rot1, ax2a]=do2axRotation_v1(ax2raw,[1 0 0],[0 0 1],angs);
 
 Srotatedfinal = angleaxisRotation(Srot1,STrot1,correctionangle);
 Protatedfinal = angleaxisRotation(Prot1,STrot1,correctionangle);
 P2rotatedfinal = angleaxisRotation(P2rot1,STrot1,correctionangle);
 MHrotatedfinal = angleaxisRotation(MHrot1,STrot1,correctionangle);
 ax1rotatedfinal = angleaxisRotation(ax1rot1,STrot1,correctionangle);
 ax2rotatedfinal = angleaxisRotation(ax2rot1,STrot1,correctionangle);

%% conversion to frame of reference in Hedrick et. al.

P = [-Protatedfinal(1,3) Protatedfinal(1,2) Protatedfinal(1,1)];
Pect2 = [-P2rotatedfinal(1,3) P2rotatedfinal(1,2) P2rotatedfinal(1,1)];
S = [-Srotatedfinal(1,3) Srotatedfinal(1,2) Srotatedfinal(1,1)];
ax1 = [-ax1rotatedfinal(1,3) ax1rotatedfinal(1,2) ax1rotatedfinal(1,1)];
ax2 = [-ax2rotatedfinal(1,3) ax2rotatedfinal(1,2) ax2rotatedfinal(1,1)];
PB = [-PBraw(1,3) PBraw(1,2) PBraw(1,1)];
SB = [-SBraw(1,3) SBraw(1,2) SBraw(1,1)];
J = [-Jraw(1,3) Jraw(1,2) Jraw(1,1)];
ST = [-STrot1(1,3) STrot1(1,2) STrot1(1,1)];
E = [-Eraw(1,3) Eraw(1,2) Eraw(1,1)];
MH = [-MHrotatedfinal(1,3) MHrotatedfinal(1,2) MHrotatedfinal(1,1)];

wrtoskel = zeros(1,206);

wrist = zeros(206,3);
elbow = zeros(206,3);

for i=1:1:206 %i = 1 corresponds to i = 360 in the 701 length coordinate data from hedrick et. al.

    wrtoskel(1,i) = norm(E - (wristCent(i+359,:)+jcnt(i+359,:))/2);
    
    P1(i,:) = angleaxisRotation(P,shAxes(i,1:3),sholderang1(i,1));
    P2(i,:) = angleaxisRotation(P1(i,:),shAxes(i,4:6),sholderang2(i,1));
    P21(i,:) = angleaxisRotation(Pect2,shAxes(i,1:3),sholderang1(i,1));
    P22(i,:) = angleaxisRotation(P21(i,:),shAxes(i,4:6),sholderang2(i,1));

    wrist(i,:) = wristCent(i+359,:);
    elbow(i,:) = jcnt(i+359,:);

    ax31(i,:) = angleaxisRotation((ST-J)./norm(ST-J),shAxes(i,1:3),sholderang1(i,1));
    ax32(i,:) = angleaxisRotation(ax31(i,:),shAxes(i,4:6),sholderang2(i,1));
    
    P3(i,:) = angleaxisRotation(P2(i,:),ax32(i,:),sholderang3(i,1));   
    P23(i,:) = angleaxisRotation(P22(i,:),ax32(i,:),sholderang3(i,1));   
    S1(i,:) = angleaxisRotation(S,shAxes(i,1:3),sholderang1(i,1));
    S2(i,:) = angleaxisRotation(S1(i,:),shAxes(i,4:6),sholderang2(i,1));
    S3(i,:) = angleaxisRotation(S2(i,:),ax32(i,:),sholderang3(i,1));
    
    ax11(i,:) = angleaxisRotation(ax1,shAxes(i,1:3),sholderang1(i,1));
    ax12(i,:) = angleaxisRotation(ax11(i,:),shAxes(i,4:6),sholderang2(i,1));
    ax13(i,:) = angleaxisRotation(ax12(i,:),ax32(i,:),sholderang3(i,1));

    ax21(i,:) = angleaxisRotation(ax2,shAxes(i,1:3),sholderang1(i,1));
    ax22(i,:) = angleaxisRotation(ax21(i,:),shAxes(i,4:6),sholderang2(i,1));
    ax23(i,:) = angleaxisRotation(ax22(i,:),ax32(i,:),sholderang3(i,1));
    
    MH1(i,:) = angleaxisRotation(MH,shAxes(i,1:3),sholderang1(i,1));
    MH2(i,:) = angleaxisRotation(MH1(i,:),shAxes(i,4:6),sholderang2(i,1));
    MH3(i,:) = angleaxisRotation(MH2(i,:),ax32(i,:),sholderang3(i,1));
end

%% back to paper's frame of reference

P3final = [P3(:,3) P3(:,2) -P3(:,1)];
P23final = [P23(:,3) P23(:,2) -P23(:,1)];
S3final = [S3(:,3) S3(:,2) -S3(:,1)];
MH3final = [MH3(:,3) MH3(:,2) -MH3(:,1)];
ax32final = [ax32(:,3) ax32(:,2) -ax32(:,1)];
ax1final = [ax13(:,3) ax13(:,2) -ax13(:,1)];
ax2final = [ax23(:,3) ax23(:,2) -ax23(:,1)];
wristfinal = [wrist(:,3) wrist(:,2) -wrist(:,1)];
elbowfinal = [elbow(:,3) elbow(:,2) -elbow(:,1)];

Wavg = zeros(25,3);
Pavg = zeros(25,3);
P2avg = zeros(25,3);
Savg = zeros(25,3);
MHavg = zeros(25,3);
ax3avg = zeros(25,3);
ax1avg = zeros(25,3);
ax2avg = zeros(25,3);
wristavg = zeros(25,3);
elbowavg = zeros(25,3);
sholderang1avg = zeros(25,1);
sholderang2avg = zeros(25,1);
sholderang3avg = zeros(25,1);
wristlength = zeros(1,25);

%% averaging for 7 flapping cycles, starting from the beginning of upstroke. Each flapping cycle is 25 points
for k = 1:1:7
    Wavg = Wavg + W3final(6+25*(k-1)+1:6+25*k,:);
    Pavg = Pavg + P3final(6+25*(k-1)+1:6+25*k,:);
    P2avg = P2avg + P23final(6+25*(k-1)+1:6+25*k,:);
    Savg = Savg + S3final(6+25*(k-1)+1:6+25*k,:);
    wristavg = wristavg + wristfinal(6+25*(k-1)+1:6+25*k,:);
    elbowavg = elbowavg + elbowfinal(6+25*(k-1)+1:6+25*k,:);
    sholderang1avg = sholderang1avg + sholderang1(6+25*(k-1)+1:6+25*k,1);
    sholderang2avg = sholderang2avg + sholderang2(6+25*(k-1)+1:6+25*k,1);
    sholderang3avg = sholderang3avg + sholderang3(6+25*(k-1)+1:6+25*k,1);
    MHavg = MHavg + MH3final(6+25*(k-1)+1:6+25*k,:);
    wristlength = wristlength + wrtoskel(1,6+25*(k-1)+1:6+25*k);
    ax1avg = ax1avg + ax1final(6+25*(k-1)+1:6+25*k,:);
    ax2avg = ax2avg + ax2final(6+25*(k-1)+1:6+25*k,:);
    ax3avg = ax3avg + norm(STraw-Jraw).*ax32final(6+25*(k-1)+1:6+25*k,:);
end

wristavg = wristavg/7;
elbowavg = elbowavg/7;
Wavg = Wavg/7;
Pavg = Pavg/7;
P2avg = P2avg/7;
Savg = Savg/7;
MHavg = MHavg/7;
ax3avg = ax3avg/7;
ax1avg = ax1avg/7;
ax2avg = ax2avg/7;
sholderang1avg = sholderang1avg/7;
sholderang2avg = sholderang2avg/7;
sholderang3avg = sholderang3avg/7;
wristlength = wristlength/7;
wristlength = wristlength - mean(wristlength);

%% Interpolation from 25 points to 100 points
shax1final = zeros(100,3);
shax2final = zeros(100,3);

Pfinal = zeros(100,3);
P2final = zeros(100,3);
Sfinal = zeros(100,3);
MHfinal = zeros(100,3);

ax1final = zeros(100,3);
ax2final = zeros(100,3);
ax3final = zeros(100,3);

wlfinal = zeros(100,1);

sholderang1final = zeros(100,1);
sholderang2final = zeros(100,1);
sholderang3final = zeros(100,1);

wristfinal = zeros(100,3);
elbowfinal = zeros(100,3);

wlfinal(:,1) = spline(0:1/24:1,wristlength,0.01:0.01:1);

sholderang1final(:,1) = spline(0:1/24:1,sholderang1avg,0.01:0.01:1);
sholderang2final(:,1) = spline(0:1/24:1,sholderang2avg,0.01:0.01:1);
sholderang3final(:,1) = spline(0:1/24:1,sholderang3avg,0.01:0.01:1);

wristfinal(:,1) = spline(0:1/24:1,wristavg(:,1),0.01:0.01:1);
wristfinal(:,2) = spline(0:1/24:1,wristavg(:,2),0.01:0.01:1);
wristfinal(:,3) = spline(0:1/24:1,wristavg(:,3),0.01:0.01:1);

elbowfinal(:,1) = spline(0:1/24:1,elbowavg(:,1),0.01:0.01:1);
elbowfinal(:,2) = spline(0:1/24:1,elbowavg(:,2),0.01:0.01:1);
elbowfinal(:,3) = spline(0:1/24:1,elbowavg(:,3),0.01:0.01:1);

Pfinal(:,1) = spline(0:1/24:1,Pavg(:,1),0.01:0.01:1);
Pfinal(:,2) = spline(0:1/24:1,Pavg(:,2),0.01:0.01:1);
Pfinal(:,3) = spline(0:1/24:1,Pavg(:,3),0.01:0.01:1);

P2final(:,1) = spline(0:1/24:1,P2avg(:,1),0.01:0.01:1);
P2final(:,2) = spline(0:1/24:1,P2avg(:,2),0.01:0.01:1);
P2final(:,3) = spline(0:1/24:1,P2avg(:,3),0.01:0.01:1);

Sfinal(:,1) = spline(0:1/24:1,Savg(:,1),0.01:0.01:1);
Sfinal(:,2) = spline(0:1/24:1,Savg(:,2),0.01:0.01:1);
Sfinal(:,3) = spline(0:1/24:1,Savg(:,3),0.01:0.01:1);

MHfinal(:,1) = spline(0:1/24:1,MHavg(:,1),0.01:0.01:1);
MHfinal(:,2) = spline(0:1/24:1,MHavg(:,2),0.01:0.01:1);
MHfinal(:,3) = spline(0:1/24:1,MHavg(:,3),0.01:0.01:1);

ax1final(:,1) = spline(0:1/24:1,ax1avg(:,1),0.01:0.01:1);
ax1final(:,2) = spline(0:1/24:1,ax1avg(:,2),0.01:0.01:1);
ax1final(:,3) = spline(0:1/24:1,ax1avg(:,3),0.01:0.01:1);

ax2final(:,1) = spline(0:1/24:1,ax2avg(:,1),0.01:0.01:1);
ax2final(:,2) = spline(0:1/24:1,ax2avg(:,2),0.01:0.01:1);
ax2final(:,3) = spline(0:1/24:1,ax2avg(:,3),0.01:0.01:1);

ax3final(:,1) = spline(0:1/24:1,ax3avg(:,1),0.01:0.01:1);
ax3final(:,2) = spline(0:1/24:1,ax3avg(:,2),0.01:0.01:1);
ax3final(:,3) = spline(0:1/24:1,ax3avg(:,3),0.01:0.01:1);

sholderang3avg = zeros(25,1);

for k = 1:1:7
    sholderang3avg = sholderang3avg + sholderang3raw(6+25*(k-1)+1:6+25*k,1);
end

sholderang3avg = sholderang3avg/7;
sholderang3final(:,1) = spline(0:1/24:1,sholderang3avg,0.01:0.01:1);
MHlength = sholderang3final';

save('MHlength.mat','MHlength');
save('wristlength.mat','wlfinal');
save('insertion_and_axisdata.mat','P2final','Pfinal','Sfinal','ax3final');
