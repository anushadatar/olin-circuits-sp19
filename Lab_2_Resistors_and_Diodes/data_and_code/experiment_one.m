clear

load('collected_data.mat');

figure;
semilogy( Vout_Exp1_1,Iin_Exp1_1,'*b','MarkerSize',2) %current-voltage
hold on;
semilogy(Vin_Exp1_2,Iout_Exp1_2, '*r','MarkerSize',2) %voltage-current
% Instead of using the curve fitting toolbox, use polyfit to get values.
fit = polyfit(Vin_Exp1_2, log(Iout_Exp1_2), 1);
ut = abs(1/fit(1));
is = abs(exp(fit(2)));


CV_theo = is .* exp(Vin_Exp1_2./ut);
semilogy(Vin_Exp1_2,CV_theo,'-k','MarkerSize',5)
hold off;
title( "Current-Voltage Characteristic");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Current-Voltage Characteristic', 'Voltage-Current Characteristic','Current-Voltage Theoretical','Voltage-Current Theoretical')
legend('boxoff')
legend('Location','northwest')


hold off;
%% 
clear

load('collected_data.mat');

incremental_resistance = diff(Vout_Exp1_1)./diff(Iin_Exp1_1);

hold on;
% Theoretical plot.
loglog(Iin_Exp1_1(1,end-1), incremental_resistance);