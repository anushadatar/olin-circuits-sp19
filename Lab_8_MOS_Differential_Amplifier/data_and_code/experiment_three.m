load('Thurs_Data.mat');

%% 

fit = polyfit(Exp3_Vin(15:100), Exp3_Vout(15:100), 1);

for i = 1:100
    Vout_theo(i) = fit(1)*Exp3_Vin(i) + fit(2);
end

figure
plot(Exp3_Vin, Exp3_Vout, 'o');
hold on
plot(Exp3_Vin, Vout_theo, 'k');
xlabel('V_{in} (V)');
ylabel('V_{out} (V)');
title('Unity Gain Follower Voltage Transfer Characteristic');
legend('Experimental data', 'Theoretical fit');
legend('location', 'southeast');

%% 

figure
plot(Exp3_Vin, Exp3_Vout_Vin, 'o');
xlabel('V_{in} (V)');
ylabel('V_{out} - V_{in} (V)');
title('Unity Gain Follower Offset Voltage');