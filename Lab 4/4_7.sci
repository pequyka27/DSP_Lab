clear; clc; clf;

x = [1, 1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];

N = max(length(x), length(h));

x_circ = [x, zeros(1, N - length(x))];
h_circ = [h, zeros(1, N - length(h))];

y_circ_fold = zeros(1, N);
for n = 0:N-1
    s = 0;
    for k = 0:N-1
        idx = pmodulo(n - k, N); 
        s = s + h_circ(k + 1) * x_circ(idx + 1);
    end
    y_circ_fold(n + 1) = s;
end

disp("Circular Conv (Folding & Shifting):", y_circ_fold);

C = zeros(N, N);
for col = 0:N-1
    for row = 0:N-1
        idx = pmodulo(row - col, N);
        C(row + 1, col + 1) = x_circ(idx + 1);
    end
end
y_circ_matrix = (C * h_circ(:))';

disp("Circular Conv (Matrix Method):", y_circ_matrix);

E_x = sum(x_circ .^ 2);
E_y = sum(y_circ_fold .^ 2);
disp("Energy x(n): ", E_x);
disp("Energy y(n): ", E_y);

n_axis = 0 : N - 1;

subplot(3, 1, 1);
plot2d3(n_axis, x_circ, 2);
plot(n_axis, x_circ, "ro");
title(msprintf("x(n) (N=%d) - Energy Ex = %.2f", N, E_x));
xlabel("n"); ylabel("A");

subplot(3, 1, 2);
plot2d3(n_axis, h_circ, 3);
plot(n_axis, h_circ, "go");
title("h(n) after padding");
xlabel("n"); ylabel("A");

subplot(3, 1, 3);
plot2d3(n_axis, y_circ_fold, 5);
plot(n_axis, y_circ_fold, "bo");
title(msprintf("y(n) Circular Convolution - Energy Ey = %.2f", E_y));
xlabel("n"); ylabel("A");
