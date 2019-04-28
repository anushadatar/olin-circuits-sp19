load ('Wed_data.mat')

Vdm11 = Exp2_Vdm_1;
Vout11 = Exp2_Vout_1;

Iout22 = Exp2_Iout_2;
Vout22 = Exp2_Vout_2;

Vdm33 = Exp2_Vdm_3
Iout33 = Exp2_Iout_3;
%% Part 1
p1fit = polyfit(Vdm11(40:48),Vout11(40:48),1);
p1val = polyval(p1fit,Vdm11);

Adm = p1fit(1);

figure;
plot(Vdm11,Vout11,'b.')
hold on
plot(Vdm11,p1val,'k-','LineWidth',1)

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

p2fit = polyfit(Vout22(60:77),Iout22(60:77),1)
p2val = polyval(p2fit,Vout22);

Rout = 1/p2fit(1)

clf;
figure;
plot(Vout22,Iout22,'b.','MarkerSize',12)
hold on 
plot(Vout22,p2val,'k-.','LineWidth',1.5)
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

p3fit = polyfit(Vdm33(27:65),-1.*Iout33(27:65),1);
p3val = polyval(p3fit,Vdm33);

Gm = p3fit(1);

figure;
plot(Vdm33,-1.*Iout33,'b.','MarkerSize',3)
hold on;
plot(Vdm33,p3val,'k-.','LineWidth',1)


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
