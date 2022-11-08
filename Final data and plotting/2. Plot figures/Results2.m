%% This script can be used for calculating primary, power, mass specific power, stress, and associated ratios, and secondary muscle work

% Muscle work
workpectall(:,100)*1000 %J to mJ
worksupall(:,100)*1000 
workotherall(:,100)*1000 

%Ratios
pect_to_sup_work_ratio = workpectall(:,100)./worksupall(:,100);
max_pect_elastic_percentage = max(abs(workpectspringall'))'./workpectall(:,100);
max_sup_elastic_percentage = max(abs(worksupspringall'))'./worksupall(:,100);

peak_passive_to_active_power_pect = max(abs(powerpectspringall'))./max(abs(powerpectCPGall'));
peak_passive_to_active_power_sup = max(abs(powersupspringall'))./max(abs(powersupCPGall'));


%muscle stress
pmass = 0.274*0.001*3.41/3.256; %kg
smass = 0.1186*0.001*3.41/3.256; %kg
pvol = pmass*1000000/1060; %cm^3
svol = smass*1000000/1060; %cm^3
plength = 8.5*0.1; %cm
slength = 4.85*0.1; %cm
pca = pvol/plength; %cm^2
sca = svol/slength; %cm^2

pca = 0.0001*pca*cos(17*pi/180); %m^2 
sca = 0.0001*sca*cos(30*pi/180); %m^2

pect_stress = max(abs(pectFall)')*1000/pca;
sup_stress = max(abs(supFall)')*1000/sca;
