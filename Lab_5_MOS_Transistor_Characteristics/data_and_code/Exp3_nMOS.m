%% Setup
load('Exp3_retake_data.mat');

Id_nMOS_0_6 = Exp3_Id_nMOS_0_6;
Id_nMOS_0_7 = Exp3_Id_nMOS_0_7;
Id_nMOS_5 = Exp3_Id_nMOS_5;

Vd_nMOS_0_6 = Exp3_Vd_nMOS_0_6;
Vd_nMOS_0_7 = Exp3_Vd_nMOS_0_7;
Vd_nMOS_5 = Exp3_Vd_nMOS_5;

%% Semilog plot
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

%% Extract Early Voltage

nfit1 = polyfit(Vd_nMOS_0_6(100:330), Id_nMOS_0_6(100:330), 1);
nfit2 = polyfit(Vd_nMOS_0_7(100:330), Id_nMOS_0_7(100:330), 1);
nfit3 = polyfit(Vd_nMOS_5(100:330), Id_nMOS_5(100:330), 1);

nro1 = 1/nfit1(1);
nro2 = 1/nfit2(1);
nro3 = 1/nfit3(1);

for j = 100:330
    nVA1(j) = nro1 * Vd_nMOS_0_6(j);
    nVA2(j) = nro2 * Vd_nMOS_0_7(j);
    nVA3(j) = nro3 * Vd_nMOS_5(j);
end

figure
semilogx(Vd_nMOS_0_6, nVA1, '*');
hold on
semilogx(Vd_nMOS_0_7, nVA2, '*');
hold on
semilogx(Vd_nMOS_5, nVA3, '*');
title('Early Voltage as a function of Saturation Current');
xlabel('Saturation Current (A)');
ylabel('Early Voltage (V)');

%% Extract intrinsic gain (gs ro)

% gs is the slope of the line in ohmic region

nohmfit1 = polyfit(Vd_nMOS_0_6(1:4), Id_nMOS_0_6(1:4), 1);
nohmfit2 = polyfit(Vd_nMOS_0_7(1:30), Id_nMOS_0_7(1:30), 1);
nohmfit3 = polyfit(Vd_nMOS_5(1:70), Id_nMOS_5(1:70), 1);

ngs1 = nohmfit1(1);
ngs2 = nohmfit2(1);
ngs3 = nohmfit3(1);

ngsro1 = ngs1 .* nro1;
ngsro2 = ngs2 .* nro2;
ngsro3 = ngs3 .* nro3;

% how do you plot this as function of saturation current when gsro is a
% constant???

