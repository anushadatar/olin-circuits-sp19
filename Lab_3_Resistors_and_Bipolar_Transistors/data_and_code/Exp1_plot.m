load ("collected_data.mat")

%Ie = Ic + Ib

Ib = (Iout_Base_Exp1);
Ie = (Iout_Emitter_Exp1);

Ic = (-1.*(Ie)) - Ib;

%% plot 1
figure('Name','Plot 1')

%Experimental
semilogy(Vin_Exp1,Ib,'*','MarkerSize',5);
hold on;
semilogy(Vin_Exp1, Ic,'*','MarkerSize',5);

Ib_fit = polyfit(Vin_Exp1(45:95)',log((Ib(45:95)))',1);
Ib_theo= polyval(Ib_fit,Vin_Exp1(45:95));
Ic_fit = polyfit(Vin_Exp1(23:87)',log((Ic(23:87)))',1);
Ic_theo= polyval(Ic_fit,Vin_Exp1(23:87));

semilogy(Vin_Exp1(45:95), exp(Ib_theo),'g+')
semilogy(Vin_Exp1(23:87), exp(Ic_theo),'k+')

%Labels
title( "Voltage vs. Current ");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Base Current', 'Collector Current','Theoretical Base Current','Theoretical Collector Current')
legend('boxoff')
legend('Location','northwest')

hold off;

%% plot 2
figure('Name','Plot 2')

Beta_Exp1 = Ic ./ Ib;

%Experimental
semilogx(Ib(2:101), Beta_Exp1(2:101),'b*','MarkerSize',4);
ylim([0,300]);
xlim([10^(-9), 10^(-3.5)]);

%Labels
title( "Collector Current vs. Current Gain ");
xlabel("Current (Amps)");
ylabel("Current Gain");

legend('Calculated Beta Ratio')
legend('Location','northeast')

hold off;
%% Plot 3 rb = Ut/Ib
figure('Name','Plot 3')

get_fit = polyfit(Vin_Exp1(41:91), log(Ib(41:91)), 1);
Ut = abs(1/get_fit(1));
Is = abs(exp(get_fit(2)));
rb_theo = Ut./(Ib);

%Theoretical

loglog(Ib,rb_theo,'b*');
hold on;

%Experimental
rb = diff(Vin_Exp1(41:91))./diff(Ib(41:91));

loglog(Ib(42:91),rb, 'ko','MarkerSize',4);

title( "Incremental Base Resistance (rb)");
xlabel("Base Current (Amps)");
ylabel("Incremental Base Resistance (Ohms)");

legend('Theoretical Incremental Base Resistance','Experimental Incremental Base Resistance')
legend('boxoff')
legend('Location','northwest')

hold off;
%% Plot 4 gm = Ic/Ut
figure('Name','Plot 4')

gm_theo = Ic./Ut;

%Theo
loglog(Ic, gm_theo,'b*')
hold on

%Experimental
gm = diff(Ic)./diff(Vin_Exp1)

loglog(Ic(1:end-1),gm,'ko')


title('Incremental Transconductance Gain (gm)')
xlabel('Collector Current (Amps)')
ylabel('Transconductance Gain (Mhos)')

legend('Theoretical Transconductance Gain','Experimental Transconductance Gain')
legend('boxoff')
legend('Location','northwest')

hold off;