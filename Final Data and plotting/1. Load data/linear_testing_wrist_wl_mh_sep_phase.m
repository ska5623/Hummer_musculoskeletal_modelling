paramu = paramu12;
load insertion_and_axisdata.mat
load('torque_data_wing_corrected_final.mat');
load skeletal_axis_data_wrist.mat
load wristlength.mat
load MHlength.mat
load global_work_wrist.mat

NT = 100;
PB = [4.67 3.7 8.4571]; 
SB = [0 0.85 0];

k1p = paramu(1,1)*0.001;
k1s = paramu(1,2)*0.001;
k2p = paramu(1,3)*0.001;
k2s = paramu(1,4)*0.001;
s1 = paramu(1,5);
sf = paramu(1,6);
s2 = sf*s1;
if s2 > 10
    s2 = 10;
end
phi = paramu(1,7);
startangle = paramu(1,8); %in degree
endangle = paramu(1,9); %in degree
startpoint = paramu(1,10);
endpoint = paramu(1,11);
startanglep1 = paramu(1,12); %in degree
endanglep1 = paramu(1,13); %in degree
startanglep2 = paramu(1,14); %in degree
endanglep2 = paramu(1,15); %in degree

p1d = paramu(1,16);
s1d = paramu(1,17);
s2d = paramu(1,18);
meand = paramu(1,19);
pshiftd = paramu(1,20);
sshiftd = paramu(1,21);
p1p = paramu(1,22);
s1p = paramu(1,23);
s2p = paramu(1,24);
meanp = paramu(1,25);
pshiftp = paramu(1,26);
sshiftp = paramu(1,27);
ofpf = paramu(1,28);
ofsf = paramu(1,29);
PBx = paramu(1,30);
PBy = paramu(1,31);
SBx = paramu(1,32);
SBz = paramu(1,33);
phid = paramu(1,34);
phip = paramu(1,35);
dpsign = paramu(1,36);
dnsign = paramu(1,37);
ppsign = paramu(1,38);
pnsign = paramu(1,39);

PB(1,1) = PB(1,1) + PBx;
PB(1,2) = PB(1,2) + PBy;
SB(1,1) = SB(1,1) + SBx;
SB(1,3) = SB(1,3) + SBz;

dang = (startangle - endangle)/50;
currang = zeros(100,1);
currang(1,1) = startangle;

dangpoint = (startpoint - endpoint)/50;
currpoint = zeros(100,1);
currpoint(1,1) = startpoint;

dangp1 = (startanglep1 - endanglep1)/50; %z
currangp1 = zeros(100,1);
currangp1(1,1) = startanglep1;

dangp2 = (startanglep2 - endanglep2)/50; %y
currangp2 = zeros(100,1);
currangp2(1,1) = startanglep2;

for i = 2:1:50
   currang(i,1) = currang(i-1,1) - dang; 
   currpoint(i,1) = currpoint(i-1,1) - dangpoint; 
   currangp1(i,1) = currangp1(i-1,1) - dangp1; 
   currangp2(i,1) = currangp2(i-1,1) - dangp2; 
end
for i = 51:1:100
   currang(i,1) = currang(i-1,1) + dang; 
   currpoint(i,1) = currpoint(i-1,1) + dangpoint; 
   currangp1(i,1) = currangp1(i-1,1) + dangp1; 
   currangp2(i,1) = currangp2(i-1,1) + dangp2; 
end

%pect and supr
 [Fcpgpos, Fcpgneg] = CPGforce_no_comp(s1,s2,phi,0.5);
      %deviation
 [Fcpgposd, Fcpgnegd] = CPGforce(s1d,s2d,pshiftd,sshiftd,phid,0.5);
      %pitch
 [Fcpgposp, Fcpgnegp] = CPGforce(s1p,s2p,pshiftp,sshiftp,phip,0);

 if dpsign <0.5
    Fcpgposd = -Fcpgposd;
 end
 
 if dnsign <0.5
    Fcpgnegd = -Fcpgnegd;  
 end
 
 if ppsign <0.5
    Fcpgposp = -Fcpgposp;  
 end
 
 if pnsign <0.5
    Fcpgnegp = -Fcpgnegp;  
 end
 
pectF = zeros(1,NT);
supF = zeros(1,NT);
torquepect = zeros(NT,3);
torquesup = zeros(NT,3);
torquedev = zeros(NT,3);
torquepitch = zeros(NT,3);
Torquefinal = zeros(NT,3);
pectlength = zeros(NT,1);
suplength = zeros(NT,1);
correctedpectdir = zeros(NT,3);
pectpoint = zeros(NT,3);
pectang = zeros(NT,1);

for r = 1:1:NT
       pectpoint(r,:) = P2final(r,:) + currpoint(r,1)*(Pfinal(r,:) - P2final(r,:));
       correctedpectdir(r,:) = angleaxisRotation(PB-pectpoint(r,:),[0 0 1],-1*currangp1(r,1)*pi/180);
       correctedpectdir(r,:) = angleaxisRotation(correctedpectdir(r,:),[0 1 0],currangp2(r,1)*pi/180);
       pectang(r,1) = acos((correctedpectdir(r,:))*(PB-pectpoint(r,:))'/(norm(PB-pectpoint(r,:))*norm(correctedpectdir(r,:)))); 

       if pectang(r,1) == 0
           pectang(r,1) = 0.01;
       end
       if currang(r,1) == 0
           currang(r,1) = 0.01;
       end
       pectlength(r,1) = pectang(r,1)*norm(PB-pectpoint(r,:))/sin(pectang(r,1)); 
       suplength(r,1) = currang(r,1)*pi*norm(SB-Sfinal(r,:))/(180*sin(currang(r,1)*pi/180)); 
end

pectlength = smooth(pectlength,10);
suplength = smooth(suplength,10);

ofp = min(pectlength)+ofpf;
ofs = min(suplength)+ofsf;

torquepectact = zeros(NT,3);
torquesupact = zeros(NT,3);
torquedevact = zeros(NT,3);
torquepitchact = zeros(NT,3);

for r = 1:1:NT
         pectF(1,r) = -1*(k1p*k2p/(k1p+k2p))*(pectlength(r,1)-ofp) - (k1p/(k1p+k2p))*Fcpgpos(1,r)/2500;
         supF(1,r) = -1*(k1s*k2s/(k1s+k2s))*(suplength(r,1)-ofs)  - (k1s/(k1s+k2s))*Fcpgneg(1,r)/2500;
         torquedev(r,:) = ((p1d)*wlfinal(r,1) + meand + Fcpgposd(1,r)/2500 + Fcpgnegd(1,r)/2500)*sklpplfinal(:,r)';
         torquepitch(r,:) = ((p1p)*MHlength(1,r) + meanp + Fcpgposp(1,r)/2500 + Fcpgnegp(1,r)/2500)*(-skllongfinal(:,r)');
         correctedsupradir = angleaxisRotation(SB-Sfinal(r,:),cross([-1 0 0],SB-Sfinal(r,:)),-1*currang(r,1)*pi/180);
         torquesup(r,:) = cross(Sfinal(r,:),-supF(1,r).*(correctedsupradir)./norm(correctedsupradir));
         torquepect(r,:) = cross(pectpoint(r,:),-pectF(1,r).*(correctedpectdir(r,:))./norm(correctedpectdir(r,:)));
         Torquefinal(r,:) = torquepect(r,:) + torquesup(r,:)+torquedev(r,:)+torquepitch(r,:); 
         torquesupact(r,:) = cross(Sfinal(r,:),(Fcpgneg(1,r)/2500).*(correctedsupradir)./norm(correctedsupradir));
         torquepectact(r,:) = cross(pectpoint(r,:),(Fcpgpos(1,r)/2500).*(correctedpectdir(r,:))./norm(correctedpectdir(r,:)));
         torquedevact(r,:) = (Fcpgposd(1,r)/2500 + Fcpgnegd(1,r)/2500)*sklpplfinal(:,r)';
         torquepitchact(r,:) = (Fcpgposp(1,r)/2500 + Fcpgnegp(1,r)/2500)*(-skllongfinal(:,r)');
end

workpect = zeros(100,1);
worksup = zeros(100,1);
workother = zeros(100,1);
Work3 = zeros(100,3);
worktotal = zeros(100,1);
dt = 1/43.08/100;

for i = 2:1:100
    workpect(i,1) = workpect(i-1,1) + (pectlength(i-1,1) - pectlength(i,1))*(-pectF(1,i)-pectF(1,i-1))*0.5; 
    worksup(i,1) = worksup(i-1,1) + (suplength(i-1,1) - suplength(i,1))*(-supF(1,i)-supF(1,i-1))*0.5; 
    Work3(i,1) = Work3(i-1,1) + 0.5*(bfvel2(1,i)+bfvel2(1,i-1))*dt*(Torquefinal(i-1,1)+Torquefinal(i,1))*0.5;
    Work3(i,2) = Work3(i-1,2) + 0.5*(bfvel2(2,i)+bfvel2(2,i-1))*dt*(Torquefinal(i-1,2)+Torquefinal(i,2))*0.5;
    Work3(i,3) = Work3(i-1,3) + 0.5*(bfvel2(3,i)+bfvel2(3,i-1))*dt*(Torquefinal(i-1,3)+Torquefinal(i,3))*0.5;
    worktotal(i,1) = Work3(i,1) + Work3(i,2) + Work3(i,3);
    workother(i,1) = worktotal(i,1) - workpect(i,1) - worksup(i,1); 
end

xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500; 
workpectCPG = zeros(100,1);
worksupCPG = zeros(100,1);

dt = 1/(43.08*100);
powerpect = zeros(99,1);
powersup = zeros(99,1);
powerother = zeros(99,1);

powerpectCPG = zeros(99,1);
powersupCPG = zeros(99,1);

for i = 2:1:100
      workpectCPG(i,1) = workpectCPG(i-1,1) + ((pectlength(i-1,1) - xp(i-1,1)) - (pectlength(i,1)- xp(i,1)))*0.5*(Fcpgpos(1,i)/2500+Fcpgpos(1,i-1)/2500); 
      worksupCPG(i,1) = worksupCPG(i-1,1) + ((suplength(i-1,1)-xs(i-1,1)) - (suplength(i,1)-xs(i,1)))*0.5*(Fcpgneg(1,i)/2500+Fcpgneg(1,i-1)/2500); 
      
      powerpectCPG(i,1) = (workpectCPG(i,1) - workpectCPG(i-1,1))/dt; 
      powersupCPG(i,1) = (worksupCPG(i,1) - worksupCPG(i-1,1))/dt; 
   
      powerpect(i,1) = (workpect(i,1) - workpect(i-1,1))/dt; 
      powersup(i,1) = (worksup(i,1) - worksup(i-1,1))/dt; 
      powerother(i,1) = (workother(i,1) - workother(i-1,1))/dt; 
end

powerpect = smooth(powerpect,10);
powerother = smooth(powerother,10);
powerpectCPG = smooth(powerpectCPG,10);

      Torqueeuler = zeros(100,3);     
      Torquepacteuler = zeros(100,3);    
      Torquesacteuler = zeros(100,3);    
      Torquedevacteuler = zeros(100,3);    
      Torquepitchacteuler = zeros(100,3);    
      
      Torquepecteuler = zeros(100,3);    
      Torquesupeuler = zeros(100,3);    
      Torquedeveuler = zeros(100,3);    
      Torquepitcheuler = zeros(100,3);    
      
      Torquefinaleuler = zeros(100,3);    
      torquepectacteuler = zeros(100,3);    
      torquesupacteuler = zeros(100,3);    
      torquedevacteuler = zeros(100,3);    
      torquepitchacteuler = zeros(100,3);    
      
      torquepecteuler = zeros(100,3);    
      torquesupeuler = zeros(100,3);    
      torquedeveuler = zeros(100,3);    
      torquepitcheuler  = zeros(100,3);    

for i = 1:1:100
      M = [0 0 1; 
          cos(wfanglefinal(3,i)) sin(wfanglefinal(3,i)) 0;
         -cos(wfanglefinal(1,i))*sin(wfanglefinal(3,i)) cos(wfanglefinal(1,i))*cos(wfanglefinal(3,i)) sin(wfanglefinal(1,i))];
 
      Torqueeuler(i,:) = M*[Torquefinal(i,1) Torquefinal(i,2) Torquefinal(i,3)]';     
      Torquepacteuler(i,:) = M*[torquepectact(i,1) torquepectact(i,2) torquepectact(i,3)]';     
      Torquesacteuler(i,:) = M*[torquesupact(i,1) torquesupact(i,2) torquesupact(i,3)]';     
      Torquedevacteuler(i,:) = M*[torquedevact(i,1) torquedevact(i,2) torquedevact(i,3)]';     
      Torquepitchacteuler(i,:) = M*[torquepitchact(i,1) torquepitchact(i,2) torquepitchact(i,3)]';     
     
      Torquepecteuler(i,:) = M*[torquepect(i,1) torquepect(i,2) torquepect(i,3)]';     
      Torquesupeuler(i,:) = M*[torquesup(i,1) torquesup(i,2) torquesup(i,3)]';     
      Torquedeveuler(i,:) = M*[torquedev(i,1) torquedev(i,2) torquedev(i,3)]';     
      Torquepitcheuler(i,:) = M*[torquepitch(i,1) torquepitch(i,2) torquepitch(i,3)]';     
     
      
      Torquefinaleuler(i,:) = [Torqueeuler(i,2); Torqueeuler(i,3); Torqueeuler(i,1)];
      torquepectacteuler(i,:) = [Torquepacteuler(i,2); Torquepacteuler(i,3); Torquepacteuler(i,1)];
      torquesupacteuler(i,:) = [Torquesacteuler(i,2); Torquesacteuler(i,3); Torquesacteuler(i,1)];
      torquedevacteuler(i,:) = [Torquedevacteuler(i,2); Torquedevacteuler(i,3); Torquedevacteuler(i,1)];
      torquepitchacteuler(i,:) = [Torquepitchacteuler(i,2); Torquepitchacteuler(i,3); Torquepitchacteuler(i,1)];
 
      torquepecteuler(i,:) = [Torquepecteuler(i,2); Torquepecteuler(i,3); Torquepecteuler(i,1)];
      torquesupeuler(i,:) = [Torquesupeuler(i,2); Torquesupeuler(i,3); Torquesupeuler(i,1)];
      torquedeveuler(i,:) = [Torquedeveuler(i,2); Torquedeveuler(i,3); Torquedeveuler(i,1)];
      torquepitcheuler(i,:) = [Torquepitcheuler(i,2); Torquepitcheuler(i,3); Torquepitcheuler(i,1)];     
end

y = 0;
y = y + 40*(0.0025450 - worktotal(100,1))^2; 

for i = 1:1:100
       y = y + (Torquefinal(i,3) - Tstrokeavg_new(1,i))^2 + (Torquefinal(i,2) - Tpitchavg_new(1,i))^2 + (Torquefinal(i,1) - Tdevavg_new(1,i))^2; 
end
  y = sqrt(y); 