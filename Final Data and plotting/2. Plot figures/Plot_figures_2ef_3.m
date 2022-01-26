% This script is used for plotting the figures 2 E-F, and figure 3

numvar = 12;
pall = zeros(12,100);
workpectall = zeros(12,100);
workpectCPGall = zeros(12,100);
workpectspringall = zeros(12,100);
worksupall = zeros(12,100);
worksupCPGall = zeros(12,100);
worksupspringall = zeros(12,100);
workotherall = zeros(12,100);
worktotalall = zeros(12,100);
pectlengthall = zeros(12,100);
suplengthall = zeros(12,100);
pectFall = zeros(12,100);
supFall = zeros(12,100);

powerpectall = zeros(12,99);
powerpectCPGall = zeros(12,99);
powerpectspringall = zeros(12,99);
powersupall = zeros(12,99);
powersupCPGall = zeros(12,99);
powersupspringall = zeros(12,99);
powerotherall = zeros(12,99);
powerotherCPGall = zeros(12,99);
powerotherspringall = zeros(12,99);

xsall = zeros(12,100);
xpall = zeros(12,100);

load('elbow_wl_same_linear.mat');
i = 1;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('elbow_mh_wl_linear.mat'); 
i = 2;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('wrist_wl_linear.mat'); 
i = 3;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('wrist_mh_wl_linear.mat');
i = 4;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('body_fixed_elbow_same_linear.mat');
i = 5;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('body_fixed_wrist_same_linear.mat');
i = 6;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('elbow_wl_sep_linear.mat');
i = 7;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('elbow_mh_wl_linear_sep_phase.mat'); 
i = 8;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';
powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('wrist_wl_linear_sep_phase.mat'); 
i = 9;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('wrist_mh_wl_linear_sep_phase.mat');
i = 10;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('body_fixed_elbow_sep_linear.mat');
i = 11;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;

load('body_fixed_wrist_sep_linear.mat');
i = 12;
pall(i,:) = pectlength;
minpectlengthall(i,1) = min(pectlength);
minsuplengthall(i,1) = min(suplength);
pectlengthall(i,:) = (pectlength - min(pectlength));
suplengthall(i,:) = (suplength - min(suplength));
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;

workpectall(i,:) = workpect';
worktotalall(i,:) = worktotal';
workpectCPGall(i,:) = workpectCPG';
workpectspringall(i,:) = workpect'-workpectCPG';
worksupall(i,:) = worksup';
worksupCPGall(i,:) = worksupCPG';
worksupspringall(i,:) = worksup' -worksupCPG';
workotherall(i,:) = workother';

powerpectall(i,:) = powerpect(2:100,1)';
powerpectCPGall(i,:) = powerpectCPG(2:100,1)';
powerpectspringall(i,:) = powerpect(2:100,1)'-powerpectCPG(2:100,1)';
powersupall(i,:) = powersup(2:100,1)';
powersupCPGall(i,:) = powersupCPG(2:100,1)';
powersupspringall(i,:) = powersup(2:100,1)' -powersupCPG(2:100,1)';
powerotherall(i,:) = powerother(2:100,1)';
xsall(i,:) = xs;
xpall(i,:) = xp;


filestr = ['Results data\dataindividualpower' num2str(1) '.mat'];
dat = workpectall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(2) '.mat'];
dat = workpectCPGall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(3) '.mat'];
dat =  workpectspringall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(4) '.mat'];
dat =  worksupall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(5) '.mat'];
dat =  worksupCPGall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(6) '.mat'];
dat =  worksupspringall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(7) '.mat'];
dat =  workotherall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(10) '.mat'];
dat =   powerpectall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(11) '.mat'];
dat =  powerpectCPGall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(12) '.mat'];
dat =  powerpectspringall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(13) '.mat'];
dat =  powersupall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(14) '.mat'];
dat =  powersupCPGall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(15) '.mat'];
dat =  powersupspringall;
save(filestr,'dat');    
filestr = ['Results data\dataindividualpower' num2str(16) '.mat'];
dat =  powerotherall;
save(filestr,'dat');    

minxs = zeros(1,100);
maxxs = zeros(1,100);
minxp = zeros(1,100);
maxxp = zeros(1,100);
minpectF = zeros(1,100);
maxpectF = zeros(1,100);
minsupF = zeros(1,100);
maxsupF = zeros(1,100);
minpectl = zeros(1,100);
maxpectl = zeros(1,100);
minsupl = zeros(1,100);
maxsupl = zeros(1,100);

for i = 1:1:100
   minxs(1,i) = min(xsall(:,i));
   maxxs(1,i) = max(xsall(:,i));
   minxp(1,i) = min(xpall(:,i));
   maxxp(1,i) = max(xpall(:,i));
   minpectl(1,i) = min(pectlengthall(:,i));
   maxpectl(1,i) = max(pectlengthall(:,i));
   minsupl(1,i) = min(suplengthall(:,i));
   maxsupl(1,i) = max(suplengthall(:,i));
   minpectF(1,i) = min(pectFall(:,i));
   maxpectF(1,i) = max(pectFall(:,i));
   minsupF(1,i) = min(supFall(:,i));
   maxsupF(1,i) = max(supFall(:,i));
end

minpwdt = zeros(18,100);
maxpwdt = zeros(18,100);
for i = 1:1:7
       dat = load(['Results data\dataindividualpower' num2str(i) '.mat']);
    for j = 1:1:100
        minpwdt(i,j) = min(dat.dat(:,j));
        maxpwdt(i,j) = max(dat.dat(:,j));
    end
end
for i = 10:1:16
       dat = load(['Results data\dataindividualpower' num2str(i) '.mat']);
    for j = 2:1:100
        minpwdt(i,j) = min(dat.dat(:,j-1));
        maxpwdt(i,j) = max(dat.dat(:,j-1));
    end
end


figure(8)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.002 -0.002 0.003 0.003],grey,'Edgecolor',grey);
h5 = drawpatch(minpwdt(7,:), maxpwdt(7,:),[210 181 91]/256,0.5);
hold on
h4 = drawpatch(minpwdt(6,:), maxpwdt(6,:),[228 131 151]/256,0.5);
h3 = drawpatch(minpwdt(5,:), maxpwdt(5,:),[170 1 20]/256,0.5);
h2 = drawpatch(minpwdt(3,:), maxpwdt(3,:),[204 224 255]/256,0.5);
h1 = drawpatch(minpwdt(2,:), maxpwdt(2,:),[14 77 146]/256,0.5);
hold on         
ylim([-0.002 0.003]);
xlim([1 100]);
      dat = load(['Results data\dataindividualpower' num2str(7) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[170 150 75]/256)
      end
      dat = load(['Results data\dataindividualpower' num2str(6) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[205 110 131]/256)
      end
       dat = load(['Results data\dataindividualpower' num2str(5) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[130 1 20]/256)
      end
      dat = load(['Results data\dataindividualpower' num2str(3) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[180 200 230]/256)
      end

       dat = load(['Results data\dataindividualpower' num2str(2) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[10 60 130]/256)
      end
      
xlabel('% flapping cycle');
ylabel('Work in J');

figure(9)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.4 -0.4 0.6 0.6],grey,'Edgecolor',grey);
h5 = drawpatch99(minpwdt(16,2:100), maxpwdt(16,2:100),[210 181 91]/256,0.5);
hold on      
h4 = drawpatch99(minpwdt(15,2:100), maxpwdt(15,2:100),[228 131 151]/256,0.5);
h3 = drawpatch99(minpwdt(14,2:100), maxpwdt(14,2:100),[170 1 20]/256,0.5);
h2 = drawpatch99(minpwdt(12,2:100), maxpwdt(12,2:100),[204 224 255]/256,0.5);
h1 = drawpatch99(minpwdt(11,2:100), maxpwdt(11,2:100),[14 77 146]/256,0.5);
hold on

ylim([-0.4 0.6]);
xlim([1 100]);
      dat = load(['Results data\dataindividualpower' num2str(16) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[170 150 75]/256)
      end
  
      dat = load(['Results data\dataindividualpower' num2str(15) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[205 110 131]/256)
      end

      dat = load(['Results data\dataindividualpower' num2str(14) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[130 1 20]/256)
      end

       dat = load(['Results data\dataindividualpower' num2str(12) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[180 200 230]/256)
      end

       dat = load(['Results data\dataindividualpower' num2str(11) '.mat']);
      for j = 1:1:numvar
         plot(dat.dat(j,:),'linewidth',1,'color',[10 60 130]/256)
      end
      
xlabel('% flapping cycle');
ylabel('Power in W');


figure(10)
ylim([-0.0001 0.002]);
xlim([-0.1 3]);
for i = 1:1:numvar
   pectlengthplot = [pectlengthall(i,:) pectlengthall(i,1)];
   pectFplot = [pectFall(i,:) pectFall(i,1)];
   suplengthplot = [suplengthall(i,:) suplengthall(i,1)];
   supFplot = [supFall(i,:) supFall(i,1)];

   plot(pectlengthplot,pectFplot,'linewidth',1,'color',[10 60 130]/256);
   hold on;
   plot(suplengthplot,supFplot,'linewidth',1,'color',[130 1 20]/256);
   hold on
end

xlabel('Muscle length in mm');
ylabel('Force in N');
set(gca,'box','off')

figure(12)

ylim([-0.0001 0.002]);
xlim([-0.1 3]);
for i = 1:1:numvar
   pectlengthplot = [pectlengthall(i,:)/minpectlengthall(i,1) pectlengthall(i,1)/minpectlengthall(i,1)];
   pectFplot = [pectFall(i,:) pectFall(i,1)];
   plot(pectlengthplot,pectFplot,'linewidth',1,'color',[10 60 130]/256);
   hold on;
end

xlabel('Muscle strain');
ylabel('Force in N');
set(gca,'box','off')
