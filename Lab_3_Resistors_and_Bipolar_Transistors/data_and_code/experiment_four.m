clear;
load('collected_data.mat');


Ib = (Iout_Base_Exp1);
get_fit = polyfit(Vin_Exp1(41:91), log(Ib(45:95)), 1);
Ut = abs(1/get_fit(1));
Is = abs(exp(get_fit(2)));
Von = roots((get_fit));
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
    if (Vin_Exp4_200(i) >= ((5*2*Von)/3))
        T_Exp4_200(i) = (Vin_Exp4_200(i)) - .65;
    elseif (Vin_Exp4_200(i) > .65) 
        T_Exp4_200(i) = 5 - 2*(Vin_Exp4_200(i) - .65);
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
    if (Vin_Exp4_300(i) > (5 - .65)/3 + .65) 
        T_Exp4_300(i) = (Vin_Exp4_300(i)) - .65;
    elseif (Vin_Exp4_300(i) > .65) 
        T_Exp4_300(i) = 5 - 3*(Vin_Exp4_300(i) - .65);
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
    if (Vin_Exp4_400(i) >= (5 - .65)/4 + .65) 
        T_Exp4_400(i) = (Vin_Exp4_400(i)) - .65;
    elseif (Vin_Exp4_400(i) > .65) 
        T_Exp4_400(i) = 5 - 4*(Vin_Exp4_400(i) - .65);
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
       'Theoretical Common-Emmmitter Aplifier, 300 Ohms', ...
       'Experimental Common-Emitter Amplifer, 400 Ohms', ...
       'Theoretical Common-Emmmitter Aplifier, 400 Ohms');
legend('boxoff')
legend('Location','southeast')

hold off;
