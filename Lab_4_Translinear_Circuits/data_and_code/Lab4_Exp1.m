load ("Exp1_data_collection.mat")

%Ie = Ic + Ib

% Q1
Ib_Q1 = (Exp1_Iout_Q1_Base);
Ie_Q1 = (Exp1_Iout_Q1_Emitter);
Ic_Q1 = -1*(Ie_Q1-Ib_Q1);

Beta_Q1 = Ic_Q1 ./ Ib_Q1;
% Q2
Ib_Q2 = (Exp1_Iout_Q2_Base);
Ie_Q2 = (Exp1_Iout_Q2_Emitter);
Ic_Q2 = -1*(Ie_Q2-Ib_Q2);

Beta_Q2 = Ic_Q2 ./ Ib_Q2;
% Q3
Ib_Q3 = (Exp1_Iout_Q3_Base);
Ie_Q3 = (Exp1_Iout_Q3_Emitter);
Ic_Q3 = -1*(Ie_Q3-Ib_Q3);

Beta_Q3 = Ic_Q3 ./ Ib_Q3;
% Q4
Ib_Q4 = (Exp1_Iout_Q4_Base);
Ie_Q4 = (Exp1_Iout_Q4_Emitter);
Ic_Q4 = -1*(Ie_Q4-Ib_Q4);

Beta_Q4 = Ic_Q4 ./ Ib_Q4;

%% Plot of Base Voltage vs. Collect + Base Current
% Plot 1/3: Semilog Voltage Transfer Characteristic.
% Experimental.
% Collector currents.
semilogy(Exp1_Vin_Q1, Ic_Q1,  '*r','MarkerSize',2);
hold on;
semilogy(Exp1_Vin_Q2, Ic_Q2,  '*g','MarkerSize',2);
semilogy(Exp1_Vin_Q3, Ic_Q3,  '*b','MarkerSize',2);
semilogy(Exp1_Vin_Q4, Ic_Q4,  '*k','MarkerSize',2);

% Base currents.
semilogy(Exp1_Vin_Q1, Exp1_Iout_Q1_Base,  '*r','MarkerSize',2);
semilogy(Exp1_Vin_Q2, Exp1_Iout_Q2_Base,  '*g','MarkerSize',2);
semilogy(Exp1_Vin_Q3, Exp1_Iout_Q3_Base,  '*b','MarkerSize',2);
semilogy(Exp1_Vin_Q4, Exp1_Iout_Q4_Base,  '*k','MarkerSize',2);

% Theoretical
Q1_Ib_fit = polyfit(Exp1_Vin_Q1(21:71)',log((Exp1_Iout_Q1_Base(21:71)))',1);
Q1_Ib_theo= polyval(Q1_Ib_fit,Exp1_Vin_Q1(21:71));
Q1_Ic_fit = polyfit(Exp1_Vin_Q1(21:71)',log((Ic_Q1(21:71)))',1);
Q1_Ic_theo= polyval(Q1_Ic_fit,Exp1_Vin_Q1(21:71));

Q2_Ib_fit = polyfit(Exp1_Vin_Q2(21:71)',log((Exp1_Iout_Q2_Base(21:71)))',1);
Q2_Ib_theo= polyval(Q2_Ib_fit,Exp1_Vin_Q2(21:71));
Q2_Ic_fit = polyfit(Exp1_Vin_Q2(21:71)',log((Ic_Q2(21:71)))',1);
Q2_Ic_theo= polyval(Q2_Ic_fit,Exp1_Vin_Q2(21:71));

Q3_Ib_fit = polyfit(Exp1_Vin_Q3(21:71)',log((Exp1_Iout_Q3_Base(21:71)))',1);
Q3_Ib_theo= polyval(Q3_Ib_fit,Exp1_Vin_Q3(21:71));
Q3_Ic_fit = polyfit(Exp1_Vin_Q3(21:71)',log((Ic_Q3(21:71)))',1);
Q3_Ic_theo= polyval(Q3_Ic_fit,Exp1_Vin_Q3(21:71));

Q4_Ib_fit = polyfit(Exp1_Vin_Q4(21:71)',log((Exp1_Iout_Q4_Base(21:71)))',1);
Q4_Ib_theo= polyval(Q4_Ib_fit,Exp1_Vin_Q4(21:71));
Q4_Ic_fit = polyfit(Exp1_Vin_Q4(21:71)',log((Ic_Q4(21:71)))',1);
Q4_Ic_theo= polyval(Q4_Ic_fit,Exp1_Vin_Q4(21:71));

semilogy(Exp1_Vin_Q1(21:71), exp(Q1_Ib_theo),'r')
semilogy(Exp1_Vin_Q2(21:71), exp(Q2_Ib_theo),'g')
semilogy(Exp1_Vin_Q3(21:71), exp(Q3_Ib_theo),'b')
semilogy(Exp1_Vin_Q4(21:71), exp(Q4_Ib_theo),'k')


semilogy(Exp1_Vin_Q1(21:71), exp(Q1_Ib_theo),'r')
semilogy(Exp1_Vin_Q2(21:71), exp(Q2_Ib_theo),'g')
semilogy(Exp1_Vin_Q3(21:71), exp(Q3_Ib_theo),'b')
semilogy(Exp1_Vin_Q4(21:71), exp(Q4_Ic_theo),'k')


title( "MAT14 Transistor Array Current-Voltage Characteristics");
ylabel("Current (Amps)");
xlabel("Base Voltage (Volts)");

legend('Experimental Q1 Emitter',' Experimental Q2 Emitter','Experimental Q3 Emitter','Experimental Q4 Emitter', 'Experimental Q1 Base', 'Experimental Q2 Base', 'Experimental Q3 Base', 'Experimental Q4 Base', 'Theoretical Q1 Emitter',' Theoretical Q2 Emitter','Theoretical Q3 Emitter','Theoretical Q4 Emitter', 'Theoretical Q1 Base', 'Theoretical Q2 Base', 'Theoretical Q3 Base', 'Theoretical Q4 Base');
legend('boxoff')
legend('Location','southeast')

hold off;

%% Plot of Base Current vs. Beta
figure ('Name', 'Base Current vs. Beta')

semilogy(Ib_Q1, Beta_Q1,'r--')
hold on;
semilogy(Ib_Q1, Beta_Q2,'g--')
hold on;
semilogy(Ib_Q1, Beta_Q3,'b--')
hold on;
semilogy(Ib_Q1, Beta_Q4,'k--')

%Labels
title( "Base Current vs Beta");
ylabel("Current (Amps)");
xlabel("Beta");

%Axis

hold off;

