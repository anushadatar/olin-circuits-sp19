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
semilogx(Ib, Beta_Exp1,'b*','MarkerSize',4);

%Labels
title( "Collector Current vs. Beta Ratio ");
xlabel("Current (Amps)");
ylabel("Beta Ratio");

legend('Calculated Beta Ratio')
legend('boxoff')
legend('Location','northeast')

hold off;
%% Plot 3 rb = Ut/Ib
figure('Name','Plot 3')

get_fit = polyfit(Vin_Exp1(41:91), log(Ib(41:91)), 1);
Ut = abs(1/get_fit(1));
rb_theo = Ut./(Ib);

%Theoretical

loglog(rb_theo,Ib,'b*');
hold on;

%Experimental
rb = diff(Vin_Exp1(41:91))./diff(Ib(41:91));

loglog(rb,Ib(42:91),'ko','MarkerSize',4);

title( "Incremental Base Resistance (rb)");
xlabel("Incremental Base Resistance (Ohms");
ylabel("Base Current (Amps)");

legend('Theoretical Incremental Base Resistance','Experimental Incremental Base Resistance')
legend('boxoff')
legend('Location','northwest')

hold off;
%% Plot 4 gm = Ic/Ut
figure('Name','Plot 4')

gm_theo = Ic./Ut;

%Theo
loglog(gm_theo,Ic,'b*')
hold on

%Experimental
gm = diff(Ic)./diff(Vin_Exp1)

loglog(gm,Ic(1:end-1),'ko')


title('Incremental Transconductance Gain (gm)')
xlabel('Transconductance Gain (Mhos)')
ylabel('Collector Current (Amps)')

legend('Theoretical Transconductance Gain','Experimental Transconductance Gain')
legend('boxoff')
legend('Location','northwest')

hold off;