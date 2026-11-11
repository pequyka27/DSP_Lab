clear; clc; clf;

x= [1, 1, 2, -3, 2, 1];
h= [1, 0, -1];
Lx= length(x);
Lh= length(h);
Ly= Lx+Lh-1;

y_fold= zeros(1, Ly);
x_pad= [zeros(1, Lh - 1), x, zeros(1, Lh - 1)];
h_fold= h($:-1:1); 

for n= 1:Ly
    x_segment= x_pad(n : n + Lh - 1);
    y_fold(n)= sum(x_segment .* h_fold);
end

disp("Linear Conv (Folding & Shifting):", y_fold);

H_matrix= zeros(Ly, Lx);
for i= 1:Lx
    H_matrix(i:i+Lh-1, i)= h(:);
end
y_matrix= (H_matrix*x(:))';

disp("Linear Conv (Matrix Method):", y_matrix);

E_x= sum(x.^2);
E_y= sum(y_fold.^2);
disp("Energy signal x(n): ", E_x);
disp("Energy signal y(n): ", E_y);

nx= 0:Lx-1;
nh= 0:Lh-1;
ny= 0:Ly-1;

subplot(3, 1, 1);
plot2d3(nx, x, 2); 
plot(nx, x, "ro");
title(msprintf("x(n)-Energy Ex = %.2f", E_x));
xlabel("n"); ylabel("Biên độ");

subplot(3, 1, 2);
plot2d3(nh, h, 3);
plot(nh, h, "go");
title("h(n)");
xlabel("n"); ylabel("A");

subplot(3, 1, 3);
plot2d3(ny, y_fold, 5);
plot(ny, y_fold, "bo");
title(msprintf("y(n) Linear Convolution -Energy Ey = %.2f", E_y));
xlabel("n"); ylabel("A");
