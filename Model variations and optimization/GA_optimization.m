nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_body_fixed_wrist_same_phase;

LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.0005 -0.0005 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.0005 0.0005 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(17,8) = -1;
A(17,9) = 1;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1; 

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
  options.InitialPopulationMatrix = paramu2;
elseif val == fval3
  options.InitialPopulationMatrix = paramu3;
else
  options.InitialPopulationMatrix = paramu4;
end

[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_body_fixed_wrist_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    


nvars = 41; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_body_fixed_wrist_sep_phase;

LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.0005 -0.0005 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.0005 0.0005 0.5 0.5 1 1 1 1];
    
A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(12,8) = -1;
A(12,9) = 1;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_body_fixed_wrist_sep_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_body_fixed_elbow_same_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.0005 -0.0005 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.0005 0.0005 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(12,8) = -1;
A(12,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_body_fixed_elbow_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    


nvars = 41; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_body_fixed_elbow_sep_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.0005 -0.0005 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.0005 0.0005 0.5 0.5 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(12,8) = -1;
A(12,9) = 1;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);     
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_body_fixed_elbow_sep.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 37; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_elbow_wl_mh_same_phase;

LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(20,8) = -1;
A(20,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_elbow_wl_mh_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    


nvars = 37; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_wrist_wl_mh_same_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(20,8) = -1;
A(20,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_wrist_wl_mh_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_wrist_wl_mh_sep_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.5 0.5 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(20,8) = -1;
A(20,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);        
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_wrist_wl_mh_sep_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_elbow_wl_mh_sep_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.5 0.5 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(20,8) = -1;
A(20,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_elbow_wl_mh_sep_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 37; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_elbow_wl_same_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(12,8) = -1;
A(12,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_elbow_wl_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    


nvars = 37; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);
ObjectiveFunction = @fitness_wrist_wl_same_phase;

LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(12,8) = -1;
A(12,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_wrist_wl_same_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);

ObjectiveFunction = @fitness_elbow_wl_sep_phase;
LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.5 0.5 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(12,8) = -1;
A(12,9) = 1;


options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
  options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_elbow_wl_sep_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    

nvars = 39; 
A = zeros(nvars,nvars);
B = zeros(nvars,1);
ObjectiveFunction = @fitness_wrist_wl_sep_phase;

LB = [5 5 0.001 0.001 5 0.4 0 0.001 0.001 0 0 0.001 0.001 -15 -15 -0.0005 0.1 0.1 -0.0005 0.01 0.01 -0.0005 0.1 0.1 -0.0005 0.01 0.01 0 0 -2 -1 0 -1 -0.5 -0.5 0 0 0 0];
UB = [100 100 0.5 0.5 10 1 0.15 90 90 0 0 51 51 35 35 0.0005 10 10 0.0005 0.999 0.999 0.0005 10 10 0.0005 0.999 0.999 0.1 0.1 1 1 1 1 0.5 0.5 1 1 1 1];

A(1,1) = -1;
A(1,3) = 1;
A(2,2) = -1;
A(2,4) = 1;
A(4,3) = -10;
A(4,4) = 1;
A(5,3) = 1;
A(5,4) = -10;
A(8,1) = -10;
A(8,2) = 1;
A(9,1) = 1;
A(9,2) = -10;
A(18,12) = 1;
A(18,13) = -1;
A(19,14) = 1;
A(19,15) = -1;
A(12,8) = -1;
A(12,9) = 1;

options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotstopping});
options = optimoptions(options,'UseParallel', true, 'UseVectorized', false);
options.InitialPopulationRange = [LB; UB];
options.MaxStallGenerations = 500;
options = optimoptions(options,'HybridFcn',{@fmincon, []});

options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);         
[paramu1,fval] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu2,fval2] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu3,fval3] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = LB + rand(1,nvars).*(UB-LB);
[paramu4,fval4] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    

val = min([fval fval2 fval3 fval4]);
if val == fval
   options.InitialPopulationMatrix = paramu1; 
elseif val == fval2
   options.InitialPopulationMatrix = paramu2;
elseif val == fval3
   options.InitialPopulationMatrix = paramu3;
else
   options.InitialPopulationMatrix = paramu4;
end
[paramu5,fval5] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);
options.InitialPopulationMatrix = paramu5;
[paramu6,fval6] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu6;
[paramu7,fval7] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu7;
[paramu8,fval8] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options); 
options.InitialPopulationMatrix = paramu8;
[paramu9,fval9] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu9;
[paramu10,fval10] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu10;
[paramu11,fval11] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
options.InitialPopulationMatrix = paramu11;
[paramu12,fval12] = ga(ObjectiveFunction,nvars,A,B,[],[],LB,UB,[],options);    
save('Results\data_wrist_wl_sep_phase.mat','paramu7','paramu8','paramu9','paramu10','paramu11','paramu12','fval','fval2','fval3','fval4','fval5','fval6','fval7','fval8','fval9','fval10','fval11','fval12');    
