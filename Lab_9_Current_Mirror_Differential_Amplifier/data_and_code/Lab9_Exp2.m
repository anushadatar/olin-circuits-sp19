load ('Lab9_Exp2_Wednesday_data.mat')
load ('Exp2_part1_sat.mat')
load ('Exp2_sat.mat')

Vdm1 = Exp2_p1_Vdm;
Vout1 = Exp2_p1_Vout

Iout2 = Exp2_Iout_Exp2;
Vout2 = Exp2_Vout_Exp2;

Vdm3 = Exp2_Vdm_pt3;
Iout3 = Exp2_Iout_pt3;

%% Part 1
p1fit = polyfit(-1*Vdm1(50:53),Vout1(50:53),1);
p1val = polyval(p1fit,-1*Vdm1);

Adm = p1fit(1);


figure;
plot(-1*Vdm1,Vout1,'b.')
hold on
plot(-1*Vdm1,p1val,'k-','LineWidth',1)

ylim([-0.1,5.1])

%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential-Mode Gain');
xlabel("V_{dm}(Volts)");
ylabel("V_{out} (Volts)");
hold off

%% Part 2
p2fit = polyfit(Vout2(2:48),Iout2(2:48),1)
p2val = polyval(p2fit,Vout2);

Rout = 1/p2fit(1)


clf;
figure;
plot(Vout2,Iout2,'b.','MarkerSize',9)
hold on 
plot(Vout2,p2val,'k-.','LineWidth',1)
xlim([-.1,5.1])


%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Output Resistance');
xlabel("V_{out}(Volts)");
ylabel("I_{out} (Amps)");
hold off
%% Part 3
p3fit = polyfit(Vdm3(22:72),-1.*Iout3(22:72),1);
p3val = polyval(p3fit,Vdm3);

Gm = p3fit(1);

figure;
plot(Vdm3,-1.*Iout3,'b.','MarkerSize',4)
hold on;
plot(Vdm3,p3val,'k-.','LineWidth', 1)

ylim([-0.0000021,0.0000019])

%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Transconductance Gain');
xlabel("V_{dm}(Volts)");
ylabel("I_{out} (Amps)");
hold off
%% Math
Gm
Rout
Theo = Rout * Gm
Adm