load('Lab5_all_data.mat');
load('LAB5_EXP2.mat');

nVs = NMOS_VS; %%source voltage for nMOS
nIs = NMOS_IS; %%source current for nMOS

pVs = 5.-Exp2_Vs_peeMOS; %%source voltage for pMOS
pIs = Exp2_Is_peeMOS;  %%source current for pMOS

figure;
plot(nVs,nIs)
%% nMOS source voltage vs. channel current
[n_a, n_b, n_c, n_d, n_e] = linefit(nVs,nIs,5e-4); 

figure;
semilogx(nVs,nIs,'bo','MarkerSize',3)
hold on
%theoertical
n_y  = n_c * nVs(1:200) + n_d
semilogx(nVs(1:200),n_y,'r+','MarkerSize',2)
hold on;



title( "nMOS Source Voltage vs. Channel Current");
xlabel("Voltage (Volts)");
ylabel("Current (Amps)");

legend('Experimental','Theoretical');
legend('Location','southeast');
legend('boxoff');
hold off;
%% pMOS voltage vs. current
[p_a, p_b, p_c, p_d, p_e] = linefit(pVs,pIs,5e-4)

figure;
semilogx(pVs,pIs,'bo','MarkerSize',2)
hold on;
%theoretical
%semilogx(pVs(p_a:p_b),pIs(p_a:p_b),'ro')
p_y  = p_c * pVs(1:200) + p_d
semilogx(pVs(1:200),p_y,'r+','MarkerSize',2)

title( "pMOS Source Voltage vs. Channel Current");
xlabel("Voltage (Volts)");
ylabel("Current (Amps)");

%theoretical

%labels
legend('Experimental','Theoretical');
legend('Location','Southwest');
legend('boxoff');

%% nMOS Incremental Source Conductance

%experimental
n_Isat = nIs
%%n_fit = polyfit(log(nVs(1:228)), nIs(1:228), 1)
n_ut = .0258
n_gs_weak = (n_Isat)./n_ut;
n_gs_strong = (sqrt((1.38.*10.^(-5).*2).*n_Isat))./n_ut;

nw_fit = polyfit(log(nIs),log(n_gs_weak),1);
nw_plot = polyval(nw_fit,log(nIs));

ns_fit=polyfit(nIs,n_gs_strong,1);
ns_plot = polyval(ns_fit,nIs);

n_diff = diff(n_Isat)./diff(nVs)

figure;
loglog(nIs,n_gs_weak,'ro','MarkerSize',2)
hold on;
loglog(nIs,n_gs_strong,'b*','MarkerSize',2)
hold on
loglog(nIs(1:end-1),n_diff,'y*')
hold off

%labels
title( "nMOS Source Conductance");
xlabel("Channel Current (Amps)");
ylabel('Incremental Source Conductance (Mho)');

legend('Weak Inversion', 'Strong Inversion','Experimental');
legend('Location','southeast');
legend('boxoff');

%% pMOS Incremental Source Conductance
p_Isat = pIs;
p_ut = .0258
p_gs_weak = p_Isat./p_ut
p_gs_strong = (sqrt((.00015*2) .*p_Isat))./p_ut;

%Experimental
p_diff = diff(p_Isat)./diff(pVs);

figure;
loglog(pIs,p_gs_weak,'ro','MarkerSize',2)
hold on;
loglog(pIs,p_gs_strong,'b*','MarkerSize',2)
hold on;
loglog(p_Isat(1:end-1),p_diff,'y*')
hold off;

xlim([10^-10,10^-2])
%labels
title( "pMOS Source Conductance");
xlabel("Channel Current (Amps)");
ylabel('Incremental Source Conductance (Mho)');

legend('Weak Inversion', 'Strong Inversion','Experimental');
legend('Location','southeast');
legend('boxoff');