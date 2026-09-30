n= -1:4;
x1= [0,0,1,3,-2,0];
x2= [0,1,2,3,0,0];

y= x1.*x2;

clf;
common_bounds= [-1, -0.5; 4, 9.5];

subplot(3,1,1);
plot2d3(n, x1);
gca().data_bounds= common_bounds;
title("Signal x_1(n)");
xlabel("n");
ylabel("x_1(n)");

subplot(3,1,2);
plot2d3(n, x2);
gca().data_bounds= common_bounds;
title("Signal x_2(n)");
xlabel("n");
ylabel("x_2(n)");

subplot(3,1,3);
plot2d3(n, y);
gca().data_bounds= common_bounds;
title("Signal y(n)");
xlabel("n");
ylabel("y(n)");
