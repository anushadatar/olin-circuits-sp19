load ("collected_data.mat")

%Ie = Ic + Ib

Iout_Collector_Exp1 = (-1.*Iout_Emitter_Exp1) - (-1.*Iout_Base_Exp1);

%% plot 1
figure('Name','Plot 1')

semilogy(Vin_Exp1,Iout_Base_Exp1);
hold on;
semilogy(Vin_Exp1, Iout_Collector_Exp1)

hold off;

title( "Voltage vs. Current ");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Base Current', 'Collector Current')
legend('boxoff')
legend('Location','northwest')

%%plot 2
figure('Name','Base and Collector')

Beta_Exp1 = Iout_Collector_Exp1 ./ Iout_Base_Exp1;

semilogy(Iout_Base_Exp1, Beta_Exp1)

hold off;

title( "Beta ");
ylabel("Current (Amps)");
xlabel("Beta Ratio");

% legend('Calculated Beta Ratio')
% legend('boxoff')
% legend('Location','northwest')

%%Plot 3 rb = Ut/Ib

%%Plot 4 gm = Ic/Ut
