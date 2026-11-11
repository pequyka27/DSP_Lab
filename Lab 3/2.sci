// Exercise 2: advance a discrete-time signal by k samples (k > 0).
function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    nmin = min([nx, ny]) - 1;
    nmax = max([nx, ny]) + 1;
    ymin = min([0, xn, yn]) - 1;
    ymax = max([0, xn, yn]) + 1;

    scf();
    subplot(2, 1, 1);
    plot2d3(nx, xn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nmin, ymin; nmax, ymax];
    xtitle("x(n)", "n", "A");
    xgrid();

    subplot(2, 1, 2);
    plot2d3(ny, yn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nmin, ymin; nmax, ymax];
    xtitle("y(n) = x(n+k)", "n", "A");
    xgrid();
endfunction

// Example: advance the input signal by one sample.
[yn, yorigin] = advance([1, -2, 3, 6], 3, 1);

disp("yn =");
disp(yn);
disp("yorigin =");
disp(yorigin);
