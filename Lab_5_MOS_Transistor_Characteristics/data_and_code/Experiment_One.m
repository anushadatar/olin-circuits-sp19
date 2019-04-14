load("Lab5_all_data.mat");
%%
vgp = [Exp1_Vg_peeMOS(1:4:219), Exp1_Vg_peeMOS(221:2:end)];
isatp = [Exp1_Is_peeMOS(1:4:219), Exp1_Is_peeMOS(221:2:end)];

[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(5 - vgp(1:112), - isatp(1:112), 7e-4);

%% 
% Plot 1 : Semilog plot of expeirmental and theoretical fit using
%          EKV model.
% Experimental 
Ut = 0.025;
flipped_pmos_is = fliplr(Exp1_Is_peeMOS);
flipped_pmos_vg = fliplr(Exp1_Vg_peeMOS);
[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(Exp1_Vg_nMOS, Exp1_Is_nMOS, 5e-3);
% 
[Is_pmos, Vt_pmos, kappa_pmos] = ekvfit(flipped_pmos_vg, flipped_pmos_is, 5e-3);

% Vt_pmos = Vt_nmos;
% kappa_pmos = kappa_nmos;
% Is_pmos = Is_nmos;

Vt_pmos = real(Vt_pmos)/10;
kappa_pmos = real(kappa_pmos) * -10;
Is_pmos = -1* real(Is_pmos)/100;


theoretical_Is_nmos = 10*(abs(Is_nmos).*(log(1 + exp((kappa_nmos.*(Exp1_Vg_nMOS - Vt_nmos))./(2*Ut)))));
semilogy(abs(Exp1_Vg_nMOS), -1.*Exp1_Is_nMOS,'b*','MarkerSize',5);
hold on;
semilogy(Exp1_Vg_nMOS, theoretical_Is_nmos, 'b');
semilogy((Exp1_Vg_peeMOS), abs(Exp1_Is_peeMOS), 'g*','MarkerSize',2)
semilogy(abs( 5 -(Exp1_Vg_peeMOS)), abs(((Is_pmos).*(log(1 + exp((real(kappa_pmos).*(Exp1_Vg_peeMOS - real(Vt_pmos)))./(2*Ut)))))), 'g');

hold off;
%%
Ut = 0.025;
load("Lab5_all_data.mat");
[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(Exp1_Vg_nMOS(1:100), Exp1_Is_nMOS(1:100), 5e-3);
[Is_pmos, Vt_pmos, kappa_pmos] = ekvfit(Exp1_Vg_peeMOS(1:100), Exp1_Is_peeMOS(1:100), 5e-3);
Ut = 0.025;
Vt_pmos = Vt_nmos;
kappa_pmos = kappa_nmos;
Is_pmos = Is_nmos;

%%
% Plot 2 : Incremental transconductance gain of each transistor.
Is_pmos = 5.288e-07;
Vt_pmos = 0.6225;
kappa_pmos = .8153;
Ut = 0.025;
Is_nmos = 2.1307e-07;
Vt_nmos = 0.5888;
kappa_nmos = .556;

nmos_transconductance = abs(diff(Exp1_Vg_nMOS)./diff(Exp1_Is_nMOS));
pmos_transconductance = abs(diff(Exp1_Vg_peeMOS)./diff(Exp1_Is_peeMOS));

theoretical_nmos_weak_inversion = 1./abs(real(Exp1_Is_nMOS .* kappa_nmos ./Ut));
theoretical_nmos_strong_inversion = 1./real(sqrt(Is_nmos.* Exp1_Is_nMOS).* kappa_nmos./Ut);
theoretical_pmos_weak_inversion = 1./real(Exp1_Is_peeMOS .* kappa_pmos ./Ut);
theoretical_pmos_strong_inversion = 1./real(sqrt(Is_nmos.*Exp1_Is_peeMOS) .* kappa_pmos./Ut);

%loglog(Exp1_Is_nMOS(1:end-1), nmos_transconductance(1:end), 'b*','MarkerSize',5)
% hold on;
loglog(Exp1_Is_nMOS, theoretical_nmos_weak_inversion, 'b')
hold on;
loglog(Exp1_Is_nMOS, theoretical_nmos_strong_inversion, 'k')

%loglog(Exp1_Is_peeMOS(1:end-1), pmos_transconductance(1:end), 'g*','MarkerSize',5)
loglog(Exp1_Is_peeMOS, theoretical_pmos_weak_inversion, 'g')
loglog(Exp1_Is_peeMOS, theoretical_pmos_strong_inversion, 'r')
% 
ylim([1,1e10])