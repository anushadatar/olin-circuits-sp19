load('collected_data_done.mat');

%% Ix plot

% Theoretical
for i = 1:length(Ix_Exp2_R10K)
    IzIx_Exp2_R10K_Theo(i) = exp(0.5 * log(Ix_Exp2_R10K(i) * 0.00002));
end
p1 = polyfit(log(Ix_Exp2_R10K(1:100)), log(abs(IzIx_Exp2_R10K(1:100))), 1)

for j = 1:length(Ix_Exp2_R100K)
    IzIx_Exp2_R100K_Theo(j) = exp(0.5 * log(Ix_Exp2_R100K(j) * 0.000002));
end
p2 = polyfit(log(Ix_Exp2_R100K(50:150)), log(abs(IzIx_Exp2_R100K(50:150))), 1);


for k = 1:length(Ix_Exp2_R1M)
    IzIx_Exp2_R1M_Theo(k) = exp(0.5 * log(Ix_Exp2_R1M(k) * 0.0000002));
end
p3 = polyfit(log(Ix_Exp2_R1M(50:100)), log(abs(IzIx_Exp2_R1M(50:100))), 1);


figure
loglog(Ix_Exp2_R10K, abs(IzIx_Exp2_R10K), 'r*', 'MarkerSize', 2.5);
hold on
loglog(Ix_Exp2_R100K, abs(IzIx_Exp2_R100K), 'g*', 'MarkerSize', 2.5);
hold on
loglog(Ix_Exp2_R1M, abs(IzIx_Exp2_R1M), 'b*', 'MarkerSize', 2.5);
hold on
loglog(Ix_Exp2_R10K, abs(IzIx_Exp2_R10K_Theo), 'k-')
hold on
loglog(Ix_Exp2_R100K, abs(IzIx_Exp2_R100K_Theo), 'k-')
hold on
loglog(Ix_Exp2_R1M, abs(IzIx_Exp2_R1M_Theo), 'k-')
title('Translinear Circuit 1: Ix Iz Relationship');
xlabel('I_x (A)');
ylabel('I_z (A)');
legend('Experimental data, R=10K', 'Experimental data, R=100K', 'Experimental data, R=1M', 'Theoretical data, R=10K', 'Theoretical data, R=100K', 'Theoretical data, R=1M');
legend('location', 'southeast');
hold off

%% Iy plot

% Theoretical
for m = 1:length(Iy_Exp2_R10K)
    IzIy_Exp2_R10K_Theo(m) = exp(0.5 * log(Iy_Exp2_R10K(m) * 0.00025));
end
p4 = polyfit(log(Iy_Exp2_R10K(1:50)), log(abs(IzIy_Exp2_R10K(1:50))), 1);

for n = 1:length(Iy_Exp2_R100K)
    IzIy_Exp2_R100K_Theo(n) = exp(0.5 * log(Iy_Exp2_R100K(n) * 0.000025));
end
p5 = polyfit(log(Iy_Exp2_R100K(1:150)), log(abs(IzIy_Exp2_R100K(1:150))), 1);


for w = 1:length(Iy_Exp2_R1M)
    IzIy_Exp2_R1M_Theo(w) = exp(0.5 * log(Iy_Exp2_R1M(w) * 0.0000025));
end
p6 = polyfit(log(Iy_Exp2_R1M(50:150)), log(abs(IzIy_Exp2_R1M(50:150))), 1);

figure
loglog(Iy_Exp2_R10K, abs(IzIy_Exp2_R10K), 'r*', 'MarkerSize', 2.5);
hold on
loglog(Iy_Exp2_R100K, abs(IzIy_Exp2_R100K), 'g*', 'MarkerSize', 2.5);
hold on
loglog(Iy_Exp2_R1M, abs(IzIy_Exp2_R1M), 'b*', 'MarkerSize', 2.5);
hold on
loglog(Iy_Exp2_R10K, abs(IzIy_Exp2_R10K_Theo), 'k-')
hold on
loglog(Iy_Exp2_R100K, abs(IzIy_Exp2_R100K_Theo), 'k-')
hold on
loglog(Iy_Exp2_R1M, abs(IzIy_Exp2_R1M_Theo), 'k-')
title('Translinear Circuit 1: Iy Iz Relationship');
xlabel('I_y (A)');
ylabel('I_z (A)');
legend('Experimental data, R=10K', 'Experimental data, R=100K', 'Experimental data, R=1M', 'Theoretical data, R=10K', 'Theoretical data, R=100K', 'Theoretical data, R=1M');
legend('location', 'southwest');
hold off
