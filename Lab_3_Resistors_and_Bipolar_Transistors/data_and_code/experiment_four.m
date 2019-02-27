clear;
load('collected_data.mat');
% Voltage Transfer Characteristic.
plot(Vin_Exp3, Vout_Exp3, '*r','MarkerSize',0.5);
hold on;
plot(Vin_Exp3, Vin_Exp3);

plot(Vin_Exp4_200, Vout_Exp4_200, '*g','MarkerSize',0.5);
plot(Vin_Exp4_200, 5 + 2.*(-(Vin_Exp4_200)));

plot(Vin_Exp4_300, Vout_Exp4_300, '*b','MarkerSize',0.5);
plot(Vin_Exp4_300, 5 + 3.*(-Vin_Exp4_300));

plot(Vin_Exp4_400, Vout_Exp4_400, '*c','MarkerSize',0.5);
plot(Vin_Exp4_400, 5 + 4.*(-Vin_Exp4_400));

title( "Common Emitter-Amplifer Transfer Characteristics");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental Emitter-Follower', 'Theoretical Emitter-Follower', ...
       'Experimental Common-Emitter Amplifier, 200 Ohms', ...
       'Theoretical Common-Emitter Amplifier, 200 Ohms', ...
       'Experimental Common-Emitter Amplifer, 300 Ohms', ...
       'Theoretical Common-Emmmitter Aplifier, 300 Ohms', ...
       'Experimental Common-Emitter Amplifer, 400 Ohms', ...
       'Theoretical Common-Emmmitter Aplifier, 400 Ohms');
legend('boxoff')
legend('Location','southeast')

hold off;