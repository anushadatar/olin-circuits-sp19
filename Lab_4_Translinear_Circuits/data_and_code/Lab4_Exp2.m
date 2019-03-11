load('collected_data_Exp2_MA.mat');

%% Ix plot

figure
loglog(Ix_Exp2_200k, IzIx_Exp2_200k, 'r*', 'MarkerSize', 1.5);
hold on
loglog(Ix_Exp2_20k, IzIx_Exp2_20k, 'g*', 'MarkerSize', 1.5);
hold on
loglog(Ix_Exp2_2_05k, IzIx_Exp2_2_05k, 'b*', 'MarkerSize', 1.5);

%% Iy plot

figure
loglog(Iy_Exp2_200k, IzIy_Exp2_200k)
