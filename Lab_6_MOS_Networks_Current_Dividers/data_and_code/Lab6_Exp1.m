%% Setup
load('Lab6_data.mat');

%% Questions:
% Why are ekvfits not very good?
% But the percent error plot is really close to zero
% 

%% EKV Fit

Ut = 0.025;

[Is1, Vt1, kappa1] = ekvfit(Exp1_Q1_Vg(107:304), -Exp1_Q1_Is(107:304), 1e-3); %8e-3
[Is2, Vt2, kappa2] = ekvfit(Exp1_Q2_Vg(107:304), -Exp1_Q2_Is(107:304), 1e-3);
[Is3, Vt3, kappa3] = ekvfit(Exp1_Q3_Vg(107:304), -Exp1_Q3_Is(107:304), 1e-3);
[Is4, Vt4, kappa4] = ekvfit(Exp1_Q4_Vg(107:304), -Exp1_Q4_Is(107:304), 1e-3);

%% Semilog plot
theoretical_S_current_1 = Is1 * (log(1 + exp(kappa1*(Exp1_Q1_Vg - Vt1)/(2*0.0258)))).^2;
theoretical_S_current_2 = Is2 * (log(1 + exp(kappa2*(Exp1_Q2_Vg - Vt2)/(2*0.0258)))).^2;
theoretical_S_current_3 = Is3 * (log(1 + exp(kappa3*(Exp1_Q3_Vg - Vt3)/(2*0.0258)))).^2;
theoretical_S_current_4 = Is4 * (log(1 + exp(kappa4*(Exp1_Q4_Vg - Vt4)/(2*0.0258)))).^2;

semilogy(abs(Exp1_Q1_Vg), -1.*Exp1_Q1_Is,'r*','MarkerSize',5);
hold on;
semilogy(Exp1_Q1_Vg, abs(theoretical_S_current_1), 'r');
hold on;
semilogy(abs(Exp1_Q2_Vg), -1.*Exp1_Q2_Is,'g*','MarkerSize',5);
hold on;
semilogy(Exp1_Q2_Vg, abs(theoretical_S_current_2), 'g');
hold on;
semilogy(abs(Exp1_Q3_Vg), -1.*Exp1_Q3_Is,'b*','MarkerSize',5);
hold on;
semilogy(Exp1_Q3_Vg, abs(theoretical_S_current_3), 'b');
hold on;
semilogy(abs(Exp1_Q4_Vg), -1.*Exp1_Q4_Is,'k*','MarkerSize',5);
hold on;
semilogy(Exp1_Q4_Vg, abs(theoretical_S_current_4), 'k');
hold off
title('Channel Current as a Function of Gate Voltage');
legend('Q1 experimental data', 'Q1 theoretical fit', 'Q2 experimental data', 'Q2 theoretical fit', 'Q3 experimental data', 'Q3 theoretical fit', 'Q4 experimental data', 'Q4 theoretical fit');
legend('Location', 'southeast');
xlabel('Gate Voltage (V)');
ylabel('Channel Current (A)');
ylim([10^(-10),10^(-2)]);

%% Percent difference
allIs = [Exp1_Q1_Is; Exp1_Q2_Is; Exp1_Q3_Is; Exp1_Q4_Is];
meanIs = mean(allIs);
meanIsPercentQ1 = (Exp1_Q1_Is ./ meanIs)*100;
meanIsPercentQ2 = (Exp1_Q2_Is ./ meanIs)*100;
meanIsPercentQ3 = (Exp1_Q3_Is ./ meanIs)*100;
meanIsPercentQ4 = (Exp1_Q4_Is ./ meanIs)*100;

figure
semilogx(meanIs, Exp1_Q1_Is, 'r*');
hold on
semilogx(meanIs, Exp1_Q2_Is, 'g*');
hold on
semilogx(meanIs, -Exp1_Q3_Is, 'b*');
hold on
semilogx(meanIs, -Exp1_Q4_Is, 'k*');
hold off
title('Channel Current Percent Difference');
legend('Q1', 'Q2', 'Q3', 'Q4', 'location', 'southeast');
xlabel('Mean Channel Current (A)');
ylabel('Percent Difference from Mean Channel Current (A)');
