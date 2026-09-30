n= -2:2;
x= [0,1,3,-2,0];

x_rev= x($:-1:1);

x_e= 0.5*(x+x_rev);
x_o= 0.5*(x-x_rev);

clf
common_bounds = [-2, -2.5; 2, 3.5];

subplot(3,1,1);
plot2d3(n, x);
gca.data_bounds= common_bounds;
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");

subplot(3,1,2);
plot2d3(n, x_o);
gca.data_bounds= common_bounds;
title("Odd signal component x_o(n)");
xlabel("n");
ylabel("x_o(n)");

subplot(3,1,3);
plot2d3(n, x_e);
gca.data_bounds= common_bounds;
title("Even signal component x_e(n)");
xlabel("n");
ylabel("x_e(n)");


