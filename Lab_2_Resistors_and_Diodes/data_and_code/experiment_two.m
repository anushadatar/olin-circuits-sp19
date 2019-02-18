clear
load('collected_data.mat');
% R=100
p100 = polyfit(Vin_Exp2_100, log(Iout_Exp2_100), 1);
Ut100 = real(1/p100(1));
Is100 = real(exp(p100(2)));

p1K = polyfit(Vin_Exp2_1K, log(Iout_Exp2_1K), 1);
Ut1K = 1/p1K(1);
Is1K = exp(p1K(2));

p10K = polyfit(Vin_Exp2_100, log(Iout_Exp2_100), 1);
Ut10K = 1/p10K(1);
Is10K = exp(p10K(2));

Ion100 = Ut100/100
Ion1K = Ut1K/1000;
Ion10K = Ut10K/10000;

Von100 = Ut100 * log(Ion100/Is100);
VonIndex100 = 41;
Von1K = Ut1K * log(Ion1K/Is1K);
Von10K = Ut10K * log(Ion10K/Is10K);
%% 
% First plot : Voltage - Voltage
% Experimental 
load('collected_data.mat');

plot(Vin_Exp2_100, Vout_Exp2_100, '*r','MarkerSize',2);
hold on;
plot(Vin_Exp2_1K, Vout_Exp2_1K, '*b','MarkerSize',2);
plot(Vin_Exp2_10K, Vout_Exp2_10K, '*g','MarkerSize',2);
% Theoretical will be some piecewise function.

% TODO Theoretical fits for voltage-voltage plot.



title( "Diode-Connected Transistor Voltage Response");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')


hold off;
%% Current-Voltage Plot
%% 
% First plot : Current - Voltage Semilog plot
% Experimental 
load('collected_data.mat');

semilogy(Vin_Exp2_100, Iout_Exp2_100, '*r','MarkerSize',2);
hold on;
semilogy(Vin_Exp2_1K, Iout_Exp2_1K, '*b','MarkerSize',2);
semilogy(Vin_Exp2_10K, Iout_Exp2_10K, '*g','MarkerSize',2);
% Theoretical will be some piecewise function.

% TODO Theoretical fits for current-voltage plot.



title( "Diode-Connected Transistor Current Response");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')


hold off;
%%

