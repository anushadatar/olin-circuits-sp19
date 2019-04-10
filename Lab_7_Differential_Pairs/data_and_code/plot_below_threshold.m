load("Lab7_data.mat")
%%
% include a single plot showing I1, I2, I1 ? I2, and I1 + I2, as a function of V1 ? V2 for all three
% values of V2 that you used. Do these current–voltage characteristics change significantly as
% V2 changes? 
plot(Vdm, I1_below_3V);
hold on;
plot(Vdm, I1_below_4V);
plot(Vdm, I1_below_5V);
plot(Vdm, I2_below_3V);
plot(Vdm, I2_below_4V);
plot(Vdm, I2_below_5V);
plot(Vdm, I1_below_3V + I2_below_3V);
plot(Vdm, I1_below_4V + I2_below_4V);
plot(Vdm, I1_below_5V + I2_below_5V);
plot(Vdm, I1_below_3V - I2_below_3V);
plot(Vdm, I1_below_4V - I2_below_4V);
plot(Vdm, I1_below_5V - I2_below_5V);
legend('I1, V2=3V', 'I1, V2=4V', 'I1, V2=5V', 'I2, V2=3V', 'I2, V2=4V', 'I2, V2=5V', 'I1+I2, 3V', 'I1+I2, 4V', 'I1+I2, 5V', 'I1-I2, 3V', 'I1-I2, 4V', 'I1-I2, 5V');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Pair Currents, V_b at Threshold');
xlabel("Current Output (Amps)");
ylabel("V_{DM}");

hold off;

%%
%Also include a plot showing the common-source node voltage, V , as a function
% of V1 ? V2 for all three values of V2. How does the value of V change as V1 goes from below
% V2 to above it?
plot(Vdm, V_node_below_3V);
hold on;
plot(Vdm, V_node_below_4V);
plot(Vdm, V_node_below_5V);

legend('V2 = 3V', 'V2 = 4V', 'V2 = 5V');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Pair Common Source Node Voltages, V_b at Threshold');
xlabel("Common Source Node Voltage (Volts)");
ylabel("V_{DM} (Volts)");

hold off;