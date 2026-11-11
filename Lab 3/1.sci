
function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;

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
    xtitle("y(n)", "n", "A");
    xgrid();
endfunction

[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);

disp("_yn =");
disp(yn);
disp("y_o =");
disp(yorigin);
