clear

load('collected_data.mat');

figure;
semilogy( Vout_Exp1_1,Iin_Exp1_1,'*b','MarkerSize',2) %current-voltahe
hold on;
semilogy(Vin_Exp1_2,Iout_Exp1_2, '*r','MarkerSize',2) %voltage-current
hold on;
CV_theo = (7.055.*(Vout_Exp1_1)).^21.63
semilogy(Vout_Exp1_1,CV_theo,'-k','MarkerSize',5)

title( "TITLE");
ylabel("Current (Amps)");
xlabel("Voltage (Volts)");

legend('Current-Voltage Characteristic', 'Voltage-Current Characteristic','Current-Voltage Theoretical','Voltage-Current Theoretical')
legend('boxoff')
legend('Location','northwest')


hold off