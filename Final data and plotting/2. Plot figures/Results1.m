%% This script is for calculating cycle averaged and peak forces, associated ratios, and PECT strain. 

% run Plot_figures_2bd_5 before running this

m = 3.41*0.001; %kg
g = 9.81;

cycle_averaged_pect_force = mean(pectFall')*1000; %in N
cycle_averaged_sup_force = mean(supFall')*1000;
peak_pect_force = max(pectFall')*1000;
peak_sup_force = max(supFall')*1000;

%weight_ratio
cycle_averaged_pect_force_wr = mean(pectFall')*1000/(m*g);
cycle_averaged_sup_force_wr = mean(supFall')*1000/(m*g);
peak_pect_force_wr = max(pectFall')*1000/(m*g);
peak_sup_force_wr = max(supFall')*1000/(m*g);

%PECT to SUPRA ratio
pect_to_sup_cycle_averaged_ratio = abs(cycle_averaged_pect_force)./abs(cycle_averaged_sup_force);
pect_to_sup_peak_ratio = abs(peak_pect_force)./abs(peak_sup_force);
pect_to_sup_stroke_torque_ratio = max(abs(pectsactive+pectspassive)')./max(abs(supsactive+supspassive)');

%passive to active force ratios
pectpassive_to_pectactive = max(abs(pectFall  - pectFactiveall)')./max(abs(pectFactiveall)');
suppassive_to_supactive = max(abs(supFall  - supFactiveall)')./ max(abs(supFactiveall)');

% PECT strain
for i = 1:1:12
   diffpect(1,i) = max(pectlengthall(i,:)) - min(pectlengthall(i,:)); 
   strainp(1,i) = diffpect(1,i)/mean(pectlengthall(i,:));
end