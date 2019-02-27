load ("collected_data.mat")

%Ie = Ic + Ib

Ib = (Iout_Base_Exp1);
Ie = (Iout_Emitter_Exp1);

Ic = (-1.*(Ie)) - Ib;
%% plot 1
figure('Name','Plot 1')

semilogy(Vin_Exp1,Iout_Base_Exp1,'*');
hold on;
semilogy(Vin_Exp1, Ic,'*');

hold off;

title( "Voltage vs. Current ");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Base Current', 'Collector Current')
legend('boxoff')
legend('Location','northwest')

%% plot 2
figure('Name','Plot 2')

Beta_Exp1 = Ic ./ Ib;

semilogx(Ib, Beta_Exp1);

hold off;

title( "Beta ");
xlabel("Current (Amps)");
ylabel("Beta Ratio");

% legend('Calculated Beta Ratio')
% legend('boxoff')
% legend('Location','northwest')

%% Plot 3 rb = Ut/Ib
figure('Name','Plot 3')

get_fit = polyfit(Vin_Exp1, log(Ib), 1);
Ut = abs(1/get_fit(1));
rb = Ut./(Ib);

loglog(rb,Iout_Base_Exp1,'*')


title( "rB");
xlabel("Incremental Base Resistance (Ohms");
ylabel("Base Current (Amps)");

% legend('Calculated Beta Ratio')
% legend('boxoff')
% legend('Location','northwest')

hold off;
%% Plot 4 gm = Ic/Ut
figure('Name','Plot 4')

gm = Ic./Ut;

loglog(gm,Ic)

% legend('Incremental Transconductance Gain')
% legend('Transconductance Gain (Mhos)')
% legend('Collector Current (Amps)')
hold off;