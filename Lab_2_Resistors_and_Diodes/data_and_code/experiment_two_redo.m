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

% Calculate Ion from Ut and Is
Ion100 = Ut100/100;
Ion1K = Ut1K/1000;
Ion10K = Ut10K/10000;

% Calculate Von for circuit with each R
Von100 = roots(polyfit(Vin_Exp2_100(13:54), Iout_Exp2_100(13:54), 1));
Von1K = roots(polyfit(Vin_Exp2_1K(13:51), Iout_Exp2_1K(13:51), 1));
Von10K = roots(polyfit(Vin_Exp2_10K(12:51), Iout_Exp2_10K(12:51), 1));


% Calculate Theoretical SVMI for circuit with each R
TheoIout100 = polyfit(Vin_Exp2_100(13:54), Iout_Exp2_100(13:54), 1);
for i = 13:54
    TheoIout100Y(i) = TheoIout100(1) * Vin_Exp2_100(i) + TheoIout100(2);
end

TheoIout1K = polyfit(Vin_Exp2_1K(13:51), Iout_Exp2_1K(13:51), 1);
for j = 13:51
    TheoIout1KY(j) = TheoIout1K(1) * Vin_Exp2_1K(j) + TheoIout1K(2);
end

TheoIout10K = polyfit(Vin_Exp2_10K(12:51), Iout_Exp2_10K(12:51), 1);
for k = 12:51
    TheoIout10KY(k) = TheoIout10K(1) * Vin_Exp2_10K(k) + TheoIout10K(2);
end

% Calculate x-intercept of polyfit (to check if it fits

%%
%Plot data for SVMI on linear scale with polyfit on linetitle( "Diode-Connected Transistor Current-Voltage Reponse - 10K Ohm Resistor");
figure
plot(Vin_Exp2_100, Iout_Exp2_100, '*r','MarkerSize',2);
hold on
plot(Vin_Exp2_100(13:54), TheoIout100Y(13:54));
ylim([0, 0.02]);
title( "Diode-Connected Transistor Current-Voltage Reponse - 100 Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");
legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

figure
plot(Vin_Exp2_1K, Iout_Exp2_1K, '*r','MarkerSize',2);
hold on
plot(Vin_Exp2_1K(13:51), TheoIout1KY(13:51));
title( "Diode-Connected Transistor Current-Voltage Reponse - 1K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");
legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

figure
plot(Vin_Exp2_10K, Iout_Exp2_10K, '*r','MarkerSize',2);
hold on
plot(Vin_Exp2_10K(12:51), TheoIout10KY(12:51));
title( "Diode-Connected Transistor Current-Voltage Reponse - 10K Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");
legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')

%%
%plot voltage voltage plot for circuit with each resistor all on one plot

figure
plot(Vin_Exp2_100, Vout_Exp2_100, 'or','MarkerSize',3);
title( "Diode-Connected Transistor Voltage-Voltage Reponse");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");
hold on
plot(Vin_Exp2_1K, Vout_Exp2_1K, 'ob','MarkerSize',3);
hold on
plot(Vin_Exp2_10K, Vout_Exp2_10K, 'og','MarkerSize',3);

%theoretical polyfit (linear from 0 to 0.5 Vin)

TheoVout100 = polyfit(Vin_Exp2_100(1:11), Vout_Exp2_100(1:11), 1);
for m = 1:11
    TheoVout100Y(m) = TheoVout100(1) * Vin_Exp2_100(m) + TheoVout100(2);
end

%plot theoretical polyfit for linear part
plot(Vin_Exp2_100(1:11), TheoVout100Y(1:11));
hold off

legend('Experimental Vout with R=100', 'Experimental Vout with R=1K', 'Experimental Vout with R=10K', 'Theoretical Vout before Von voltage')
legend('boxoff')
legend('Location','southeast')

%%
% plot voltage in current out for circuit with each R on one plot
figure
semilogy(Vin_Exp2_100, Iout_Exp2_100, 'or','MarkerSize',3);
title( "Diode-Connected Transistor Current-Voltage Reponse - 100 Ohm Resistor");
ylabel("Current Out (Amps)");
xlabel("Voltage In (Volts)");

legend('Experimental Current Response', 'Theoretical Current Response');
legend('boxoff')
legend('Location','southeast')
hold on
semilogy(Vin_Exp2_1K, Iout_Exp2_1K, 'ob','MarkerSize',3);
hold on
semilogy(Vin_Exp2_10K, Iout_Exp2_10K, 'og','MarkerSize',3);


% What to do for error if all theoretical fits are just polyfits?
% What to write for analysis? Feels like I've thrown out all useful part of
% the theoretical work I did
% What does voltage-voltage plot tell us?
% interesting that its linear and slope 1