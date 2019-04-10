clear;
load('exp1_data.mat');

Is_nmos = 2.0609e-06;
Vt_nmos = 0.5457;
kappa_nmos = 0.7140;
 
Is_pmos = 5.288e-07;
Vt_pmos = 0.62255;
kappa_pmos = .81535;
Ut = 0.025;

nmos_transconductance = abs(diff(Exp1_Vg_nMOS)./diff(Exp1_Is_nMOS));
pmos_transconductance = abs(diff(Exp1_Vg_pMOS)./diff(Exp1_Is_pMOS));

theoretical_nmos_weak_inversion = 1./abs(real(Exp1_Is_nMOS .* kappa_nmos ./Ut));
theoretical_nmos_strong_inversion = 1./real(sqrt(abs(Is_nmos.* Exp1_Is_nMOS)).* kappa_nmos ./ Ut);
theoretical_pmos_weak_inversion = 1./real(Exp1_Is_pMOS .* kappa_pmos ./Ut);
theoretical_pmos_strong_inversion = 1./real(sqrt(abs(Is_pmos.*Exp1_Is_pMOS)) .* kappa_pmos ./ Ut);

loglog(Exp1_Is_nMOS(1:end-1), abs(nmos_transconductance(1:end)), 'b*','MarkerSize',5)
hold on;
loglog(Exp1_Is_nMOS, abs(theoretical_nmos_weak_inversion), 'b')
% hold on;
loglog(Exp1_Is_nMOS, abs(theoretical_nmos_strong_inversion), 'k')
loglog(Exp1_Is_pMOS(1:end-1), abs(pmos_transconductance(1:end)), 'g*','MarkerSize',5)
loglog(Exp1_Is_pMOS, abs(theoretical_pmos_weak_inversion), 'g')
loglog(Exp1_Is_pMOS, abs(theoretical_pmos_strong_inversion), 'r')

ylim([1,1e10])
legend('nMOS Experimental', 'nMOS Theoretical : Weak Inversion', 'nMOS Theoretical : Strong Inversion', 'pMOS Experimental','pMOS Theoretical : Weak Inversion','pMOS Theoretical : Strong Inversion' );
legend('boxoff');
legend('Location', 'southeast');
title( "Incremental Transconductance Gain");
ylabel("g_m (Mhos)");
xlabel("I_c (Amps)");

