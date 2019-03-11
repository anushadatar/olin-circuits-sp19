clear all
load('Exp3_data_collection.mat');

%% Ix plots

figure
loglog(Exp2_Ix_input_250, Exp2_Ix_Iout_250, 'r*', 'MarkerSize', 1.5);
hold on
loglog(Exp2_Ix_input_25K, Exp2_Ix_Iout_25K, 'g*', 'MarkerSize', 1.5);
hold on
loglog(Exp2_Ix_input_2_5K, Exp2_Ix_Iout_2_5K, 'b*', 'MarkerSize', 1.5);
hold off

%% Iy plots

figure
loglog(Exp2_Iy_input_250, Exp2_Iy_Iout_250, 'r*', 'MarkerSize', 1.5);
hold on
loglog(Exp2_Iy_input_25K, Exp2_Iy_Iout_25K, 'g*', 'MarkerSize', 1.5);
hold on
loglog(Exp2_Iy_input_2_5K, Exp2_Iy_Iout_2_5K, 'b*', 'MarkerSize', 1.5);
hold off
