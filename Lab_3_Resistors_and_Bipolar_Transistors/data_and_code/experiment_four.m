clear;
load('collected_data.mat');
% Voltage Transfer Characteristic.
plot(Vin_Exp3, Vout_Exp3);
hold on;
plot(Vin_Exp3, Vin_Exp3);

plot(Vin_Exp4_200, Vout_Exp4_200);
%plot(Vin_Exp4, Vout_Exp4_);

plot(Vin_Exp4_300, Vout_Exp4_300);
%plot(Vin_Exp4, Vout_Exp4);

plot(Vin_Exp4_400, Vout_Exp4_400);
%plot(Vin_Exp4, Vout_Exp4);

title( "Common Emitter-Amplifer Transfer Characteristics");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental Emitter-Follower', 'Theoretical Emitter-Follower', \
       'Experimental Common Emitter-Amplifier', 'Theoretical Common Emitter Amplifier');
legend('boxoff')
legend('Location','southeast')

hold off;