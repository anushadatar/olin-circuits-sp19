load('gates.mat')
load('adder.mat')
%% AND Gate

figure('Name','AND Gate')
plot(andT,andA,'g--','LineWidth',2)
hold on
plot(andT,andB,'r--','LineWidth',2)
hold on
plot(andT,andOut,'k-','LineWidth',2)

xlim([0,.043])
ylim([-.5,5.5])

%Legend
legend('Input A','Input B','Output');
legend('Location','northwest')

%Labels
title('Validation of AND Gate');
xlabel("Time (Microseconds)");
ylabel("Voltage (Volts)");
hold off
%% OR Gate

figure('Name','OR Gate')
plot(orT,orA,'g--','LineWidth',2)
hold on
plot(orT,orB,'r--','LineWidth',2)
hold on
plot(orT,orOut,'k-','LineWidth',2)

xlim([0,.043])
ylim([-.5,5.5])

%Legend
legend('Input A','Input B','Output');
legend('Location','northwest')

%Labels
title('Validation of OR Gate');
xlabel("Time (Microseconds)");
ylabel("Voltage (Volts)");
hold off
%% XOR Gate

figure('Name','XOR Gate')
plot(xorT,xorA,'g--','LineWidth',2)
hold on
plot(xorT,xorB,'r--','LineWidth',2)
hold on
plot(xorT,xorOut,'k-','LineWidth',2)

xlim([0,.043])
ylim([-.5,5.5])

%Legend
legend('Input A','Input B','Output');
legend('Location','northwest')

%Labels
title('Validation of XOR Gate');
xlabel("Time (Microseconds)");
ylabel("Voltage (Volts)");
hold off

%% 1-bit Adder

figure('Name','1-bit Adder')
plot(addT,addA,'g--','LineWidth',2)
hold on;
plot(addT,addB,'r--','LineWidth',2)
hold on;
plot(addT,addCin,'m--','LineWidth',2)
hold on;
plot(addT,addS,'k-','LineWidth',2)
hold on;
plot(addT,addCout,'b-','LineWidth',2)

xlim([0,.043])
ylim([-.5,5.5])

%Legend
legend('Input A','Input B','Input Cin','Sum','Carry Bit');
legend('Location','northwest')

%Labels
title('Validation of 1-bit Adder');
xlabel("Time (Microseconds)");
ylabel("Voltage (Volts)");
hold off

%% 4-bit Adder

figure('Name','1-bit Adder')
plot(add4T,add4A,'g--','LineWidth',2)
hold on;
plot(add4T,add4B,'r--','LineWidth',2)
hold on;
plot(add4T,add4Cin,'m--','LineWidth',2)
hold on;
plot(add4T,add4S0,'LineWidth',2)
hold on;
plot(add4T,add4S1,'LineWidth',2)
hold on;
plot(add4T,add4S2,'LineWidth',2)
hold on;
plot(add4T,add4S3,'LineWidth',2)
hold on;
plot(add4T,add4Cout,'LineWidth',2)




xlim([0,.043])
ylim([-.5,5.5])

%Legend
legend('Input A','Input B','Input Cin','Sum 0','Sum 1','Sum 2','Sum 3','Carry Bit');
legend('Location','northwest')

%Labels
title('Validation of 4-bit Adder');
xlabel("Time (Microseconds)");
ylabel("Voltage (Volts)");

hold off;