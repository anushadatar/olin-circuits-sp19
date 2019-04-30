figure
plot(Times(1000:3254), Channel1V(1000:3254));
hold on
plot(Times(1000:3254), Channel2V(1000:3254));
xlim([-0.022, -0.008]);
ylim([-.5, 5.5]);

upFit = polyfit(Times(1208:1360), Channel2V(1208:1360), 1);
upTime = linspace(-.02104, -.01988, 262);

downFit = polyfit(Times(2525:2585), Channel2V(2525:2585), 1);
downTime = linspace(-0.01099, -0.01053, 60);

for i = 1:262
    upV(i) = (real(upFit(1)) * upTime(i)) + real(upFit(2));
end

for j = 1:60
    downV(j) = (real(downFit(1)) * downTime(j)) + real(downFit(2));
end

% upLine = polyval(upFit, Times(1208:1360));
plot(upTime, upV, 'o');
plot(downTime, downV, 'o');
legend('Vin', 'Vout', 'upward slew rate = 1440.1 V/s', 'downward slew rate = -3474.9 V/s');
legend('boxoff');
title('Large Signal Unity Gain Follower Step Response');
xlabel('Time (seconds)');
ylabel('Voltage (V)');
