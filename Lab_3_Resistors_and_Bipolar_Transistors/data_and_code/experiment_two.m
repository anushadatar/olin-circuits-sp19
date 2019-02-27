clear
load('collected_data.mat');

%% Semilog Plot

% calculate Ic from Ib and Ie...
Ic100 = (Iout_Emitter_Exp2_100 - Iout_Base_Exp2_100);
Ic1K = (Iout_Emitter_Exp2_1K - Iout_Base_Exp2_1K);
Ic10K = (Iout_Emitter_Exp2_10K - Iout_Base_Exp2_10K);
figure
semilogy(Vin_Exp2_100, Ic100, 'r*');
hold on
semilogy(Vin_Exp2_1K, Ic1K, 'g*');
hold on
semilogy(Vin_Exp2_10K, Ic10K, 'b*');
title('Collector Current calculated from Base and Emmiter Currents');
legend('Ic when R=100', 'Ic when R=1K', 'Ic when R=10K');
hold off

%% Linear plot for each R
figure
plot(Vin_Exp2_100, Ic100, 'ro', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=100');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');
figure
plot(Vin_Exp2_1K, Ic1K, 'go', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=1K');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');
figure
plot(Vin_Exp2_10K, Ic10K, 'bo', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=10K');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');

%% Incremental Base Resistance, Rb
Rb100 = diff(Vin_Exp2_100) ./ diff(Iout_Base_Exp2_100);
Rb1K = diff(Vin_Exp2_1K) ./ diff(Iout_Base_Exp2_1K);
Rb10K = diff(Vin_Exp2_10K) ./ diff(Iout_Base_Exp2_10K);
figure
loglog(Iout_Base_Exp2_100(1:end-1), Rb100);
hold on
loglog(Iout_Base_Exp2_1K(1:end-1), Rb1K);
hold on
loglog(Iout_Base_Exp2_10K(1:end-1), Rb10K);
hold off

%% Emitter Degeneration, Gm
Gm100 = diff(Ic100) ./ diff(Vin_Exp2_100);
Gm1K = diff(Ic1K) ./ diff(Vin_Exp2_1K);
Gm10K = diff(Ic10K) ./ diff(Vin_Exp2_10K);
figure
loglog(Ic100(1:end-1), Gm100, 'ro');
hold on
loglog(Ic1K(1:end-1), Gm1K, 'bo');
hold on
loglog(Ic10K(1:end-1), Gm10K, 'go');
hold off
