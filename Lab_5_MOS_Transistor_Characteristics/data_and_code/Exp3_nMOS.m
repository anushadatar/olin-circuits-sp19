%% Setup
load('Exp3_compiled.mat');

%% Semilog plots
figure
semilogy(Vd_nMOS_0_6, Id_nMOS_0_6, 'o');
hold on
semilogy(Vd_nMOS_0_7, Id_nMOS_0_7, 'o');
hold on
semilogy(Vd_nMOS_5, Id_nMOS_5, 'o');
hold off
title('nMOS Transistor Drain Characteristics');
legend('Gate voltage = 0.6V', 'Gate voltage = 0.7V', 'Gate voltage = 5V');
xlabel('Drain voltage (V)');
ylabel('Drain current (A)');

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

%% Extract saturation current

nfit1 = polyfit(Vd_nMOS_0_6(100:330), Id_nMOS_0_6(100:330), 1);
nfit2 = polyfit(Vd_nMOS_0_7(100:330), Id_nMOS_0_7(100:330), 1);
nfit3 = polyfit(Vd_nMOS_5(100:330), Id_nMOS_5(100:330), 1);

nro1 = 1/nfit1(1);
nro2 = 1/nfit2(1);
nro3 = 1/nfit3(1);

nIsat1 = nfit1(2);
nIsat2 = nfit2(2);
nIsat3 = nfit3(2);

pfit1 = polyfit(Vd_pMOS_0(1:135), Id_pMOS_0(1:135), 1);
pfit2 = polyfit(Vd_pMOS_4_2(1:135), Id_pMOS_4_2(1:135), 1);
pfit3 = polyfit(Vd_pMOS_4_3(1:135), Id_pMOS_4_3(1:135), 1);

pro1 = 1/pfit1(1);
pro2 = 1/pfit2(1);
pro3 = 1/pfit3(1);

pIsat1 = pfit1(2);
pIsat2 = pfit2(2);
pIsat3 = pfit3(2);

%% Extract Early voltage

nVA1 = nro1 * nIsat1;
nVA2 = nro2 * nIsat2;
nVA3 = nro3 * nIsat3;

pVA1 = pro1 * pIsat1;
pVA2 = pro2 * pIsat2;
pVA3 = pro3 * pIsat3;

%% Semilogx plot Early Voltage as function of saturation current

figure
semilogx(nIsat1, nVA1, '*');
hold on
semilogx(nIsat2, nVA2, '*');
hold on
semilogx(nIsat3, nVA3, '*');
hold on
semilogx(abs(pIsat1), abs(pVA1), '*');
hold on
semilogx(abs(pIsat2), abs(pVA2), '*');
hold on
semilogx(abs(pIsat3), abs(pVA3), '*');
title('Early Voltage as a function of Saturation Current');
xlabel('Saturation Current (A)');
ylabel('Early Voltage (V)');
legend('nMOS Vg = 0.6V', 'nMOS Vg = 0.7V', 'nMOS Vg = 5V', 'pMOS Vg = 0V', 'pMOS Vg = 4.2V', 'pMOS Vg = 4.3V');

%% Extract gs

ngsfit1 = polyfit(Vd_nMOS_0_6(1:5), Id_nMOS_0_6(1:5), 1);
ngsfit2 = polyfit(Vd_nMOS_0_7(1:30), Id_nMOS_0_7(1:30), 1);
ngsfit3 = polyfit(Vd_nMOS_5(1:80), Id_nMOS_5(1:80), 1);

ngs1 = ngsfit1(1);
ngs2 = ngsfit2(1);
ngs3 = ngsfit3(1);

pgsfit1 = polyfit(Vd_pMOS_4_2(400:420), Id_pMOS_4_2(400:420), 1);
pgsfit2 = polyfit(Vd_pMOS_4_3(390:420), Id_pMOS_4_3(390:420), 1);
pgsfit3 = polyfit(Vd_pMOS_0(330:420), Id_pMOS_0(330:420), 1);

pgs1 = pgsfit1(1);
pgs2 = pgsfit2(1);
pgs3 = pgsfit3(1);

%% Loglog plot intrinsic gain (gs ro) as function of saturation current

% Isat is a single value
% Isat is y intercept of fit in saturation region


ngsro1 = ngs1 .* nro1;
ngsro2 = ngs2 .* nro2;
ngsro3 = ngs3 .* nro3;

pgsro1 = pgs1 .* pro1;
pgsro2 = pgs2 .* pro2;
pgsro3 = pgs3 .* pro3;

figure
loglog(nIsat1, ngsro1, '*');
hold on
loglog(nIsat2, ngsro2, '*');
hold on
loglog(nIsat3, ngsro3, '*');
hold on
loglog(abs(pIsat1), pgsro1, '*');
hold on
loglog(abs(pIsat2), pgsro2, '*');
hold on
loglog(abs(pIsat3), pgsro3, '*');
title('Intrinsic Gain as a Function of Saturation Current');
xlabel('Saturation Current (A)');
ylabel('Intrinsic Gain (A^2/V^2)');
legend('nMOS Vg = 0.6V', 'nMOS Vg = 0.7V', 'nMOS Vg = 5V', 'pMOS Vg = 0V', 'pMOS Vg = 4.2V', 'pMOS Vg = 4.3V');

