clear;
load('Lab6_data.mat');
load('exp2_series.mat');

% Based on ekvfit of Q2
Is_nmos = 1.7677e-06
kappa_nmos = 0.6593
Vt_nmos = .6326
Ut = 0.0258

% Experimental Values.
semilogy(Exp2_Vg_10mv, Exp2_Q2_Ic_10mv, 'k*', 'MarkerSize', 1.5);
hold on;
semilogy(Exp2_Vg_5, Exp2_Q2_Ic_5, 'r*', 'MarkerSize', 1.5);
semilogy(Exp2_Vg_S_5v1, Exp2_Ic_S_5v_1,'g*', 'MarkerSize', 1.5);
semilogy(Exp2_Vg_S_10mv_1, Exp2_Ic_S_10mv_1, 'y*', 'MarkerSize', 1.5);
semilogy(Exp2_Vg_P_10mv, Exp2_P_Ic_10mv, 'c*', 'MarkerSize', 1.5);
semilogy(Exp2_Vg_P_5v, Exp2_P_Ic_5v, 'm*', 'MarkerSize', 1.5);

legend('Individual Transistor, V_{DS} = 10mV', 'Individual Transistor, V_{DS} = 5V', 'Series Transistors, V_{DS} = 10mV', 'Series Transistors, V_{DS} = 5V', 'Parallel Transistors, V_{DS} = 10mV', 'Parallel Transistors, V_{DS} = 5V');
legend('boxoff');
legend('Location', 'southeast');
title( "Current-Voltage Characteristics for Transistor Configurations");
ylabel("Channel Current (Amps)");
xlabel("Gate Voltage (Volts)");
%% Plot 2: Ratio for Series
clear;
load('Lab6_data.mat');
load('exp2_series.mat');
% Experimental
mv10_ratio = Exp2_Ic_S_10mv_1./Exp2_Q2_Ic_10mv;
v5_ratio = Exp2_Ic_S_5v_1./Exp2_Q2_Ic_5;
plot(Exp2_Vg_S_5v1, mv10_ratio,'r*', 'MarkerSize', 1.5);
hold on;
plot(Exp2_Vg_S_10mv_1, v5_ratio,'b*', 'MarkerSize', 1.5);

% Theoretical
plot(Exp2_Q2_Ic_10mv, 0.5) 
plot(Exp2_Q2_Ic_5,0.5);
ylim([0.25 0.75]);
legend('Current Ratio, V_{DS} = 10mV', 'Current Ratio, V_{DS} = 5V');
legend('boxoff');
legend('Location', 'southeast');
title( "Ratio of Currents of Series-Connected and Individual nMOS Transistors");
ylabel("Ratio of Series Current to Individual Current");
xlabel("Gate Voltage (Volts)");

%% Plot 2: Ratio for Parallel
clear;
load('Lab6_data.mat');

mv10_ratio = Exp2_P_Ic_10mv./Exp2_Q2_Ic_10mv;
v5_ratio = Exp2_P_Ic_5v./Exp2_Q2_Ic_5;
plot(Exp2_Vg_P_5v, mv10_ratio,'r*', 'MarkerSize', 1.5);
hold on;
plot(Exp2_Vg_P_10mv, v5_ratio,'b*', 'MarkerSize', 1.5);

% Theoretical
plot(Exp2_Q2_Ic_10mv, 2) 
plot(Exp2_Q2_Ic_5,2);
ylim([1.5 2.5]);

legend('Current Ratio, V_{DS} = 10mV', 'Current Ratio, V_{DS} = 5V');
legend('boxoff');
legend('Location', 'southeast');
title( "Ratio of Currents of Parallel-Connected and Individual nMOS Transistors");
ylabel("Ratio of Parllel Current to Individual Current");
xlabel("Gate Voltage (Volts)");