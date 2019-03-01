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

get_fit = polyfit(Vin_Exp1(41:91), log(Iout_Base_Exp1(41:91)), 1);
Ut = abs(1/get_fit(1));
Is = abs(exp(get_fit(2)));

Beta100 = Ic100 ./ Ib100;
Beta1K = Ic1K ./ Ib1K;
Beta10K = Ic10K ./ Ib10K;

for i = 1:length(Vb)
    Ve100(i) = Vb(i) - (Ut * log((Beta100(i)*Ib100(i))/Is));
end

for j = 1:length(Vb)
    Ve1K(j) = Vb(j) - (Ut * log ((Beta1K(j)*Ib1K(j))/Is));
end

for k = 1:length(Vb)
    Ve10K(k) = Vb(k) - (Ut * log ((Beta10K(k)*Ib10K(k))/Is));
end

%% Semilog Plot

Vb100 = Vin_Exp2_100;
Vb1K = Vin_Exp2_1K;
Vb10K = Vin_Exp2_10K; 

Ut = 0.0261;

Is100 = 2.462602378621604e-14;
Is1K = 1.090644616854945e-13;
Is10K = 8.296609842239291e-13;

% calculate Ic from Ib and Ie
Ic100 = (Iout_Emitter_Exp2_100 - Iout_Base_Exp2_100);
Ic1K = (Iout_Emitter_Exp2_1K - Iout_Base_Exp2_1K);
Ic10K = (Iout_Emitter_Exp2_10K - Iout_Base_Exp2_10K);

for m = 1:length(Ic100)
    IcTheo100(m) = Is * exp((Vb(m) - Ve100(m))/Ut);
end

for n = 1:length(Ic1K)
    IcTheo1K(n) = Is * exp((Vb(n) - Ve1K(n))/Ut);
end

for p = 1:length(Ic10K)
    IcTheo10K(p) = Is * exp((Vb(p) - Ve10K(p))/Ut);
end

figure
semilogy(Vin_Exp2_100, Ic100, 'r*');
hold on
semilogy(Vin_Exp2_1K, Ic1K, 'g*');
hold on
semilogy(Vin_Exp2_10K, Ic10K, 'b*');
hold on
title('Collector Current calculated from Base and Emmiter Currents');
legend('Ic when R=100', 'Ic when R=1K', 'Ic when R=10K');
semilogy(Vin_Exp2_100, IcTheo100, 'r-');
hold on
semilogy(Vin_Exp2_1K, IcTheo1K, 'g-');
hold on
semilogy(Vin_Exp2_10K, IcTheo10K, 'b-');
hold off

%% Linear plot for each R
figure
plot(Vin_Exp2_100, Ic100, 'ro', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=100');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');
figure
plot(Vin_Exp2_1K, Ic1K, 'go', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=1K');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');
figure
plot(Vin_Exp2_10K, Ic10K, 'bo', 'MarkerSize', 0.5);
title('Linear Ic Plot for R=10K');
xlabel('Input Voltage (V)');
ylabel('Collector Current (A)');

%% Incremental Base Resistance, Rb
Rb100 = diff(Vin_Exp2_100) ./ diff(Iout_Base_Exp2_100);
Rb1K = diff(Vin_Exp2_1K) ./ diff(Iout_Base_Exp2_1K);
Rb10K = diff(Vin_Exp2_10K) ./ diff(Iout_Base_Exp2_10K);
figure
loglog(Iout_Base_Exp2_100(1:end-1), Rb100);
hold on
loglog(Iout_Base_Exp2_1K(1:end-1), Rb1K);
hold on
loglog(Iout_Base_Exp2_10K(1:end-1), Rb10K);
hold off

%% Emitter Degeneration, Gm
Gm100 = diff(Ic100) ./ diff(Vin_Exp2_100);
Gm1K = diff(Ic1K) ./ diff(Vin_Exp2_1K);
Gm10K = diff(Ic10K) ./ diff(Vin_Exp2_10K);
figure
loglog(Ic100(1:end-1), Gm100, 'ro');
hold on
loglog(Ic1K(1:end-1), Gm1K, 'bo');
hold on
loglog(Ic10K(1:end-1), Gm10K, 'go');
hold off
