load ("collected_data.mat")

%Ie = Ic + Ib

Ib = (Iout_Base_Exp1);
Ie = (Iout_Emitter_Exp1);

Ic = (-1.*(Ie)) - Ib;
%% plot 1
figure('Name','Plot 1')

%Experimental
semilogy(Vin_Exp1,Iout_Base_Exp1,'*');
hold on;
semilogy(Vin_Exp1, Ic,'*');
% Theoretical TODO



%Labels
title( "Voltage vs. Current ");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Base Current', 'Collector Current')
legend('boxoff')
legend('Location','northwest')

hold off;
%% plot 2
figure('Name','Plot 2')

Beta_Exp1 = Ic ./ Ib;

%Experimental
semilogx(Ib, Beta_Exp1);

%Theoretical ToDo

%Labels
title( "Beta ");
xlabel("Current (Amps)");
ylabel("Beta Ratio");

legend('Calculated Beta Ratio')
legend('boxoff')
legend('Location','northwest')

hold off;
%% Plot 3 rb = Ut/Ib
figure('Name','Plot 3')

get_fit = polyfit(Vin_Exp1(41:91), log(Ib(45:95)), 1);
Ut = abs(1/get_fit(1));
rb = Ut./(Ib);

loglog(rb,Iout_Base_Exp1,'*')


title( "Incremental Base Resistance (rb)");
xlabel("Incremental Base Resistance (Ohms");
ylabel("Base Current (Amps)");

% legend('Calculated Beta Ratio')
% legend('boxoff')
% legend('Location','northwest')

hold off;
%% Plot 4 gm = Ic/Ut
figure('Name','Plot 4')

gm = Ic./Ut;

loglog(gm,Ic,'*')

title('Incremental Transconductance Gain (gm)')
xlabel('Transconductance Gain (Mhos)')
ylabel('Collector Current (Amps)')
hold off;