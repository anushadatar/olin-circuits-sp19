load ('Lab6_Exp3_Sun.mat')

pIn = Exp3_Iin_Parallel_Sun;
pOut = Exp3_Iout_Parallel_Sun;

sIn = Exp3_Iin_Series_Sun;
sOut = Exp3_Iout_Series_Sun;
%% Parallel

p_fit = polyfit(pIn(1:71),pOut(1:71),1);
pOut_theo = polyval(p_fit,pIn);
p_fit_theo = polyfit(pIn,pOut_theo,1);
pe_slope = p_fit(1) %Current Divider Ratio of experimental
pt_slope = p_fit_theo(1) %Current Divider Ratio of theoretcail

Iout = pIn(1:71)./pOut(1:71)

figure;
plot(pIn,pOut,'bo','MarkerSize',2)
hold on
plot(pIn,pOut_theo,'r-','MarkerSize',2)

%Legend
legend('Experimental','Theoretical');
legend('boxoff')
legend('Location','northeast')

%Labels
title('MOS Current Divider in Parallel');
xlabel("Current In (Amps)");
ylabel("Current Out (Amps)");

hold off;
%% Series

s_fit = polyfit(sIn(1:55),sOut(1:55),1)
sOut_theo = polyval(s_fit,sIn);
s_fit_theo = polyfit(sIn,sOut_theo,1);
se_slope = s_fit(1) %Current Divider Ratio of experimental
st_slope = s_fit_theo(1) %Current Divider Ratio of theoretcail

figure;
plot(sIn,sOut,'bo','MarkerSize',3)
hold on
plot(sIn,sOut_theo,'r-','MarkerSize',2)
plot(sIn,sOut)

%Legend
% legend();
% legend('boxoff')
% legend('Location','northeast')

%Labels
title('MOS Current Divider in Series');
xlabel("Current In (Amps)");
ylabel("Current Out (Amps)");
