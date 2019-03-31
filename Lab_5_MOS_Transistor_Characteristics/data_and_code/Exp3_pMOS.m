%% Set Up
load('Lab5_all_data.mat');

Id_pMOS_0 = Exp3_Id_peeMOS_0;
Id_pMOS_4_2 = Exp3_Id_peeMOS_4_2;
Id_pMOS_4_3 = Exp3_Id_peeMOS_4_3;

Vd_pMOS_0 = Exp3_Vd_peeMOS_0;
Vd_pMOS_4_2 = Exp3_Vd_peeMOS_4_2;
Vd_pMOS_4_3 = Exp3_Vd_peeMOS_4_3;

%% Semilog plots of drain characteristics

figure
semilogy(Vd_pMOS_4_3(2:420), Id_pMOS_4_2(2:420), 'o');
hold on
semilogy(Vd_pMOS_4_2, Id_pMOS_4_3, 'o');
hold on
semilogy(Vd_pMOS_0(2:420), Id_pMOS_0(2:420), 'o');
hold on
title('pMOS Transistor Drain Characteristics');
legend('Gate voltage = 4.3V', 'Gate voltage = 4.2V', 'Gate voltage = 0V');
xlabel('Drain voltage (V)');
ylabel('Drain current (A)');

%% Extract Early Voltage
% find ro, and then use formula in packet to calculate early voltage VA
% from ro

% plot early voltage as a function of saturation current for each n and p


pfit1 = polyfit(Vd_pMOS_0(1:200), Id_pMOS_0(1:200), 1);
pfit2 = polyfit(Vd_pMOS_4_2(1:200), Id_pMOS_4_2(1:200), 1);
pfit3 = polyfit(Vd_pMOS_4_3(1:200), Id_pMOS_4_3(1:200), 1);

pro1 = 1/pfit1(1);
pro2 = 1/pfit2(1);
pro3 = 1/pfit3(1);

for j = 1:200
    pVA1(j) = pro1 * Vd_pMOS_0(j);
    pVA2(j) = pro2 * Vd_pMOS_4_2(j);
    pVA3(j) = pro3 * Vd_pMOS_4_3(j);
end

figure
semilogx(Vd_pMOS_0(1:200), pVA1, '*');
hold on
semilogx(Vd_pMOS_4_2(1:200), pVA2, '*');
hold on
semilogx(Vd_pMOS_4_3(1:200), pVA3, '*');
title('Early Voltage as a function of Saturation Current');
xlabel('Saturation Current (A)');
ylabel('Early Voltage (V)');

%% Extract Saturation Current

%% Extract Intrinsic Gain (gs ro)

%% Loglog Plot Intrinsic Gain (gs ro) as a function of Saturation Current