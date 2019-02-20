load('collected_data.mat');

% Calculate the Ut and Is for the circuit with each resistor
R100 = 100;
R1K = 1000;
R10K = 10000;

% use indices 8-12 because first few points are so close to zero they're
% basically garbage in semilog plot
p100 = polyfit(Vin_Exp2_100(8:12), log(Iout_Exp2_100(8:12)), 1);
Ut100 = abs(1/p100(1));
Is100 = abs(exp(p100(2)));

p1K = polyfit(Vin_Exp2_1K(8:12), log(Iout_Exp2_1K(8:12)), 1);
Ut1K = abs(1/p1K(1));
Is1K = abs(exp(p1K(2)));

p10K = polyfit(Vin_Exp2_10K(8:12), log(Iout_Exp2_10K(8:12)), 1);
Ut10K = abs(1/p10K(1));
Is10K = abs(exp(p10K(2)));

Ion100 = Ut100/100;
Ion1K = Ut1K/1000;
Ion10K = Ut10K/10000;
%% 
% First plot : Voltage - Voltage
% Experimental 
load('collected_data.mat');

plot(Vin_Exp2_100, Vout_Exp2_100, '*r','MarkerSize',2);
hold on;
plot(Vin_Exp2_1K, Vout_Exp2_1K, '*b','MarkerSize',2);
plot(Vin_Exp2_10K, Vout_Exp2_10K, '*g','MarkerSize',2);

% Theoretical will be some piecewise function.
for k = 1:length(Vin_Exp2_100)
    Vout100(k) = Ut * Vin_Exp2_100(k);
end


% TODO Theoretical fits for voltage-voltage plot.


title( "Diode-Connected Transistor Voltage-Voltage Response");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')


hold off;

%%
%THEORETICAL PLOT WORKS
% Third plot : Linear plot of current-voltage for 100 ohms

load('collected_data.mat');


plot(Vin_Exp2_100, Iout_Exp2_100, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.
% This is complicated becuase our Von is experimental as well.

% TODO Theoretical fits for voltage-voltage plot.
%Find Von from this plot's x-intercept of the linear part
Von100 = roots(polyfit(Vin_Exp2_100(13:51), Iout_Exp2_100(13:51), 1));
for i = 1:length(Vin_Exp2_100)
    if (Vin_Exp2_100(i) < Von100 - 0.01) %subtract 0.01 to smooth out the theoretical fit
        TheoreticalIout100(i) = Is100 * exp(Vin_Exp2_100(i)/Ut100);
    else
    TheoreticalIout100(i) = (Vin_Exp2_100(i)-Von100)/R100;
    end
end
plot(Vin_Exp2_100(14:53), TheoreticalIout100(14:53));

title( "Diode-Connected Transistor Current-Voltage Reponse - 100 Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

hold off;

% Fourth plot : Linear plot of current-voltage for 1K ohms
figure
plot(Vin_Exp2_1K, Iout_Exp2_1K, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.
% This is complicated becuase our Von is experimental as well.

% TODO Theoretical fits for voltage-voltage plot.
%Find Von from this plot's x-intercept of the linear part
Von1K = roots(polyfit(Vin_Exp2_1K(13:51), Iout_Exp2_1K(13:51), 1));
for i = 1:length(Vin_Exp2_1K)
    if (Vin_Exp2_1K(i) < Von1K - 0.01) %subtract 0.01 to smooth out the theoretical fit
        TheoreticalIout1K(i) = Is1K * exp(Vin_Exp2_1K(i)/Ut1K);
    else
    TheoreticalIout1K(i) = (Vin_Exp2_1K(i)-Von1K)/R1K;
    end
end
plot(Vin_Exp2_1K(13:51), TheoreticalIout1K(13:51));

title( "Diode-Connected Transistor Current-Voltage Reponse - 1K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

hold off;

% Fifth plot : Linear plot of current-voltage for 10K ohms
figure
plot(Vin_Exp2_10K, Iout_Exp2_10K, '*r','MarkerSize',2);
hold on;
% Theoretical will be some piecewise function.
% This is complicated becuase our Von is experimental as well.

% TODO Theoretical fits for voltage-voltage plot.
%Find Von from this plot's x-intercept of the linear part
Von10K = roots(polyfit(Vin_Exp2_10K(13:51), Iout_Exp2_10K(13:51), 1));
for i = 1:length(Vin_Exp2_10K)
    if (Vin_Exp2_10K(i) < Von10K - 0.01) %subtract 0.01 to smooth out the theoretical fit
        TheoreticalIout10K(i) = Is100 * exp(Vin_Exp2_10K(i)/Ut10K);
    else
    TheoreticalIout10K(i) = (Vin_Exp2_10K(i)-Von10K)/R10K;
    end
end
plot(Vin_Exp2_10K(12:51), TheoreticalIout10K(12:51));

title( "Diode-Connected Transistor Current-Voltage Reponse - 10K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

hold off;
%%
% Sixth plot : Von as a function of Resistance
load('collected_data.mat');
hold on;

% Experimental
% Plot each indivdual points because I'm not about to play God.
figure
plot(R100, Von100, '*r', 'MarkerSize', 10);
hold on
plot(R1K, abs(Von1K), '*r', 'MarkerSize', 10);
hold on
plot(R10K, abs(Von10K), '*r', 'MarkerSize', 10);

title( "Voltage On as a Function of Resistance");
ylabel("Voltage On (Volts)");
xlabel("Resistance (Ohms)");

legend('Experimental Voltage On', 'Theoretical Voltage On');
legend('boxoff')
legend('Location','northeast')

hold off;

%% Seventh plot : Ion as a function of R
% Sixth plot : Ion as a function of Resistance

% Experimental
% Plot each indivdual points because I'm not about to play God.
figure 
plot(R100, abs(Ion100), '*r', 'MarkerSize', 10);
% plot(R100, abs(TIon100), '*b', 'MarkerSize', 10);
hold on
plot(R1K, abs(Ion1K), '*g', 'MarkerSize', 10);
% plot(R1K, abs(TIon1K), '*b', 'MarkerSize', 10);
hold on
plot(R10K, abs(Ion10K), '*b', 'MarkerSize', 10);
% plot(R10K, abs(TIon10K), '*b', 'MarkerSize', 10);

title( "Current On as a Function of Resistance");
ylabel("Current On (Amps)");
xlabel("Resistance (Ohms)");

legend('Experimental Current On');
legend('boxoff')
legend('Location','northeast')

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
semilogy(Vin_Exp2_100(1:14), TheoreticalIout100(1:14), '-k');
hold on
semilogy(Vin_Exp2_1K(1:14), TheoreticalIout1K(1:14), '-k');
semilogy(Vin_Exp2_10K(1:12), TheoreticalIout10K(1:12), '-k');

title( "Diode-Connected Transistor Current-Voltage Response");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental, 100 Ohms', 'Experimental, 1K Ohms','Experimental, 10K Ohms','Theoretical, 100 Ohms', 'Theoretical, 1K Ohms','Theoretical, 10K Ohms')
legend('boxoff')
legend('Location','southeast')

hold off;