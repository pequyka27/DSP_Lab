nx= -3:2;
x= [0, 1, -2, 3, 6, 0];

ny1= -nx($:-1:1);
y1= x($:-1:1);

ny2= nx-3;
y2= x;

ny3= -nx($:-1:1)-2;
y3= 2*x($:-1:1);



figure(1);
clf;
subplot(2, 1, 1);
plot2d3(nx, x);
gca().data_bounds= [-2.5, -2.5; 2.5, 6.5];
title("Signal x(n)");
xlabel("n"); ylabel("x(n)");

subplot(2, 1, 2);
plot2d3(ny1, y1);
gca().data_bounds= [-2.5, -2.5; 2.5, 6.5];
title("y_1(n)= x(-n)");
xlabel("n"); ylabel("y_1(n)");

figure(2);
clf;
subplot(2, 1, 1);
plot2d3(nx, x);
gca().data_bounds= [-5.5, -2.5; 1.5, 6.5];
title("Signal x(n)");
xlabel("n"); ylabel("x(n)");

subplot(2, 1, 2);
plot2d3(ny2, y2);
gca().data_bounds= [-5.5, -2.5; 1.5, 6.5;
title("y_2(n)= x(n+3)");
xlabel("n"); ylabel("y_2(n)");

figure(3);
clf;
subplot(2, 1, 1);
plot2d3(nx, x);
gca().data_bounds= [-3.5, -4.5; 1.5, 13];
title("Signal x(n)");
xlabel("n"); ylabel("x(n)");

subplot(2, 1, 2);
plot2d3(ny3, y3);
gca().data_bounds= [-3.5, -4.5; 1.5, 13];
title("y_3(n)= 2x(-n-2)");
xlabel("n"); ylabel("y_3(n)");
