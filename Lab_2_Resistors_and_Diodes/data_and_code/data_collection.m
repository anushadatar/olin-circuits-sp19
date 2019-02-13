% Experiment One : Diode-Connected 
    % Iin_Exp1_1 and Vout_Exp1_1 are from the first V-I characteristic
    % Vin_Exp1_2 and Iout_Exp1_2 are from the first I-V characteristic
% Experiment Two: Resistor in series w/ Transistor
    % Channel 2 sources voltage and measuring currents
    % Channel 1 is measuring voltage
    % Variable names are based off of resistor values

%% Experiment 1
clear
load('collected_data.mat');
plot(Iin_Exp1_1, Vout_Exp1_1, 'b');
figure
semilogy(Vin_Exp1_2, Iout_Exp1_2, 'r');

%% Experiment 2
load('collected_data.mat');
% theoretical
Is = 3 * 10^(-15);
Ut = 0.025;
V = linspace(0, 3, length(Vin_Exp2_100));

for i = 1:length(Vin_Exp2_100)
    I(1,i) = Is * exp(V(i)/Ut) + V(i)/100;
end



figure
plot(Vin_Exp2_100, Iout_Exp2_100, 'r');
figure
plot(V, I, 'b');
% hold on
% semilogy(Vin_Exp2_1K, Iout_Exp2_1K, 'b');
% hold on
% semilogy(Vin_Exp2_10K, Iout_Exp2_10K, 'b');
% xlabel('Vin (V)');
% ylabel('Iout (A)');
title('Semilogarithmic Plot: Resistor and Transistor in Series');
legend('R=100', 'R=100 theoretical');
% ylim([10e-9, 10e-1]);
% xlim([0.3, 3.1]);

% figure
% subplot(3,1,1);
% plot(Vin_Exp2_100, Iout_Exp2_100);
% title('Linear Plot: Resistor and Transistor in Series, R=100');
% xlabel('Vin (V)');
% ylabel('Iout (A)');
% subplot(3,1,2);
% plot(Vin_Exp2_1K, Iout_Exp2_1K);
% title('Linear Plot: Resistor and Transistor in Series, R=1K');
% xlabel('Vin (V)');
% ylabel('Iout (A)');
% subplot(3,1,3);
% plot(Vin_Exp2_10K, Iout_Exp2_10K);
% title('Linear Plot: Resistor and Transistor in Series, R=10K');
% xlabel('Vin (V)');
% ylabel('Iout (A)');


