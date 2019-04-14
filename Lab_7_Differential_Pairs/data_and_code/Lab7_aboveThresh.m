load ('Lab7_data.mat')

I1 = I1_above_3V;
I2 = I2_above_3V;

Vdm = Vdm_big_range;
Vcs = V_node_above_3V;
%% Current Plot
Idiff = I1 - I2;
Imore = I1 + I2;

figure;
plot(Vdm,I1,'b.')
hold on;
plot(Vdm,I2,'r.')
hold on;
plot(Vdm,Idiff,'g.')
hold on
plot(Vdm,Imore,'m.')


%Legend
legend('I1','I2','I1-I2','I1+I2');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differentail Pair Currents, Above Threshold (V_{b} = 1.5)');
xlabel("V_{dm} (Volts)");
ylabel("Current (Amps_)");

hold off;
%% Voltage Plot

figure;
plot(Vdm,Vcs,'bo')

%Labels
title('Common-Source Voltage vs. Differential-Mode Voltage');
xlabel("V_{dm} (Volts)");
ylabel("V_{cs} (Volts)");