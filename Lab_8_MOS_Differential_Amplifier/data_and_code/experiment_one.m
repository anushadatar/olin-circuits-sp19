%%
plot(Exp1_V1_below_2_5, Exp1_Vout_below_2_5, "*");
hold on;
plot(Exp1_V1_below_3_5, Exp1_Vout_below_3_5, "*");
plot(Exp1_V1_below_4_5, Exp1_Vout_below_4_5, "*");

legend('V_2 = 2.5 V', 'V_2 = 3.5 V', 'V_2 = 4.5 V');
legend('boxoff');
legend('Location','southeast');

%Labels
title('Differential Amplifier Voltage Transfer Characteristic at Threshold (V_b = 0.65 Volts)');
ylabel("Voltage Output (Volts)");
xlabel("V_1 (Volts)");

hold off;

%%
plot(Exp1_V1_above_2_5, Exp1_Vout_above_2_5, "*");
hold on;
plot(Exp1_V1_above_3_5, Exp1_Vout_above_3_5, "*");
plot(Exp1_V1_above_4_5, Exp1_Vout_above_4_5, "*");
legend('V_2 = 2.5 V', 'V_2 = 3.5 V', 'V_2 = 4.5 V');
legend('boxoff');
legend('Location','southeast');

%Labels
title('Differential Amplifier Voltage Transfer Characteristic above Threshold (V_b = 1.5 Volts)');
ylabel("Voltage Output (Volts)");
xlabel("V_1 (Volts)");

hold off;