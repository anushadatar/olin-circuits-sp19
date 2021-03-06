load ("collected_data_done.mat")

%Ie = Ic + Ib

% Q1
Ib_Q1 = (Ib_Q1_Exp1);
Ie_Q1 = (Ie_Q1_Exp1);
Ic_Q1 = -1*(Ie_Q1-Ib_Q1);

Beta_Q1 = Ic_Q1 ./ Ib_Q1;
avg_Beta_Q1 = mean(Beta_Q1);

%%
% Q2
Ib_Q2 = (Ib_Q2_Exp1);
Ie_Q2 = (Ie_Q2_Exp1);
Ic_Q2 = -1*(Ie_Q2-Ib_Q2);

Beta_Q2 = Ic_Q2 ./ Ib_Q2;
avg_Beta_Q2 = mean(Beta_Q2);

%%
% Q3
Ib_Q3 = (Ib_Q3_Exp1);
Ie_Q3 = (Ie_Q3_Exp1);
Ic_Q3 = -1*(Ie_Q3-Ib_Q3);

Beta_Q3 = Ic_Q3 ./ Ib_Q3;
avg_Beta_Q3 = mean(Beta_Q3);
% Q4
Ib_Q4 = (Ib_Q4_Exp1);
Ie_Q4 = (Ie_Q4_Exp1);
Ic_Q4 = -1*(Ie_Q4-Ib_Q4);

Beta_Q4 = Ic_Q4 ./ Ib_Q4;
avg_Beta_Q4 = mean(Beta_Q4);
%% Plot of Base Voltage vs. Collect + Base Current
% Plot 1/3: Semilog Voltage Transfer Characteristic.
% Experimental.
% Collector currents.
figure ('Name', 'Plot 1')

semilogy(Vin_Base_Q1_Exp1, Ic_Q1,  '*r','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q2_Exp1, Ic_Q2,  '*g','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q3_Exp1, Ic_Q3,  '*b','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q4_Exp1, Ic_Q4,  '*k','MarkerSize',2);
hold on

% Base currents.
semilogy(Vin_Base_Q1_Exp1, Ib_Q1,  '*r','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q2_Exp1, Ib_Q2,  '*g','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q3_Exp1, Ib_Q3,  '*b','MarkerSize',2);
hold on;
semilogy(Vin_Base_Q4_Exp1, Ib_Q4,  '*k','MarkerSize',2);

% Theoretical
Q1_Ib_fit = polyfit(Vin_Base_Q1_Exp1(21:71)',log((Ib_Q1(21:71)))',1);
Q1_Ib_theo= polyval(Q1_Ib_fit,Vin_Base_Q1_Exp1(21:71));
Q1_Ic_fit = polyfit(Vin_Base_Q1_Exp1(21:71)',log((Ic_Q1(21:71)))',1);
Q1_Ic_theo= polyval(Q1_Ic_fit,Vin_Base_Q1_Exp1(21:71));
Is_Q1 = abs(exp(Q1_Ic_theo(2)));

Q2_Ib_fit = polyfit(Vin_Base_Q2_Exp1(21:71)',log((Ic_Q2(21:71)))',1);
Q2_Ib_theo= polyval(Q2_Ib_fit,Vin_Base_Q2_Exp1(21:71));
Q2_Ic_fit = polyfit(Vin_Base_Q2_Exp1(21:71)',log((Ic_Q2(21:71)))',1);
Q2_Ic_theo= polyval(Q2_Ic_fit,Vin_Base_Q2_Exp1(21:71));
Is_Q2 = abs(exp(Q2_Ic_theo(2)));

Q3_Ib_fit = polyfit(Vin_Base_Q3_Exp1(21:71)',log((Ib_Q3(21:71)))',1);
Q3_Ib_theo= polyval(Q3_Ib_fit,Vin_Base_Q3_Exp1(21:71));
Q3_Ic_fit = polyfit(Vin_Base_Q3_Exp1(21:71)',log((Ic_Q3(21:71)))',1);
Q3_Ic_theo= polyval(Q3_Ic_fit,Vin_Base_Q3_Exp1(21:71));
Is_Q3 = abs(exp(Q3_Ic_theo(2)));

Q4_Ib_fit = polyfit(Vin_Base_Q4_Exp1(21:71)',log((Ib_Q4(21:71)))',1);
Q4_Ib_theo= polyval(Q4_Ib_fit,Vin_Base_Q4_Exp1(21:71));
Q4_Ic_fit = polyfit(Vin_Base_Q4_Exp1(21:71)',log((Ic_Q4(21:71)))',1);
Q4_Ic_theo= polyval(Q4_Ic_fit,Vin_Base_Q4_Exp1(21:71));
Is_Q4 = abs(exp(Q4_Ic_theo(2)));

semilogy(Vin_Base_Q1_Exp1(21:71), exp(Q1_Ib_theo),'r')
semilogy(Vin_Base_Q2_Exp1(21:71), exp(Q2_Ib_theo),'g')
semilogy(Vin_Base_Q3_Exp1(21:71), exp(Q3_Ib_theo),'b')
semilogy(Vin_Base_Q4_Exp1(21:71), exp(Q4_Ib_theo),'k')


semilogy(Vin_Base_Q1_Exp1(21:71), exp(Q1_Ib_theo),'r')
semilogy(Vin_Base_Q2_Exp1(21:71), exp(Q2_Ib_theo),'g')
semilogy(Vin_Base_Q3_Exp1(21:71), exp(Q3_Ib_theo),'b')
semilogy(Vin_Base_Q4_Exp1(21:71), exp(Q4_Ic_theo),'k')


title( "MAT14 Transistor Array Current-Voltage Characteristics");
ylabel("Current (Amps)");
xlabel("Base Voltage (Volts)");

legend('Experimental Q1 Collector',' Experimental Q2 Collector','Experimental Q3 Collector','Experimental Q4 Collector', 'Experimental Q1 Base', 'Experimental Q2 Base', 'Experimental Q3 Base', 'Experimental Q4 Base', 'Theoretical Q1 Collector',' Theoretical Q2 Collector','Theoretical Q3 Collector','Theoretical Q4 Collector', 'Theoretical Q1 Base', 'Theoretical Q2 Base', 'Theoretical Q3 Base', 'Theoretical Q4 Base');
legend('boxoff')
legend('Location','southeast')

hold off;

%% Plot of Base Current vs. Beta
figure ('Name', 'Base Current vs. Current Gain')

semilogx(Ib_Q1, Beta_Q1,'r*')
hold on;
semilogx(Ib_Q1, Beta_Q2,'g+')
hold on;
semilogx(Ib_Q1, Beta_Q3,'b*')
hold on;
semilogx(Ib_Q1, Beta_Q4,'k+')

%Labels
title( "Base Current vs Current Gain");
xlabel("Base Current (Amps)");
ylabel("Current Gain");

legend('Q1 Beta','Q2 Beta','Q3 Beta','Q4 Beta');
legend('boxoff')
legend('Location','southeast')

%Axis
xlim([0 6*10^-5])
ylim([-3000 2700])

hold off;

%% Percent Differnce Collector Currents
figure ('Name', 'Percent Difference');

Ic_mean = (Ic_Q1 + Ic_Q2 + Ic_Q3 + Ic_Q4)./4;

Ic_Q1_diff = 100 * (abs(Ic_Q1 - Ic_mean)./((Ic_Q1 + Ic_mean)./2));
Ic_Q2_diff = 100 * (abs(Ic_Q2 - Ic_mean)./((Ic_Q2 + Ic_mean)./2))
Ic_Q3_diff = 100 * (abs(Ic_Q3 - Ic_mean)./((Ic_Q3 + Ic_mean)./2));
Ic_Q4_diff = 100 * (abs(Ic_Q4 - Ic_mean)./((Ic_Q4 + Ic_mean)./2));

plot(Vin_Base_Q1_Exp1,Ic_Q1_diff,'r*','MarkerSize',5)
hold on;
plot(Vin_Base_Q1_Exp1,Ic_Q2_diff,'g*','MarkerSize',5)
hold on;
plot(Vin_Base_Q1_Exp1,Ic_Q3_diff,'b*','MarkerSize',5)
hold on;
plot(Vin_Base_Q1_Exp1,Ic_Q4_diff,'m*','MarkerSize',5)
% hold on;

legend('Q1 Percent Difference','Q2 Percent Difference','Q3 Percent Difference','Q4 Percent Difference');
legend('boxoff')
legend('Location','northeast')

%Labels
title( "Percent Difference for MAT14 Transistor Array");
xlabel("Voltage (Volts)");
ylabel("Percent Difference");

xlim([.3 .8])
ylim([0 16])

hold off;

