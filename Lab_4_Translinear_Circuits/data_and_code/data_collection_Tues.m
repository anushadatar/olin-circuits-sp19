clf;
figure;
loglog(Ix_Exp2_R10K,IzIx_Exp2_R10K,'b--')
hold on;
loglog(Ix_Exp2_R100K,IzIx_Exp2_R100K,'g--')
hold on;
loglog(Ix_Exp2_R1M,IzIx_Exp2_R1M,'m--')
hold on
%loglog(Iy_Exp2_R10K(1:135),IzIy_Exp2_R10K(1:135),'r--')
%hold off;
p = polyfit(log(Iy_Exp2_R1M),log(IzIy_Exp2_R1M),1)
loglog(