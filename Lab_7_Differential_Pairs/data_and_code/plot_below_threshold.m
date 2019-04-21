load("Lab7_data.mat")

%%
% include a single plot showing I1, I2, I1 ? I2, and I1 + I2, as a function of V1 ? V2 for all three
% values of V2 that you used. Do these current–voltage characteristics change significantly as
% V2 changes? 
plot(Vdm, I1_below_3V, '*r');
hold on;
plot(Vdm, I1_below_4V, '*g');
plot(Vdm, I1_below_5V, '*b');
plot(Vdm, I2_below_3V, '*r');
plot(Vdm, I2_below_4V, '*g');
plot(Vdm, I2_below_5V, '*b');
plot(Vdm, I1_below_3V + I2_below_3V, '*r');
plot(Vdm, I1_below_4V + I2_below_4V, '*g');
plot(Vdm, I1_below_5V + I2_below_5V, '*b');
plot(Vdm, I1_below_3V - I2_below_3V, '*r');
plot(Vdm, I1_below_4V - I2_below_4V, '*g');
plot(Vdm, I1_below_5V - I2_below_5V, '*b');
legend('I1, V2=3V', 'I1, V2=4V', 'I1, V2=5V', 'I2, V2=3V', 'I2, V2=4V', 'I2, V2=5V', 'I1+I2, 3V', 'I1+I2, 4V', 'I1+I2, 5V', 'I1-I2, 3V', 'I1-I2, 4V', 'I1-I2, 5V');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Pair Currents, V_b at Threshold');
ylabel("Current Output (Amps)");
xlabel("V_{dm} (Volts)");

hold off;

%%
%Also include a plot showing the common-source node voltage, V , as a function
% of V1 ? V2 for all three values of V2. How does the value of V change as V1 goes from below
% V2 to above it?
plot(Vdm, V_node_below_3V, "*r");
hold on;
plot(Vdm, V_node_below_4V, '*g');
plot(Vdm, V_node_below_5V, '*b');
title('Differential Pair Common Source Node Voltage, V_b at Threshold');
xlabel('V_{dm} (Volts)');
ylabel('Common-Source Node Voltage (V)');
legend('V_2 = 3V', 'V_2 = 4V', 'V_2 = 5V');
legend('boxoff')
legend('Location', 'southeast');
hold off

bob1 = polyfit(Vdm(110:200), V_node_below_3V(110:200), 1)
bill1 = polyfit(Vdm(10:100), V_node_below_3V(10:100), 1)
bob2 = polyfit(Vdm(100:200), V_node_below_4V(100:200), 1);
bob3 = polyfit(Vdm(100:200), V_node_below_5V(100:200), 1);
%% Gdm
% from -0.05 to 0.05 Vdm --> 90 to 111

fit1 = polyfit(Vdm(95:105), I1_below_3V(95:105) - I2_below_3V(95:105), 1);
fit2 = polyfit(Vdm(95:105), I1_below_4V(95:105) - I2_below_4V(95:105), 1);
fit3 = polyfit(Vdm(95:105), I1_below_5V(95:105) - I2_below_5V(95:105), 1);

nums = linspace(-0.5, 0.5, 40);

for i=1:40
    line1(i) = (fit1(1).*nums(i)) + fit1(2);
    line2(i) = (fit2(1).*nums(i)) + fit2(2);
    line3(i) = (fit3(1).*nums(i)) + fit3(2);
end

gdm3V = fit1(1);
gdm4V = fit2(1);
gdm5V = fit3(1);

figure
plot(Vdm, I1_below_3V - I2_below_3V, 'r.');
hold on
plot(Vdm, I1_below_4V - I2_below_4V, 'g.');
plot(Vdm, I1_below_5V - I2_below_5V, 'b.');
plot(nums, line1);
plot(nums, line2);
plot(nums, line3);
xlim([-0.5,0.5]);
ylim([-12*10^(-7), 12*10^(-7)]);
title('Incremental Diff.-Mode Transconductance Gain');
xlabel('V_{dm} (V)');
ylabel('Current I_1 - I_2 (A)');
legend('V_2 = 3V', 'V_2 = 4V', 'V_2 = 5V', 'G_{dm} = 7.782e-6 Mhos', 'G_{dm} = 7.794e-6 Mhos', 'G_{dm} = 8.48e-6 Mhos');
legend('location', 'southeast');


