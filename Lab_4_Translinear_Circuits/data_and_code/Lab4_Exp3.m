clear all
load('collected_data_done.mat');

%% Ix plots

figure
loglog(Ix_Exp3_R10K, -1.*IzIx_Exp3_R10K, 'r*', 'MarkerSize', 1.5);
hold on;
loglog(Ix_Exp3_R100K, -1.*IzIx_Exp3_R100K, 'b*', 'MarkerSize', 1.5);
loglog(Ix_Exp3_R1M, -1.*IzIx_Exp3_R1M, 'g*', 'MarkerSize', 1.5);

% Theoretical should be equal to 2*I_x - I_y
loglog(Ix_Exp3_R10K, (Ix_Exp3_R10K).^2./(0.2/10000) , 'r');
loglog(Ix_Exp3_R100K,(Ix_Exp3_R100K).^2./(0.2/100000), 'b');
loglog(Ix_Exp3_R1M, (Ix_Exp3_R1M).^2./(0.2/1000000), 'g');

hold off
legend('.00002 Amps Experimental', '.000002 Amps Experimental', '.0000002 Amps Experimental', '.00002 Amps Theoretical', '.000002 Amps Theoretical', '.0000002 Amps Theoretical');
legend('boxoff');
legend('Location', 'southeast');
title( "Translinear Circuit Two I_x - I_z Current Relationship");
ylabel("I_z (Amps)");
xlabel("I_x (Amps)");


%% Iy plots

figure
loglog(Iy_Exp3_R10K, IzIy_Exp3_R10K, 'r*', 'MarkerSize', 1.5);
hold on;
loglog(Iy_Exp3_R100K, IzIy_Exp3_R100K, 'b*', 'MarkerSize', 1.5);
loglog(Iy_Exp3_R1M, IzIy_Exp3_R1M, 'g*', 'MarkerSize', 1.5);
% 
% % Theoretical should be equal to 2*I_x - I_y
loglog(Iy_Exp3_R10K, (2.5/10000).^2./(Iy_Exp3_R10K) , 'r');
loglog(Iy_Exp3_R100K,(2.5/100000).^2./(Iy_Exp3_R100K), 'b');
loglog(Iy_Exp3_R1M, (2.5/1000000).^2./(Iy_Exp3_R1M), 'g');

hold off
legend('.00025 Amps Experimental', '.000025 Amps Experimental', '.0000025 Amps Experimental', '.00025 Amps Theoretical', '.000025 Amps Theoretical', '.0000025 Amps Theoretical');
legend('boxoff');
legend('Location', 'southwest');
title( "Translinear Circuit Two I_y - I_z Current Relationship");
ylabel("I_z (Amps)");
xlabel("I_y (Amps)");


