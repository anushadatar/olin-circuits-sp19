clear;
load('collected_data.mat');
% Voltage Transfer Characteristic.
plot(Vin_Exp3, Vout_Exp3);
hold on;
plot(Vin_Exp3, Vinsm_Exp3);

title( "Emitter-Follower Voltage Transfer Characteristic");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental Voltage Transfer');
legend('boxoff')
legend('Location','southeast')

hold off;
