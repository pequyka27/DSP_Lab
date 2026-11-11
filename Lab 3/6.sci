// Exercise 6: convolution of two finite discrete-time signals.
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    xn = matrix(xn, 1, -1);
    hn = matrix(hn, 1, -1);

    N = length(xn);
    M = length(hn);
    yn = zeros(1, N + M - 1);

    // Each pair contributes to the output at the sum of its times.
    for i = 1:N
        for j = 1:M
            yn(i+j-1) = yn(i+j-1) + xn(i)*hn(j);
        end
    end
    yorigin = xorigin + horigin - 1;

    nx = (1:N) - xorigin;
    nh = (1:M) - horigin;
    ny = (1:length(yn)) - yorigin;

    nmin = min([nx, nh, ny]) - 1;
    nmax = max([nx, nh, ny]) + 1;
    ymin = min([0, xn, hn, yn]) - 1;
    ymax = max([0, xn, hn, yn]) + 1;

    scf();
    subplot(3, 1, 1);
    plot2d3(nx, xn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nmin, ymin; nmax, ymax];
    xtitle("x(n)", "n", "A");
    xgrid();

    subplot(3, 1, 2);
    plot2d3(nh, hn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nmin, ymin; nmax, ymax];
    xtitle("h(n)", "n", "A");
    xgrid();

    subplot(3, 1, 3);
    plot2d3(ny, yn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nmin, ymin; nmax, ymax];
    xtitle("y(n) = convolution of x(n) and h(n)", "n", "A");
    xgrid();
endfunction

// h(0) = h(1) = 1, so y(n) = x(n) + x(n-1).
[yn, yorigin] = convolution([1, -2, 3, 6], 3, [1, 1], 1);

disp("yn =");
disp(yn);
disp("yorigin =");
disp(yorigin);
