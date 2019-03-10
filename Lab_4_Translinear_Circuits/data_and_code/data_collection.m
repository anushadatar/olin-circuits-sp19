figure;
loglog(Ix_Exp2_negative, Iz_Exp2_negative,'k')
polyfit(log(Ix_Exp2_negative),log(Iz_Exp2_negative),1)
xlim([10^(-8) 10^(-3)])
ylim([10^(-8) 10^(-3)])

clf;
figure;
polyfit(Ix_Exp2_negative, Iz_Exp2_negative,1)
plot(Ix_Exp2_negative, Iz_Exp2_negative,'r')
xlim([10^(-8) 10^(-3)])
ylim([10^(-8) 10^(-3)])