%% Circuits Lab 1 Plots 
%% Exercise 1

figure;
plot(IoutExp1, VinExp1,'o')
title( "Resistor Current-Voltage Characteristic");
xlabel("Current (Amps)");
ylabel("Voltage (Volts)");
hold on;

best_coeff1 = polyfit(IoutExp1,VinExp1,1);
% line of best fit = 404.4450(x) + -0.0007
best_line1 = polyval(best_coeff1,Iout);
plot(Iout,best_line1,'-')

xlim([0,.015])
ylim([-.001,5.5])

legend('Experimental', 'Theoretical')
legend('boxoff')
legend('Location','northwest')

hold off;
%% Exercise 2

figure;
plot(VinExp2,VoutExp2,'o')
title( "Voltage Divider Ratio")
xlabel("Voltage In (Volts)");
ylabel("Voltage Out (Volts)");
hold on;

best_coeff2 = polyfit(VinExp2,VoutExp2,1);
% line of best fit = .5032(x) + -.0053
best_line2 = polyval(best_coeff2,VinExp2);
plot(VinExp2,best_line2,'-')

xlim([-.007,6])
ylim([-.007,3])

legend('Experimental', 'Theoretical')
legend('boxoff')
legend('Location','northwest')

hold off;
%% Exercise 3

figure;

new_IoutExp3 = -1.*IoutExp3;
plot(IinExp3,new_IoutExp3,'o');
title( "Current Divder Ratio");
xlabel("Current In (Amps)");
ylabel("Current Out (Amps)");
hold on;

best_coeff3 = polyfit(IinExp3,new_IoutExp3,1);
% line of best fit = .5446(x) + 0
best_line3 = polyval(best_coeff3,IinExp3);
plot(IinExp3,best_line3,'-')

xlim([0,.0014])
ylim([0,.0007])

legend('Experimental', 'Theoretical')
legend('boxoff')
legend('Location','northwest')

hold off;