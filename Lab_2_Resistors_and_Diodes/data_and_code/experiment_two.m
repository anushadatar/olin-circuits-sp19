clear
load('collected_data.mat');
% R=100
R100 = 100;
R1K = 1000;
R10K = 10000;
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



title( "Diode-Connected Transistor Voltage-Voltage Response");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')


hold off;
%% 
% Second plot : Current - Voltage Semilog plot
% Experimental 
load('collected_data.mat');

semilogy(Vin_Exp2_100, Iout_Exp2_100, '*r','MarkerSize',2);
hold on;
semilogy(Vin_Exp2_1K, Iout_Exp2_1K, '*b','MarkerSize',2);
semilogy(Vin_Exp2_10K, Iout_Exp2_10K, '*g','MarkerSize',2);
% Theoretical will be some piecewise function.

% TODO Theoretical fits for current-voltage plot.



title( "Diode-Connected Transistor Current-Voltage Response");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')


hold off;
%%
% Third plot : Linear plot of current-voltage for 100 ohms

load('collected_data.mat');

plot(Vin_Exp2_100, Iout_Exp2_100, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.
% This is complicated becuase our Von is experimental as well.

% TODO Theoretical fits for voltage-voltage plot.



title( "Diode-Connected Transistor Current-Voltage Reponse - 100 Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response.');
legend('boxoff')
legend('Location','southeast')


hold off;
%%
% Fourth plot : Linear plot of current-voltage for 1K ohms

load('collected_data.mat');

plot(Vin_Exp2_1K, Iout_Exp2_1K, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.

% TODO Theoretical fits for voltage-voltage plot.



title( "Diode-Connected Transistor Current-Voltage Reponse - 1K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response');
legend('boxoff');
legend('Location','southeast');


hold off;
%%
% Fifth plot : Linear plot of current-voltage for 10K ohms

load('collected_data.mat');

plot(Vin_Exp2_10K, Iout_Exp2_10K, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.

% TODO Theoretical fits for voltage-voltage plot.


title( "Diode-Connected Transistor Current-Voltage Reponse - 10K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response');

legend('boxoff')
legend('Location','southeast')


hold off;
%%
% Sixth plot : Von as a function of Resistance
load('collected_data.mat');
hold on;
% Theoretical - not sure if necessary because we calculated this anyways.
TVon100 = Ut100.*log(Ut100./(R100*Is100));
TVon1K = Ut100.*log(Ut1K./(R1K*Is1K));
TVon10K = Ut100.*log(Ut10K./(R10K*Is10K));

% Experimental
% Plot each indivdual points because I'm not about to play God.
plot(R100, Von100, '*r', 'MarkerSize', 10);
%plot(R100, TVon100, '*b', 'MarkerSize', 10);

plot(R1K, abs(Von100), '*r', 'MarkerSize', 10);
%plot(R1K, abs(TVon1K), '*b', 'MarkerSize', 10);

plot(R10K, abs(Von10K), '*r', 'MarkerSize', 10);
%plot(R10K, abs(TVon10K), '*b', 'MarkerSize', 10);

title( "Voltage On as a Function of Resistance");
ylabel("Voltage On (Volts)");
xlabel("Resistance (Ohms)");

legend('Experimental Voltage On', 'Theoreitcal Voltage On');
legend('boxoff')
legend('Location','northeast')

hold off;

%% Seventh plot : Ion as a function of R
% Sixth plot : Ion as a function of Resistance
load('collected_data.mat');
hold on;
% Theoretical - not really necessary because this is how we calculated exp.
TIon100 = Ut100./R100;
TIon1K = Ut100./R1K;
TIon10K = Ut100./R10K;

% Experimental
% Plot each indivdual points because I'm not about to play God.
plot(R100, abs(Ion100), '*r', 'MarkerSize', 10);
% plot(R100, abs(TIon100), '*b', 'MarkerSize', 10);

plot(R1K, abs(Ion100), '*r', 'MarkerSize', 10);
% plot(R1K, abs(TIon1K), '*b', 'MarkerSize', 10);

plot(R10K, abs(Ion10K), '*r', 'MarkerSize', 10);
% plot(R10K, abs(TIon10K), '*b', 'MarkerSize', 10);

title( "Current On as a Function of Resistance");
ylabel("Current On (Amps)");
xlabel("Resistance (Ohms)");

legend('Experimental Current On');
legend('boxoff')
legend('Location','northeast')

hold off;