load ("Exp1_data_collection.mat")

%Ie = Ic + Ib

%% Q1
Ib_Q1 = (Exp1_Iout_Q1_Base);
Ie_Q1 = (Exp1_Iout_Q1_Emitter);
Ic_Q1 = -1*(Ie_Q1-Ib_Q1);

Beta_Q1 = Ic_Q1 ./ Ib_Q1;
%% Q2
Ib_Q2 = (Exp1_Iout_Q2_Base);
Ie_Q2 = (Exp1_Iout_Q2_Emitter);
Ic_Q2 = -1*(Ie_Q2-Ib_Q2);

Beta_Q2 = Ic_Q2 ./ Ib_Q2;
%% Q3
Ib_Q3 = (Exp1_Iout_Q3_Base);
Ie_Q3 = (Exp1_Iout_Q3_Emitter);
Ic_Q3 = -1*(Ie_Q3-Ib_Q3);

Beta_Q3 = Ic_Q3 ./ Ib_Q3;
%% Q4
Ib_Q4 = (Exp1_Iout_Q4_Base);
Ie_Q4 = (Exp1_Iout_Q4_Emitter);
Ic_Q4 = -1*(Ie_Q4-Ib_Q4);

Beta_Q4 = Ic_Q4 ./ Ib_Q4;

%% Plot of Base Voltage vs. Collect + Base Current

clf;
figure ('Name','Base Voltage vs. Collect + Base Current')

%Experimental
semilogy(Exp1_Vin_Q1, Ib_Q1,'r*')
hold on;
semilogy(Exp1_Vin_Q1, Ic_Q1,'r*')
hold on;

semilogy(Exp1_Vin_Q2, Ib_Q2,'g*')
hold on;
semilogy(Exp1_Vin_Q2, Ic_Q2,'g*')
hold on;

semilogy(Exp1_Vin_Q3, Ib_Q3,'m*')
hold on;
semilogy(Exp1_Vin_Q3, Ic_Q3,'m*')
hold on;

semilogy(Exp1_Vin_Q4, Ib_Q4,'k*')
hold on;
semilogy(Exp1_Vin_Q4, Ic_Q4,'k*')
hold on;

%Labels
title( "Voltage vs. Current");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

% legend()
% legend('boxoff')
% legend('Location','northwest')

hold off;

%% Plot of Base Current vs. Beta
clf;
figure ('Name', 'Base Current vs. Beta')

semilogy(Ib_Q1, Beta_Q1)
hold on;
semilogy(Ib_Q1, Beta_Q2)
hold on;
semilogy(Ib_Q1, Beta_Q3)
hold on;
semilogy(Ib_Q1, Beta_Q4)

%Labels
title( "Base Current vs Beta");
ylabel("Current (Amps)");
xlabel("Beta");

hold off;

