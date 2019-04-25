%%
plot(Exp1_V1_2V, Exp1_Vout_2V, "*");
hold on;
plot(Exp1_V1_3V, Exp1_Vout_3V, "*");
plot(Exp1_V1_4V, Exp1_Vout_4V, "*");

legend('V_2 = 2 V', 'V_2 = 3 V', 'V_2 = 4 V');
legend('Location','southeast');

%Labels
title('Current Mirror Differential Amplifier Voltage Transfer Characteristic');
ylabel("Voltage Output (Volts)");
xlabel("V_1 (Volts)");

hold off;
