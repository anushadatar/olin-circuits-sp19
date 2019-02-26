clear
load('collected_data.mat');

%% Semilog Plot
figure
semilogy(Vin_Exp2_100, Iout_Exp2_100);
hold on
semilogy(Vin_Exp2_1K, Iout_Ex2_1K);
hold on
semilogy(Vin_Ex2_10K, Iout_Ex2_10K);
hold off

%% Linear plot for each R
figure
plot(Vin_Exp2_100, Iout_Exp2_100);
figure
plot(Vin_Exp2_1K, Iout_Ex2_1K);
figure
plot(Vin_Ex2_10K, Iout_Ex2_10K);
