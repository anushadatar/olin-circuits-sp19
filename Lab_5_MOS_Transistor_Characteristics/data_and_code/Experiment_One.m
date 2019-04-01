load("Lab5_all_data.mat");
%% 
% Plot 1 : Semilog plot of expeirmental and theoretical fit using
%          EKV model.
% Experimental 
Ut = 0.025;
flipped_pmos_is = fliplr(Exp1_Is_peeMOS);
flipped_pmos_vg = fliplr(Exp1_Vg_peeMOS);
[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(Exp1_Vg_nMOS(1:100), Exp1_Is_nMOS(1:100), 5e-3);
% 
[Is_pmos, Vt_pmos, kappa_pmos] = ekvfit(flipped_pmos_vg, flipped_pmos_is, 5e-3);

Vt_pmos = Vt_nmos;
kappa_pmos = kappa_nmos;
Is_pmos = Is_nmos;

Vt_pmos = real(Vt_pmos)/10;
kappa_pmos = real(kappa_pmos);
Is_pmos = real(Is_pmos) / -100;


theoretical_Is_nmos = 10*(abs(Is_nmos).*(log(1 + exp((kappa_nmos.*(Exp1_Vg_nMOS - Vt_nmos))./(2*Ut)))));
semilogy(abs(Exp1_Vg_nMOS), -1.*Exp1_Is_nMOS,'b*','MarkerSize',5);
hold on;
semilogy(Exp1_Vg_nMOS, theoretical_Is_nmos, 'b');
semilogy((Exp1_Vg_peeMOS), abs(Exp1_Is_peeMOS), 'g*','MarkerSize',2)
semilogy(abs( 5 -(Exp1_Vg_peeMOS)), abs(((Is_pmos).*(log(1 + exp((real(kappa_pmos).*(Exp1_Vg_peeMOS - real(Vt_pmos)))./(2*Ut)))))), 'g');

hold off;
%%
clear;
Ut = 0.025;
load("Lab5_all_data.mat");
[Is_nmos, Vt_nmos, kappa_nmos] = ekvfit(Exp1_Vg_nMOS(1:100), Exp1_Is_nMOS(1:100), 5e-3);
[Is_pmos, Vt_pmos, kappa_pmos] = ekvfit(Exp1_Vg_peeMOS(1:100), Exp1_Is_peeMOS(1:100), 5e-3);
Ut = 0.025;

% Plot 2 : Incremental transconductance gain of each transistor.
nmos_transconductance = abs(diff(Exp1_Vg_nMOS)./diff(Exp1_Is_nMOS));
pmos_transconductance = abs(diff(Exp1_Vg_peeMOS)./diff(Exp1_Is_peeMOS));

theoretical_nmos_transconductance = zeros(1, 279);
for i = 1:length(theoretical_nmos_transconductance)
    if (Exp1_Is_nMOS(i) < Is_nmos)
        theoretical_nmos_transconductance(i) = real(Exp1_Is_nMOS(i) * kappa_nmos /Ut);
    else
        theoretical_nmos_transconductance(i) = 1/real(sqrt(Is_nmos*Exp1_Is_nMOS(i)) * kappa_nmos /Ut);
    end
end

theoretical_pmos_transconductance = zeros(1, 419);
for i = 1:length(theoretical_pmos_transconductance)
    if (Exp1_Is_peeMOS(i) < Is_pmos) %subtract 0.01 to smooth out the theoretical fit
        theoretical_pmos_transconductance(i) = 1/real(Exp1_Is_peeMOS(i) * kappa_pmos /Ut);
    else
        theoretical_pmos_transconductance(i) = 1/real(sqrt(Is_nmos*Exp1_Is_peeMOS(i)) * kappa_pmos /Ut);
    end
end
loglog(Exp1_Is_nMOS(1:end-1), nmos_transconductance(1:end), 'b*','MarkerSize',5)
hold on;
loglog(Exp1_Is_nMOS(1:end-1), theoretical_nmos_transconductance, 'b')
loglog(Exp1_Is_peeMOS(1:end-1), pmos_transconductance(1:end), 'g*','MarkerSize',5)
loglog(Exp1_Is_peeMOS(1:end-1), theoretical_pmos_transconductance, 'g')

