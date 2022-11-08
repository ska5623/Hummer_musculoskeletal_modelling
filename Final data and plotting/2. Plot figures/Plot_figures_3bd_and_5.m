%This script is used for generating figures 3 b-d and figure 5 (and associated supplemental figures).

load('inertialtorque_global_shifted.mat')
load('aerotorque_global_shifted.mat')
   
numvar = 12;
k2pall = zeros(12,1);
k2sall = zeros(12,1);

pectlengthall = zeros(12,100);
suplengthall = zeros(12,100);
pecttendonall = zeros(12,100);
suptendonall = zeros(12,100);
Talls = zeros(12,100);
Tallp = zeros(12,100);
Talld = zeros(12,100);
pectsactive = zeros(12,100);
supsactive = zeros(12,100);
othersactive = zeros(12,100);
pectdactive = zeros(12,100);
supdactive = zeros(12,100);
otherdactive = zeros(12,100);
pectpactive = zeros(12,100);
suppactive = zeros(12,100);
otherpactive = zeros(12,100);

pectspassive = zeros(12,100);
supspassive = zeros(12,100);
otherspassive = zeros(12,100);
pectdpassive = zeros(12,100);
supdpassive = zeros(12,100);
otherdpassive = zeros(12,100);
pectppassive = zeros(12,100);
supppassive = zeros(12,100);
otherppassive = zeros(12,100);

pectFactiveall = zeros(12,100);
supFactiveall = zeros(12,100);
Fcpgposall = zeros(12,100);
Fcpgnegall = zeros(12,100);
Fcpgposdall = zeros(12,100);
Fcpgnegdall = zeros(12,100);
Fcpgpospall = zeros(12,100);
Fcpgnegpall = zeros(12,100);
pectFall = zeros(12,100);
supFall = zeros(12,100);

load('elbow_wl_same_phase.mat');
i = 1;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
supFall(i,:) = -supF;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('elbow_mh_wl_same_phase.mat'); 
i = 2;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;

load('wrist_wl_same_phase.mat'); 
i = 3;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('wrist_mh_wl_same_phase.mat');
i = 4;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('body_fixed_elbow_same_phase.mat');
i = 5;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torqueotheracteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torqueotheracteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torqueotheracteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torqueothereuler(:,3)' - torqueotheracteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) =  torqueothereuler(:,2)' - torqueotheracteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) =  torqueothereuler(:,1)' - torqueotheracteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('body_fixed_wrist_same_phase.mat');
i = 6;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torqueotheracteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torqueotheracteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torqueotheracteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torqueothereuler(:,3)' - torqueotheracteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) =  torqueothereuler(:,2)' - torqueotheracteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) =  torqueothereuler(:,1)' - torqueotheracteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('elbow_wl_sep_phase.mat');
i = 7;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('elbow_mh_wl_sep_phase.mat'); 
i = 8;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;

load('wrist_wl_sep_phase.mat'); 
i = 9;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('wrist_mh_wl_sep_phase.mat');
i = 10;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torquedevacteuler(:,3)'+torquepitchacteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torquedevacteuler(:,2)'+torquepitchacteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torquedevacteuler(:,1)'+torquepitchacteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torquedeveuler(:,3)'-torquedevacteuler(:,3)'+torquepitcheuler(:,3)'-torquepitchacteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) = torquedeveuler(:,2)'-torquedevacteuler(:,2)'+torquepitcheuler(:,2)'-torquepitchacteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) = torquedeveuler(:,1)'-torquedevacteuler(:,1)'+torquepitcheuler(:,1)'-torquepitchacteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('body_fixed_elbow_sep_phase.mat');
i = 11;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torqueotheracteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torqueotheracteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torqueotheracteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torqueothereuler(:,3)' - torqueotheracteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) =  torqueothereuler(:,2)' - torqueotheracteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) =  torqueothereuler(:,1)' - torqueotheracteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

load('body_fixed_wrist_sep_phase.mat');
i = 12;
k2pall(i,1) = k2p;
k2sall(i,1) = k2s;
pectlengthall(i,:) = pectlength;
suplengthall(i,:) = suplength;
pectFall(i,:) = -pectF;
supFall(i,:) = -supF;
pectFactiveall(i,:) = Fcpgpos/2500;
supFactiveall(i,:) = Fcpgneg/2500;
xp = (k2p/(k1p+k2p))*(pectlength-ofp) + (1/(k1p+k2p))*Fcpgpos'/2500;
xs = (k2s/(k1s+k2s))*(suplength-ofs) + (1/(k1s+k2s))*Fcpgneg'/2500;
pecttendonall(i,:) = xp;
suptendonall(i,:) = xs;
Talls(i,:) = Torquefinaleuler(:,3)';
Tallp(i,:) = Torquefinaleuler(:,2)';
Talld(i,:) = Torquefinaleuler(:,1)';
pectsactive(i,:) = torquepectacteuler(:,3)';
supsactive(i,:) = torquesupacteuler(:,3)';
othersactive(i,:) = torqueotheracteuler(:,3)';
pectpactive(i,:) = torquepectacteuler(:,2)';
suppactive(i,:) = torquesupacteuler(:,2)';
otherpactive(i,:) = torqueotheracteuler(:,2)';
pectdactive(i,:) = torquepectacteuler(:,1)';
supdactive(i,:) = torquesupacteuler(:,1)';
otherdactive(i,:) = torqueotheracteuler(:,1)';

pectspassive(i,:) = torquepecteuler(:,3)' - torquepectacteuler(:,3)';
supspassive(i,:) = torquesupeuler(:,3)'-torquesupacteuler(:,3)';
otherspassive(i,:) = torqueothereuler(:,3)' - torqueotheracteuler(:,3)';
pectppassive(i,:) = torquepecteuler(:,2)' - torquepectacteuler(:,2)';
supppassive(i,:) = torquesupeuler(:,2)'-torquesupacteuler(:,2)';
otherppassive(i,:) =  torqueothereuler(:,2)' - torqueotheracteuler(:,2)';
pectdpassive(i,:) = torquepecteuler(:,1)' - torquepectacteuler(:,1)';
supdpassive(i,:) = torquesupeuler(:,1)'-torquesupacteuler(:,1)';
otherdpassive(i,:) =  torqueothereuler(:,1)' - torqueotheracteuler(:,1)';
Fcpgposall(i,:) = Fcpgpos;
Fcpgnegall(i,:) = Fcpgneg;
Fcpgposdall(i,:) = Fcpgposd;
Fcpgnegdall(i,:) = Fcpgnegd;
Fcpgpospall(i,:) = Fcpgposp;
Fcpgnegpall(i,:) = Fcpgnegp;

filestr = ['Results data\dataindividualtorque' num2str(1) '.mat'];
dat = pectsactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(2) '.mat'];
dat = supsactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(3) '.mat'];
dat =  othersactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(4) '.mat'];
dat =  pectpactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(5) '.mat'];
dat =  suppactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(6) '.mat'];
dat =  otherpactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(7) '.mat'];
dat =  pectdactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(8) '.mat'];
dat =  supdactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(9) '.mat'];
dat =  otherdactive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(10) '.mat'];
dat =  pectspassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(11) '.mat'];
dat =  supspassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(12) '.mat'];
dat =  otherspassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(13) '.mat'];
dat =  pectppassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(14) '.mat'];
dat =  supppassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(15) '.mat'];
dat =  otherppassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(16) '.mat'];
dat =  pectdpassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(17) '.mat'];
dat =  supdpassive;
save(filestr,'dat');    
filestr = ['Results data\dataindividualtorque' num2str(18) '.mat'];
dat =  otherdpassive;
save(filestr,'dat');    

pectFpassiveall = zeros(12,100);
supFpassiveall = zeros(12,100);
for i = 1:1:12
   pectFpassiveall(i,:) = pectFall(i,:) - pectFactiveall(i,:);
   supFpassiveall(i,:) = supFall(i,:) - supFactiveall(i,:); 
end

minpectl = zeros(1,100);
maxpectl = zeros(1,100);
minsupl = zeros(1,100);
maxsupl = zeros(1,100);
minpecttl = zeros(1,100);
maxpecttl = zeros(1,100);
minsuptl = zeros(1,100);
maxsuptl = zeros(1,100);
minpectF = zeros(1,100);
maxpectF = zeros(1,100);
minsupF = zeros(1,100);
maxsupF = zeros(1,100);
minpectactF = zeros(1,100);
maxpectactF = zeros(1,100);
minsupactF = zeros(1,100);
maxsupactF = zeros(1,100);

minpectpassiveF = zeros(1,100);
maxpectpassiveF = zeros(1,100);
minsuppassiveF = zeros(1,100);
maxsuppassiveF = zeros(1,100);

mintotalT = zeros(3,100);
maxtotalT = zeros(3,100);
for i = 1:1:100
   minpectl(1,i) = min(pectlengthall(:,i));
   maxpectl(1,i) = max(pectlengthall(:,i));
   minsupl(1,i) = min(suplengthall(:,i));
   maxsupl(1,i) = max(suplengthall(:,i));
   minpecttl(1,i) = min(pecttendonall(:,i));
   maxpecttl(1,i) = max(pecttendonall(:,i));
   minsuptl(1,i) = min(suptendonall(:,i));
   maxsuptl(1,i) = max(suptendonall(:,i));
   minpectF(1,i) = min(pectFall(:,i));
   maxpectF(1,i) = max(pectFall(:,i));
   minsupF(1,i) = min(supFall(:,i));
   maxsupF(1,i) = max(supFall(:,i));
   minpectactF(1,i) = min(pectFactiveall(:,i));
   maxpectactF(1,i) = max(pectFactiveall(:,i));
   minsupactF(1,i) = min(supFactiveall(:,i));
   maxsupactF(1,i) = max(supFactiveall(:,i));
   minpectpassiveF(1,i) = min(pectFpassiveall(:,i));
   maxpectpassiveF(1,i) = max(pectFpassiveall(:,i));
   minsuppassiveF(1,i) = min(supFpassiveall(:,i));
   maxsuppassiveF(1,i) = max(supFpassiveall(:,i));
   mintotalT(1,i) = min(Talld(:,i));
   maxtotalT(1,i) = max(Talld(:,i));
   mintotalT(2,i) = min(Tallp(:,i));
   maxtotalT(2,i) = max(Tallp(:,i));
   mintotalT(3,i) = min(Talls(:,i));
   maxtotalT(3,i) = max(Talls(:,i));
end

meanpectl = (minpectl+maxpectl)/2;
minpectl = minpectl - min(meanpectl);
maxpectl = maxpectl - min(meanpectl);

meansupl = (minsupl+maxsupl)/2;
minsupl = minsupl - min(meansupl);
maxsupl = maxsupl - min(meansupl);

meanpecttl = (minpecttl+maxpecttl)/2;
minpecttl = minpecttl - min(meanpecttl);
maxpecttl = maxpecttl - min(meanpecttl);

meansuptl = (minsuptl+maxsuptl)/2;
minsuptl = minsuptl - min(meansuptl);
maxsuptl = maxsuptl - min(meansuptl);

figure(1)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-1.5 -1.5 4.5 4.5],grey,'Edgecolor',grey);
h1 = drawpatch(minpectl, maxpectl,[50 50 170]/256,0.5);
hold on
for i = 1:1:numvar
   plot(pectlengthall(i,:) - min(meanpectl),'linewidth',1,'color',[0 0 190]/256);
end
ylim([-1.5 4.5]);
xlim([1 100]);

hold on;
h2 = drawpatch(minsupl, maxsupl,[170 50 50]/256,0.3);
for i = 1:1:numvar
   plot(suplengthall(i,:) - min(meansupl),'linewidth',1,'color',[190 0 0]/256);
end
legend([h1 h2],'Pectoralis displacement','Supracoracoideus displacement');
a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
set(a2, 'XTick', []);
set(a2, 'YLim', [-1.5+min(meanpectl) 4.5+min(meanpectl)]);



figure(2)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.2 -0.2 2 2],grey,'Edgecolor',grey);
h1 = drawpatch(minpectF*1000, maxpectF*1000,[50 50 170]/256,0.5);
hold on

for i = 1:1:numvar
   plot(pectFall(i,:)*1000,'linewidth',1,'color',[0 0 190]/256);
end

h2 = drawpatch(minsupF*1000, maxsupF*1000,[170 50 50]/256,0.5);
hold on
for i = 1:1:numvar
   plot(supFall(i,:)*1000,'linewidth',1,'color',[190 0 0]/256);
end
ylim([-0.2 2]);
xlim([1 100]);
legend([h1 h2],'Pectoralis force','Supracoracoideus force');

load skeletal_axis_data_wrist.mat

for i = 1:1:100
     M = [0 0 1; 
          cos(wfanglefinal(3,i)) sin(wfanglefinal(3,i)) 0;
         -cos(wfanglefinal(1,i))*sin(wfanglefinal(3,i)) cos(wfanglefinal(1,i))*cos(wfanglefinal(3,i)) sin(wfanglefinal(1,i))];
     
     Tactual(:,i) = M*[Tdevavg_new(1,i) Tpitchavg_new(1,i) Tstrokeavg_new(1,i)]';     
     Taero(:,i) = M*[Aerotor_avg(1,i) Aerotor_avg(2,i) Aerotor_avg(3,i)]';
     Tinertial(:,i) = M*[Inertialtor_avg(1,i) Inertialtor_avg(2,i) Inertialtor_avg(3,i)]';
end

figure(3)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0016 -0.0016 0.0021 0.0021],grey,'Edgecolor',grey);
drawpatch(mintotalT(3,:), maxtotalT(3,:),[160 160 160]/256,0.5);
hold on;
for i = 1:1:numvar
  h2 =  plot(Talls(i,:),'linewidth',1,'color',[120 120 120]/256);
end
hold on
plot(Tactual(1,:),'-.k','linewidth',1);
plot(Taero(1,:),'-.b','linewidth',1);
plot(Tinertial(1,:),'-.r','linewidth',1);

ylim([-0.0016 0.0021]);
xlim([1 100]);
xlabel('% flapping cycle');
ylabel('Torque in N.m.');

figure(4)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.001 -0.001 0.001 0.001],grey,'Edgecolor',grey);
drawpatch(mintotalT(2,:), maxtotalT(2,:),[160 160 160]/256,0.5);
hold on
for i = 1:1:numvar
   plot(Tallp(i,:),'linewidth',1,'color',[120 120 120]/256);
end
 plot(Tactual(3,:),'-.k','linewidth',1);
 plot(Taero(3,:),'-.b','linewidth',1);
 plot(Tinertial(3,:),'-.r','linewidth',1);
ylim([-0.001 0.001]);
xlim([1 100]);

figure(5)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0016 -0.0016 0.0021 0.0021],grey,'Edgecolor',grey);
drawpatch(mintotalT(1,:), maxtotalT(1,:),[160 160 160]/256,0.5);
hold on
for i = 1:1:numvar
   plot(Talld(i,:),'linewidth',1,'color',[120 120 120]/256);
end
 plot(Tactual(2,:),'-.k','linewidth',1);
 plot(Taero(2,:),'-.b','linewidth',1);
 plot(Tinertial(2,:),'-.r','linewidth',1);
ylim([-0.0016 0.0021]);
xlim([1 100]);
xlabel('% flapping cycle');
ylabel('Torque in N.m.');

minindt1 = zeros(18,100);
maxindt1 = zeros(18,100);
minindt2 = zeros(18,100);
maxindt2 = zeros(18,100);
minindt3 = zeros(18,100);
maxindt3 = zeros(18,100);
for i = 1:1:18
       dat = load(['Results data\dataindividualtorque' num2str(i) '.mat']);
    for j = 1:1:100
        minindt1(i,j) = min(dat.dat([1 2 7 8],j));
        maxindt1(i,j) = max(dat.dat([1 2 7 8],j));
        minindt2(i,j) = min(dat.dat([3 4 9 10],j));
        maxindt2(i,j) = max(dat.dat([3 4 9 10],j));
        minindt3(i,j) = min(dat.dat([5 6 11 12],j));
        maxindt3(i,j) = max(dat.dat([5 6 11 12],j));
    end
end

for i = 1:1:9
       dat = load(['Results data\dataindividualtorque' num2str(i) '.mat']);
       dat2 = load(['Results data\dataindividualtorque' num2str(i+9) '.mat']);
    for j = 1:1:100
        minindt4(i,j) = min(dat.dat([3 4 9 10],j) + dat2.dat([3 4 9 10],j));
        maxindt4(i,j) = max(dat.dat([3 4 9 10],j) + dat2.dat([3 4 9 10],j));
    end
end

figure(6)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.2 -0.2 2 2],grey,'Edgecolor',grey);
h1 = drawpatch(minpectactF*1000, maxpectactF*1000,[14 77 146]/256,0.5);
hold on

for i = 1:1:numvar
   plot(pectFactiveall(i,:)*1000,'linewidth',1,'color',[10 60 130]/256);
end

h2 = drawpatch(minsupactF*1000, maxsupactF*1000,[170 1 20]/256,0.5);
hold on
for i = 1:1:numvar
   plot(supFactiveall(i,:)*1000,'linewidth',1,'color',[130 1 20]/256);
end

h3 = drawpatch(minpectpassiveF*1000, maxpectpassiveF*1000,[204 224 255]/256,0.5);
hold on

for i = 1:1:numvar
   plot(pectFpassiveall(i,:)*1000,'linewidth',1,'color',[180 200 230]/256);
end

h4 = drawpatch(minsuppassiveF*1000, maxsuppassiveF*1000,[228 131 151]/256,0.5);
hold on
for i = 1:1:numvar
   plot(supFpassiveall(i,:)*1000,'linewidth',1,'color',[205 110 131]/256);
end
ylim([-0.2 2]);
xlim([1 100]);
legend([h1 h2 h3 h4],'Pectoralis active','Supracoracoideus active','Pectoralis passive','Supracoracoideus passive');

pmass = 0.274*0.001*3.41/3.256;
smass = 0.1186*0.001*3.41/3.256;

pvol = pmass*1000000/1060; %cm3
svol = smass*1000000/1060; %cm3
plength = 8.5*0.1; %cm
slength = 4.85*0.1; %cm
pca = pvol/plength;
sca = svol/slength;
pca = pca*cos(17*pi/180);
sca = sca*cos(30*pi/180);

a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
ylabel(a2,'Stress(Kpa)');
set(a2, 'XTick', []);
% set(a2, 'YLim', [-0.2/(sca*0.0001) 2/(sca*0.0001)]); %sup
set(a2, 'YLim', [-0.2/(pca*0.0001) 2/(pca*0.0001)]); %pect


type = 1;  %change type to 1, 2 and 3 for plotting for elbow-centeretd, wrist-centered and body-centered models
SET1 = [1 2 7 8];
SET2 = [3 4 9 10];
SET3 = [5 6 11 12];

figure(7)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0016 -0.0016 0.0021 0.0021],grey,'Edgecolor',grey);

if type == 1
    SET = SET1;
    h1 = drawpatch(minindt1(1,:), maxindt1(1,:),[14 77 146]/256,0.5);
    hold on
    h2 = drawpatch(minindt1(2,:), maxindt1(2,:),[170 1 20]/256,0.5);
    h3 = drawpatch(minindt1(3,:), maxindt1(3,:),[210 181 91]/256,0.5);
end

if type == 2
    SET = SET2;
    h4 = drawpatch(minindt2(1,:), maxindt2(1,:),[14 77 146]/256,0.5);
    hold on
    h5 = drawpatch(minindt2(2,:), maxindt2(2,:),[170 1 20]/256,0.5);
    h6 = drawpatch(minindt2(3,:), maxindt2(3,:),[210 181 91]/256,0.5);
end

if type == 3
    SET = SET3;
    h7 = drawpatch(minindt3(1,:), maxindt3(1,:),[14 77 146]/256,0.5);
    hold on
    h8 = drawpatch(minindt3(2,:), maxindt3(2,:),[170 1 20]/256,0.5);
    h9 = drawpatch(minindt3(3,:), maxindt3(3,:),[210 181 91]/256,0.5);
end

  dat = load(['Results data\dataindividualtorque' num2str(1) '.mat']);
  for i = 1:1:100
     mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'-.','linewidth',2,'color',[10 60 130]/256- [0 20 30]/256);
    dat = load(['Results data\dataindividualtorque' num2str(2) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[130 1 20]/256- [30 0 0]/256);
   dat = load(['Results data\dataindividualtorque' num2str(3) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[170 150 75]/256- [30 30 20]/256);


ylim([-0.0016 0.0021]);
xlim([1 100]);
  

legend([h1 h2 h3],'Pectoralis active','Supracoracoideus active','Other active');

a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
ylabel(a2,'Torque/(M*g*r)');
set(a2, 'YLim', [-0.0016/(3.41*0.001*9.81*4.47*0.01) 0.0021/(3.41*0.001*9.81*4.47*0.01)]);


figure(8)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0015 -0.0015 0.0015 0.0015],grey,'Edgecolor',grey);

if type == 1
    SET = SET1;
    h1 = drawpatch(minindt1(4,:), maxindt1(4,:),[14 77 146]/256,0.5);
    hold on
    h2 = drawpatch(minindt1(5,:), maxindt1(5,:),[170 1 20]/256,0.5);
    h3 = drawpatch(minindt1(6,:), maxindt1(6,:),[210 181 91]/256,0.5);
end
if type == 2
    SET = SET2;
    h4 = drawpatch(minindt2(4,:), maxindt2(4,:),[14 77 146]/256,0.5);
    hold on
    h5 = drawpatch(minindt2(5,:), maxindt2(5,:),[170 1 20]/256,0.5);
    h6 = drawpatch(minindt2(6,:), maxindt2(6,:),[210 181 91]/256,0.5);
end
if type == 3
    SET = SET3;
    h7 = drawpatch(minindt3(4,:), maxindt3(4,:),[14 77 146]/256,0.5);
    hold on
    h8 = drawpatch(minindt3(5,:), maxindt3(5,:),[170 1 20]/256,0.5);
    h9 = drawpatch(minindt3(6,:), maxindt3(6,:),[210 181 91]/256,0.5);
end

ylim([-0.0015 0.0015]);
xlim([1 100]);

 dat = load(['Results data\dataindividualtorque' num2str(4) '.mat']);
  for i = 1:1:100
     mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'-.','linewidth',2,'color',[10 60 130]/256- [0 20 30]/256);
      mediand11 = mediand;
    dat = load(['Results data\dataindividualtorque' num2str(5) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[130 1 20]/256- [30 0 0]/256);
  mediand12 = mediand;
   dat = load(['Results data\dataindividualtorque' num2str(6) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[170 150 75]/256- [30 30 20]/256);
  mediand13 = mediand;
      
a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
set(a2, 'YLim', [-0.0015/(3.41*0.001*9.81*4.47*0.01) 0.0015/(3.41*0.001*9.81*4.47*0.01)]);
set(a2, 'XTick', []);
ylabel(a2,'Torque/(M*g*r)');

figure(9)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0025 -0.0025 0.0021 0.0021],grey,'Edgecolor',grey);
if type == 1
    SET = SET1;
    h1 = drawpatch(minindt1(7,:), maxindt1(7,:),[14 77 146]/256,0.5);
    hold on
    h2 = drawpatch(minindt1(8,:), maxindt1(8,:),[170 1 20]/256,0.5);
    h3 = drawpatch(minindt1(9,:), maxindt1(9,:),[210 181 91]/256,0.5);
end
if type == 2
    SET = SET2;
    h4 = drawpatch(minindt2(7,:), maxindt2(7,:),[14 77 146]/256,0.5);
    hold on
    h5 = drawpatch(minindt2(8,:), maxindt2(8,:),[170 1 20]/256,0.5);
    h6 = drawpatch(minindt2(9,:), maxindt2(9,:),[210 181 91]/256,0.5);
end
if type == 3
    SET = SET3;
    h7 = drawpatch(minindt3(7,:), maxindt3(7,:),[14 77 146]/256,0.5);
    hold on
    h8 = drawpatch(minindt3(8,:), maxindt3(8,:),[170 1 20]/256,0.5);
    h9 = drawpatch(minindt3(9,:), maxindt3(9,:),[210 181 91]/256,0.5);
end

 
dat = load(['Results data\dataindividualtorque' num2str(7) '.mat']);
  for i = 1:1:100
     mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'-.','linewidth',2,'color',[10 60 130]/256- [0 20 30]/256);
    dat = load(['Results data\dataindividualtorque' num2str(8) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[130 1 20]/256- [30 0 0]/256);
   dat = load(['Results data\dataindividualtorque' num2str(9) '.mat']);
  for i = 1:1:100
      mediand(1,i) = median(dat.dat(SET,i));
  end
  plot(mediand,'-.','linewidth',2,'color',[170 150 75]/256- [30 30 20]/256);

ylim([-0.0021 0.0021]);
xlim([1 100]);


figure(10)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0016 -0.0016 0.0021 0.0021],grey,'Edgecolor',grey);
if type == 1
    SET = SET1;
    h3 = drawpatch(minindt1(12,:), maxindt1(12,:),[173,235,50]/256,0.5);
    hold on;
    h2 = drawpatch(minindt1(11,:), maxindt1(11,:),[228 131 151]/256,0.5);
    h1 = drawpatch(minindt1(10,:), maxindt1(10,:),[204 224 255]/256,0.5);
end
if type == 2
    SET = SET2;
     h6 = drawpatch(minindt2(12,:), maxindt2(12,:),[173,235,50]/256,0.5);
    hold on;
    h5 = drawpatch(minindt2(11,:), maxindt2(11,:),[228 131 151]/256,0.5);
    h4 = drawpatch(minindt2(10,:), maxindt2(10,:),[204 224 255]/256,0.5);
end
if type == 3
    SET = SET3;
      h9 = drawpatch(minindt3(12,:), maxindt3(12,:),[173,235,50]/256,0.5);
    hold on;
    h8 = drawpatch(minindt3(11,:), maxindt3(11,:),[228 131 151]/256,0.5);
    h7 = drawpatch(minindt3(10,:), maxindt3(10,:),[204 224 255]/256,0.5);
end

ylim([-0.0016 0.0021]);
xlim([1 100]);

dat = load(['Results data\dataindividualtorque' num2str(12) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'--','linewidth',2,'color',[133,225,35]/256 - [30 40 5]/256);

    dat = load(['Results data\dataindividualtorque' num2str(11) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'--','linewidth',2,'color',[205 110 131]/256 - [40 30 30]/256);

   dat = load(['Results data\dataindividualtorque' num2str(10) '.mat']);
 for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end
      plot(mediand,'-.','linewidth',2,'color',[180 200 230]/256- [40 40 40]/256);

  
plot(zeros(1,100),'color',[0 0 0]/256);
legend([h1 h2 h3],'Pectoralis passive','Supracoracoideus passive','Other passive');
a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
ylabel(a2,'Torque/(M*g*r)');
set(a2, 'YLim', [-0.0016/(3.41*0.001*9.81*4.47*0.01) 0.0021/(3.41*0.001*9.81*4.47*0.01)]);

figure(11)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.001 -0.001 0.001 0.001],grey,'Edgecolor',grey);

if type == 1
    SET = SET1;
      h3 = drawpatch(minindt1(15,:), maxindt1(15,:),[173,235,50]/256,0.5);
    hold on;
    h2 = drawpatch(minindt1(14,:), maxindt1(14,:),[228 131 151]/256,0.5);
    h1 = drawpatch(minindt1(13,:), maxindt1(13,:),[204 224 255]/256,0.5);
end
if type == 2
    SET = SET2;
    h6 = drawpatch(minindt2(15,:), maxindt2(15,:),[173,235,50]/256,0.5);
    hold on;
    h5 = drawpatch(minindt2(14,:), maxindt2(14,:),[228 131 151]/256,0.5);
    h4 = drawpatch(minindt2(13,:), maxindt2(13,:),[204 224 255]/256,0.5);
end
if type == 3
    SET = SET3;
       h9 = drawpatch(minindt3(15,:), maxindt3(15,:),[173,235,50]/256,0.5);
    hold on;
    h8 = drawpatch(minindt3(14,:), maxindt3(14,:),[228 131 151]/256,0.5);
    h7 = drawpatch(minindt3(13,:), maxindt3(13,:),[204 224 255]/256,0.5);
end

ylim([-0.001 0.001]);
xlim([1 100]);
dat = load(['Results data\dataindividualtorque' num2str(15) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end
   mediand23 = mediand;
      plot(mediand,'--','linewidth',2,'color',[133,225,35]/256 - [30 40 5]/256);
    dat = load(['Results data\dataindividualtorque' num2str(14) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end
   mediand22 = mediand;
      plot(mediand,'--','linewidth',2,'color',[205 110 131]/256 - [40 30 30]/256);
   dat = load(['Results data\dataindividualtorque' num2str(13) '.mat']);
 for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
 end
   mediand21 = mediand;
      plot(mediand,'-.','linewidth',2,'color',[180 200 230]/256- [40 40 40]/256);
a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
set(a2, 'YLim', [-0.001/(3.41*0.001*9.81*4.47*0.01) 0.001/(3.41*0.001*9.81*4.47*0.01)]);
set(a2, 'XTick', []);
ylabel(a2,'Torque/(M*g*r)');

figure(12)
grey=[0.8,0.8,0.8];
fill([50 100 100 50],[-0.0016 -0.0016 0.0021 0.0021],grey,'Edgecolor',grey);

if type == 1
    SET = SET1;
       h3 = drawpatch(minindt1(18,:), maxindt1(18,:),[173,235,50]/256,0.5);
    hold on;
    h2 = drawpatch(minindt1(17,:), maxindt1(17,:),[228 131 151]/256,0.5);
    h1 = drawpatch(minindt1(16,:), maxindt1(16,:),[204 224 255]/256,0.5);
end
if type == 2
    SET = SET2;
       h6 = drawpatch(minindt2(18,:), maxindt2(18,:),[173,235,50]/256,0.5);
    hold on;
    h5 = drawpatch(minindt2(17,:), maxindt2(17,:),[228 131 151]/256,0.5);
    h4 = drawpatch(minindt2(16,:), maxindt2(16,:),[204 224 255]/256,0.5);
end
if type == 3
    SET = SET3;
    h9 = drawpatch(minindt3(18,:), maxindt3(18,:),[173,235,50]/256,0.5);
    hold on;
    h8 = drawpatch(minindt3(17,:), maxindt3(17,:),[228 131 151]/256,0.5);
    h7 = drawpatch(minindt3(16,:), maxindt3(16,:),[204 224 255]/256,0.5);
end

   dat = load(['Results data\dataindividualtorque' num2str(18) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end

      plot(mediand,'--','linewidth',2,'color',[133,225,35]/256 - [30 40 5]/256);
    dat = load(['Results data\dataindividualtorque' num2str(17) '.mat']);
  for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
  end

      plot(mediand,'--','linewidth',2,'color',[205 110 131]/256 - [40 30 30]/256);
   dat = load(['Results data\dataindividualtorque' num2str(16) '.mat']);
 for i = 1:1:100
          mediand(1,i) = median(dat.dat(SET,i));
 end

      plot(mediand,'-.','linewidth',2,'color',[180 200 230]/256- [40 40 40]/256);
      plot(zeros(1,100),'color',[0 0 0]/256);
  
ylim([-0.0016 0.0021]);
xlim([1 100]);


a2 = axes('YAxisLocation', 'Right');
set(a2, 'color', 'none');
ylabel(a2,'Torque/(M*g*r)');
set(a2, 'XTick', []);
set(a2, 'YLim', [-0.0016/(3.41*0.001*9.81*4.47*0.01) 0.0021/(3.41*0.001*9.81*4.47*0.01)]);


