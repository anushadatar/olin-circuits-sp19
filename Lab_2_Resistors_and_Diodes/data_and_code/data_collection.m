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
% R=100
p100 = polyfit(Vin_Exp2_100, log(Iout_Exp2_100), 1);
Ut100 = 1/p100(1);
Is100 = exp(p100(2));

p1K = polyfit(Vin_Exp2_1K, log(Iout_Exp2_1K), 1);
Ut1K = 1/p1K(1);
Is1K = exp(p1K(2));

p10K = polyfit(Vin_Exp2_100, log(Iout_Exp2_100), 1);
Ut10K = 1/p10K(1);
Is10K = exp(p10K(2));

Ion100 = Ut100/100;
Ion1K = Ut1K/1000;
Ion10K = Ut10K/10000;

Von100 = Ut100 * log(Ion100/Is100);
Von1K = Ut1K * log(Ion1K/Is1K);
Von10K = Ut10K * log(Ion10K/Is10K);


V = linspace(0, 3, length(Vin_Exp2_100));

for i = 1:length(Von100)
    I100(1,i) = Is100 * exp(V(i)/Ut100);
end
for l = (length(Von100+1 : end))
    I100((1,i) = V(i)
end

for i = 1:length(Vin_Exp2_1K)
    I1K(1,i) = Is1K * exp(V(i)/Ut1K) + V(i)/1000;
end

for i = 1:length(Vin_Exp2_1K)
    I10K(1,i) = Is10K * exp(V(i)/Ut10K) + V(i)/10000;
end

figure
semilogy(Vin_Exp2_100, Iout_Exp2_100, 'o');
hold on
semilogy(V, I100, 'b');
hold on
semilogy(Vin_Exp2_1K, Iout_Exp2_1K, 'o');
hold on
semilogy(V(1:51), I1K);
hold on
semilogy(Vin_Exp2_10K, Iout_Exp2_10K, 'o');
hold on
semilogy(V(1:51), I10K);
xlabel('Vin (V)');
ylabel('Iout (A)');
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


