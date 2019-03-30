load('Lab5_all_data.mat');

nVs = Exp2_Vs_nMOS; %%source voltage for nMOS
nIs = Exp2_Is_nMOS; %%source current for nMOS

pVs = Exp2_Vs_peeMOS; %%source voltage for pMOS
pIs = 5.-Exp2_Is_peeMOS;  %%source current for pMOS

%% nMOS voltage vs. current
figure;
semilogx(nVs,nIs,'*')

%experimental
title( "nMOS Source Voltage vs. Channel Current");
xlabel("Voltage (Volts)");
ylabel("Current (Amps)");

%theoretical

%labels
% legend();
% legend('Location','southeast');
% legend('boxoff');

%% pMOS voltage vs. current
figure;
semilogx(pVs,pIs,'*')

%experimental
title( "pMOS Source Voltage vs. Channel Current");
xlabel("Voltage (Volts)");
ylabel("Current (Amps)");

%theoretical

%labels
% legend();
% legend('Location','southeast');
% legend('boxoff');

%% Incremental Source Conductance

%experimental


%theoretical

%labels
% legend();
% legend('Location','southeast');
% legend('boxoff');