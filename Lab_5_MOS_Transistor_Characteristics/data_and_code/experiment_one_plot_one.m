clear;
load('exp1_data.mat');

vgn = [Exp1_Vg_nMOS(1:4:119), Exp1_Vg_pMOS(121:2:end)];
isatn = [Exp1_Is_nMOS(1:4:119), Exp1_Is_pMOS(121:2:end)];

[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(5 - vgn(1:112), - isatn(1:112), 7e-4);

vgp = [Exp1_Vg_pMOS(1:4:219), Exp1_Vg_pMOS(221:2:end)];
isatp = [Exp1_Is_pMOS(1:4:219), Exp1_Is_pMOS(221:2:end)];

% [Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(5 - vgp(1:112), - isatp(1:112), 7e-4);

Is_nmos = 2.1307e-07;
Vt_nmos = 0.5888;
kappa_nmos = .556;

Is_pmos = 5.288e-07;
Vt_pmos = 0.62255;
kappa_pmos = .81535;
Ut = 0.025;

theoretical_Is_nmos = 10*(abs(Is_nmos).*(log(1 + exp((kappa_nmos.*(Exp1_Vg_nMOS - Vt_nmos))./(2*Ut)))).^2);
semilogy(abs(Exp1_Vg_nMOS), -1.*Exp1_Is_nMOS,'b*','MarkerSize',5);
hold on;
semilogy(Exp1_Vg_nMOS, theoretical_Is_nmos, 'b');
semilogy((Exp1_Vg_pMOS), abs(Exp1_Is_pMOS), 'g*','MarkerSize',2);
semilogy(((Exp1_Vg_pMOS)), (((Is_pmos).*(log(1 + exp((real(kappa_pmos).*(5 - Exp1_Vg_pMOS) - real(Vt_pmos))./(2*Ut)))).^2)), 'g');
ylim([1e-10,1e-2])
hold off;
legend('nMOS Experimental', 'nMOS Theoretical', 'pMOS Experimental', 'pMOS Theoretical');
legend('boxoff');
legend('Location', 'southwest');
title( "Gate Voltage - Channel Current for nMOS and pMOS");
ylabel("I_c (Amps)");
xlabel("V_G (Volts)");

