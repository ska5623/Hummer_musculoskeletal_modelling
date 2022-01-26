# Three-dimensional actuation of hummingbird wings requires diverse effects from the primary flight muscles
This folder includes the scripts for data preprocessing, model optimization, plotting and analysis for the paper. All the data required to run these scripts can be found at: https://doi.org/10.5061/dryad.n5tb2rbxg. The results of this study is reported in the manuscript "Three-dimensional actuation of hummingbird wings requires diverse effects from the primary flight muscles".

## Procedure

Preprocessing: The first step is to run the scripts in the preprocessing section. The order in which the scripts should be run is shown as the prefixed folder numbers, and below. The script 'Main' should be run in each folder, and all other scripts are auxillary. The required data files should be transferred to each folder.
   1. Wing and wing skeleton kinematics:
         1. Define HUP
         2. Define insertion point and secondary muscle length
   2. Wing muscle actuation torque
   3. CFD to wing skeleton projection:
         1. Spacial alignment
         2. Torque correction after spatial alignment: transfer 'shifted_wing_angles.mat' from 3.1 before running
         3. Cumulative work: transfer 'skeletal_axis_data_wrist.mat' or 'skeletal_axis_data_elbow.mat' from 1.1, and 'torque_data_wing_corrected_final.mat' from 3.2 before running

Model variations and optimization: All the 12 model variations and the genetic algorithm optimization script are defined here. All the files in the 'Fitness function for 12 model variations' and 'Auxillary scripts' folders, and the script 'GA_optimization' should be in the same folder before running. 

Final Data and plotting: This folder contains scripts for generating plots and generating results for muscle functioning variables. 
   1. Load data: The result files generated using 'GA_optimization', and the folder 'Model variations and optimization\CPGdata' should be copied in this folder. 'Results  
                 data' folder should be created before running the script 'load_data.mat'.
   3. Plot figures: The generated files in the '1. Load data/Results data' folder should be copied in this folder and 'Results data' folder should be created, before running the  
                    following scripts.
         1. 'Plot_figures_2bd_and_5' and 'Plot_figures_2ef_3' for plotting the figures.
         2. 'Results1' and 'Results2' for generating predicting various muscle functioning variables.          
