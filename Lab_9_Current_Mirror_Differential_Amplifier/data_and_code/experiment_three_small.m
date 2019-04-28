plot(Times(1:420), Channel1V(1:420));
hold on;
plot(Times(1:420), Channel2V(1:420));


% Averaged all the bins...

up_behavior = polyfit(log(Times(80:109)), log(Channel1V(80:109) - Channel2V(80:109)), 1);
up_tau = - real(1 / ((up_behavior(1))*1000))

down_behavior = polyfit(log(Times(110:150)), log(Channel1V(110:150) - Channel2V(110:150)), 1);
down_tau = - 1/(real(down_behavior(1)) * 1000)

legend('V_{in}', 'V_{out}');
legend('Location','southwest');

%Labels
title('Small Amplitude Unity Gain Follower Dynamics');
ylabel("Measured Voltage (Volts)");
xlabel("Time  (Seconds)");

hold off;