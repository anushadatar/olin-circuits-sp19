load ('Wed_data.mat')

Vdm1 = Exp2_Vdm_1;
Vout1 = Exp2_Vout_1;

Iout2 = Exp2_Iout_2;
Vout2 = Exp2_Vout_2;

Vdm3 = Exp2_Vdm_3
Iout3 = Exp2_Iout_3;
%% Part 1
p1fit = polyfit(Vdm1(40:48),Vout1(40:48),1);
p1val = polyval(p1fit,Vdm1);

Adm = p1fit(1);

figure;
plot(Vdm1,Vout1,'b.')
hold on
plot(Vdm1,p1val,'k-','LineWidth',1)

ylim([1.9,5.1])
%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Amplifier: Differential-Mode Gain');
xlabel("V_{dm}(Volts)");
ylabel("V_{out} (Volts)");
hold off
%% Part 2

p2fit = polyfit(Vout2(60:77),Iout2(60:77),1)
p2val = polyval(p2fit,Vout2);

Rout = 1/p2fit(1)

clf;
figure;
plot(Vout2,Iout2,'b.','MarkerSize',12)
hold on 
plot(Vout2,p2val,'k-.','LineWidth',1.5)
xlim([2,5])
ylim([-.000001,0.0000007]);


%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Amplifier: Output Resistance');
xlabel("V_{out}(Volts)");
ylabel("I_{out} (Amps)");
hold off
%% Part 3 

p3fit = polyfit(Vdm3(27:65),-1.*Iout3(27:65),1);
p3val = polyval(p3fit,Vdm3);

Gm = p3fit(1);

figure;
plot(Vdm3,-1.*Iout3,'b.','MarkerSize',3)
hold on;
plot(Vdm3,p3val,'k-.','LineWidth',1)

ylim([-0.000001,0.0000014])
%Legend
legend('Experimental','Theoretical Fit');
legend('boxoff')
legend('Location','southeast')

%Labels
title('Differential Amplifier: Transconductance Gain');
xlabel("V_{dm}(Volts)");
ylabel("I_{out} (Amps)");
hold off

%% Math

Theo = Rout * Gm
Adm
