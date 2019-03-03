clear
load('collected_data.mat');

%% Set Up

Ie100 = Iout_Emitter_Exp2_100;
Ie1K = Iout_Emitter_Exp2_1K;
Ie10K = Iout_Emitter_Exp2_10K;

Ib100 = Iout_Base_Exp2_100;
Ib1K = Iout_Base_Exp2_1K;
Ib10K = Iout_Base_Exp2_10K;

Vb = Vin_Exp2_100;

Ic100 = (Ie100 - Ib100);
Ic1K = (Ie1K - Ib1K);
Ic10K = (Ie10K - Ib10K);

p100 = polyfit(Vb(31:51), log(abs(Ic100(31:51))), 1);
Ut100 = abs(1/p100(1));
Is100 = abs(exp(p100(2)));

p1K = polyfit(Vb(31:51), log(abs(Ic1K(31:51))), 1);
Ut1K = abs(1/p1K(1));
Is1K = abs(exp(p1K(2)));

p10K = polyfit(Vb(31:51), log(abs(Ic10K(31:51))), 1);
Ut10K = abs(1/p10K(1));
Is10K = abs(exp(p10K(2)));

Von100 = roots(p100);
Von1K = roots(p1K);
Von10K = roots(p10K);

for i = 1:length(Vb)
    if (Vb(i) < Von100)
        IcTheo100(i) = Is100 * exp(Vb(i)/Ut100);
    else
    IcTheo100(i) = (Vb(i)-Von100)/100;
    end
end

for j = 1:length(Vb)
    if (Vb(j) < Von1K)
        IcTheo1K(j) = Is1K * exp(Vb(j)/Ut1K);
    else
    IcTheo1K(j) = (Vb(j)-Von1K)/1000;
    end
end

for k = 1:length(Vb)
    if (Vb(k) < Von10K)
        IcTheo100(k) = Is10K * exp(Vb(k)/Ut10K);
    else
    IcTheo10K(k) = (Vb(k)-Von10K)/10000;
    end
end
%% Semilog Plot

figure
semilogy(Vb(31:501), abs(Ic100(31:501)), '*', 'color', [1,0.6,0.7], 'MarkerSize', 2.5);
hold on
semilogy(Vb(31:501), abs(Ic1K(31:501)), '*', 'color', [0.4,1,0.5], 'MarkerSize', 2.5);
hold on
semilogy(Vb(31:501), abs(Ic10K(31:501)), '*', 'color', [0.4,0.79,1], 'MarkerSize', 2.5);
hold on
title('Collector Current as a Function of Base Voltage');
semilogy(Vin_Exp2_100(29:63), abs(IcTheo100(29:63)), 'r-', 'LineWidth', 1);
hold on
semilogy(Vin_Exp2_1K(29:55), abs(IcTheo1K(29:55)), 'g-', 'LineWidth', 1);
hold on
semilogy(Vin_Exp2_1K(29:50), abs(IcTheo1K(29:50)), 'b-', 'LineWidth', 1);
legend('Ic when R=100', 'Ic when R=1K', 'Ic when R=10K', 'Theoretical Fit R=100', 'Theoretical Fit R=1K', 'Theoretical Fit R=10K');
legend('location', 'southeast');
xlabel('Base Voltage (V)');
ylabel('Collector Current (A)');
hold off

%% Linear plot for each R
figure
plot(Vin_Exp2_100, abs(Ic100), 'o', 'color', [1,0.6,0.7], 'MarkerSize', 2);
hold on
plot(Vb(82:501), IcTheo100(82:501), 'k-');
title('Collector Current vs. Base Voltage, R=100');
xlabel('Base Voltage (V)');
ylabel('Collector Current (A)');
legend('Experimental Data', 'Theoretical Fit');
legend('location', 'southeast');
hold off

figure
plot(Vin_Exp2_1K, abs(Ic1K), 'o', 'color', [0.4,1,0.5], 'MarkerSize', 2);
hold on
plot(Vb(82:501), IcTheo1K(82:501), 'k-');
title('Collector Current vs. Base Voltage, R=1K');
xlabel('Base Voltage (V)');
ylabel('Collector Current (A)');
legend('Experimental Data', 'Theoretical Fit');
legend('location', 'southeast');
hold off

figure
plot(Vin_Exp2_10K, abs(Ic10K), 'o', 'color', [0.4,0.79,1], 'MarkerSize', 2);
hold on
plot(Vb(82:501), IcTheo10K(82:501), 'k-');
title('Collector Current vs. Base Voltage, R=10K');
xlabel('Base Voltage (V)');
ylabel('Collector Current (A)');
legend('Experimental Data', 'Theoretical Fit');
legend('location', 'southeast');
hold off

%% Incremental Base Resistance, Rb

% Theoretical
rbTheo100 = Ut100./abs(Ib100);
rbTheo1K = Ut1K./abs(Ib1K);
rbTheo10K = Ut10K./abs(Ib10K);

% Experimental
rb100 = (diff(Vb(61:261)))./(diff(abs(Ib100(61:261))));

figure
loglog(rbTheo100, Ib100, '*', 'color', [1,0.6,0.7], 'MarkerSize', 3);
hold on
loglog(rbTheo1K, Ib1K, '*', 'color', [0.4,1,0.5], 'MarkerSize', 3);
hold on
loglog(rbTheo10K, Ib10K, '*', 'color', [0.4,0.79,1], 'MarkerSize', 3);
hold on
loglog(rb100, Ib100(62:261), 'k*');
hold off

%% Emitter Degeneration, Gm
Gm100 = diff(Ic100(61:261)) ./ diff(Vb(61:261));
Gm1K = diff(Ic1K) ./ diff(Vb);
Gm10K = diff(Ic10K) ./ diff(Vb);

GmTheo100 = Ut100./(Ib100);
figure
loglog(Ic100(61:260), Gm100, 'ro');
hold on
loglog(Ic1K(1:end-1), Gm1K, 'bo');
hold on
loglog(Ic10K(1:end-1), Gm10K, 'go');
hold off
