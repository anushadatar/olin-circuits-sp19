load ('Lab7_data.mat')

I1 = I1_above_3V;
I2 = I2_above_3V;

Vdm = Vdm_big_range;
Vcs = V_node_above_3V;
%% Current Plot
Idiff = I1 - I2;

figure;
plot(Vdm,I1,'bo')
hold on;
plot(Vdm,I2,'ro')
hold on;
plot(Vdm,Idiff,'go')


%Legend
legend('I1','I2','I1-I2');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Current-Voltage Characteristic Above Threshold');
xlabel("Vdm (Volts)");
ylabel("Current (Amps_)");

hold off;
%% Voltage Plot

figure;
plot(Vdm,Vcs,'bo')

%Labels
title('Common-Source Voltage vs. Differential-Mode Voltage');
xlabel("Vdm (Volts)");
ylabel("Vcs (Volts)");