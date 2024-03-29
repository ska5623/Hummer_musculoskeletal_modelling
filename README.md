# Musculoskeletal wing-actuation model of hummingbirds predicts diverse effects of primary flight muscles in hovering flight
This folder includes the scripts for data preprocessing, model optimization, plotting, and analysis for the paper. All the data required to run these scripts can be found at Dryad (doi:10.5061/dryad.4f4qrfjff). The results of this study are reported in the manuscript "Musculoskeletal wing-actuation model of hummingbirds predicts diverse effects of primary flight muscles in hovering flight".

## Procedure

Preprocessing: The first step is to run the scripts in the preprocessing folder. The order in which the scripts should be run is shown as the prefixed folder numbers, and below. The script 'Main' should be run in each folder and all other scripts are auxillary. The required data files should be transferred to each folder.
   1. Wing and wing skeleton kinematics:
         1. Define HUP
         2. Define insertion point and secondary muscle length
   2. CFD to wing skeleton projection:
         1. Spacial alignment
         2. Torque correction after spacial alignment: transfer 'shifted_wing_angles.mat' from 2.1 before running
         3. Cumulative work: transfer 'skeletal_axis_data_wrist.mat' or 'skeletal_axis_data_elbow.mat' from 1.1, and 'torque_data_wing_corrected_final.mat' from 2.2 before running

Model variations and optimization: All the 12 model variations and the genetic algorithm optimization script are defined here. All the files in the 'Fitness function for 12 model variations' and 'Auxillary scripts' folders, and the script 'GA_optimization' should be in the same folder before running.

Final Data and plotting: This folder contains scripts for generating plots and generating results for muscle functioning variables. 
   1. Load data: The result files generated using 'GA_optimization', and the folder 'Model variations and optimization\CPGdata' should be copied in this folder. 'Results data' folder should be created before running the script 'load_data.mat'.
   2. Plot figures: The generated files in the '1. Load data/Results data' folder should be copied in this folder and 'Results data' folder should be created, before running the following scripts.
         1. 'Plot_figures_2bd_and_5' and 'Plot_figures_2ef_3' for plotting the figures.
         2. 'Results1' and 'Results2' for estimating various muscle functioning variables.          
