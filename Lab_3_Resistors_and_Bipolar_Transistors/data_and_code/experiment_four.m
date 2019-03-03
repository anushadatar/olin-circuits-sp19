clear;
load('collected_data.mat');


Ib = (Iout_Base_Exp1);
get_fit = polyfit(Vin_Exp1(41:91), log(Ib(45:95)), 1);
Ut = abs(1/get_fit(1));
Is = abs(exp(get_fit(2)));
Von = roots((get_fit));
%%
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
%% Experiment 3 Plot.
% Voltage Transfer Characteristic.
plot(Vin_Exp3 + 0.65, Vout_Exp3, '*r','MarkerSize',0.5);
hold on;
plot(Vin_Exp3 + 0.65, Vin_Exp3);
%% Experiment 4 Plot.

T_Exp4_200 = zeros(501, 1);

% m = 2 theoretical plot.
for i = 1:length(T_Exp4_200)
    % Difference in voltage divided by m+1 gives the inflection point.
    if (Vin_Exp4_200(i) >= 2.36)
        T_Exp4_200(i) = (Vin_Exp4_200(i)) - .65;
    elseif (Vin_Exp4_200(i) > .65) 
        T_Exp4_200(i) = 5 + 200*(Ic100(i));
    else
        T_Exp4_200(i) = 5;
    end
end
plot(Vin_Exp4_200, Vout_Exp4_200, '*g','MarkerSize',0.5);
plot(Vin_Exp4_200, T_Exp4_200);

T_Exp4_300 = zeros(501, 1);
% m = 2 theoretical plot.
for i = 1:length(T_Exp4_300)
    % Difference in voltage divided by m+1 gives the inflection point.
    if (Vin_Exp4_300(i) >= 1.94) 
        T_Exp4_300(i) = (Vin_Exp4_300(i)) - .65;
    elseif (Vin_Exp4_300(i) > .65) 
        T_Exp4_300(i) = 5 + 300*(Ic100(i));
    else
        T_Exp4_300(i) = 5;
    end
end

plot(Vin_Exp4_300, Vout_Exp4_300, '*b','MarkerSize',0.5);
plot(Vin_Exp4_300, T_Exp4_300);
% plot(Vin_Exp4_300, 5 + 3.*(-Vin_Exp4_300));
T_Exp4_400 = zeros(501, 1);

for i = 1:length(T_Exp4_400)
    % Difference in voltage divided by m+1 gives the inflection point.
    if (Vin_Exp4_400(i) >= 1.69)
        T_Exp4_400(i) = (Vin_Exp4_400(i)) - .65;
    elseif (Vin_Exp4_400(i) > .65) 
        T_Exp4_400(i) = 5 + 400*(Ic100(i));
    else
        T_Exp4_400(i) = 5;
    end
end

plot(Vin_Exp4_400, Vout_Exp4_400, '*c','MarkerSize',0.5);
plot(Vin_Exp4_400, T_Exp4_400);

% plot(Vin_Exp4_400, 5 + 4.*(-Vin_Exp4_400));

title( "Common Emitter-Amplifer Transfer Characteristics");
ylabel("Voltage Out (Volts)");
xlabel("Voltage In (Volts)");
xlim([0, 5]);
ylim([0, 5]);


legend('Experimental Emitter-Follower', 'Theoretical Emitter-Follower', ...
       'Experimental Common-Emitter Amplifier, 200 Ohms', ...
       'Theoretical Common-Emitter Amplifier, 200 Ohms', ...
       'Experimental Common-Emitter Amplifer, 300 Ohms', ...
       'Theoretical Common-Emmmitter Amplifier, 300 Ohms', ...
       'Experimental Common-Emitter Amplifer, 400 Ohms', ...
       'Theoretical Common-Emmmitter Aplifier, 400 Ohms');
legend('boxoff');
legend('Location','southeast');

hold off;
