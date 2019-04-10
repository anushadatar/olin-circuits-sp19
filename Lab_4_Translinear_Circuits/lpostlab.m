Vx1 = Vx(1:501);
Vx2 = Vx(503:1003);
Vx3 = Vx(1005:1505);
Vx4 = Vx(1507:2007);
Vx5 = Vx(2009:end);


Vz1 = Vz(1:501);
Vz2 = Vz(503:1003);
Vz3 = Vz(1005:1505);
Vz4 = Vz(1507:2007);
Vz5 = Vz(2009:end);

TVz1 = sqrt((Vx1.^2) + 1^2);
TVz2 = sqrt((Vx2.^2) + 2^2);
TVz3 = sqrt((Vx3.^2) + 3^2);
TVz4 = sqrt((Vx4.^2) + 4^2);
TVz5 = sqrt((Vx5.^2) + 5^2);

plot(Vx1, Vz1);
hold on;
plot(Vx2, Vz2);
plot(Vx3, Vz3);
plot(Vx4, Vz4);
plot(Vx5, Vz5);
plot(Vx1, Vz1);
hold on;
plot(Vx2, TVz2);
plot(Vx3, TVz3);
plot(Vx4, TVz4);
plot(Vx5, TVz5);

title("Pythagorator Simulation");
legend("1V Experimental", "1V Theoretical", "2V Theoretical", "2V Experimental", "3V Theoretical", "3V Experimental", "4V Theoretical", "4V Experimental", "5V Theoretical", "5V Experimental");
legend('Location', 'southeast');
legend('boxoff');
