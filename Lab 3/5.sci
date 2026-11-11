// Exercise 5: multiply two signals at matching time coordinates.
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    x1n = matrix(x1n, 1, -1);
    x2n = matrix(x2n, 1, -1);

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    // Keep the full common interval, including zero-valued samples.
    nfirst = min([n1(1), n2(1)]);
    nlast = max([n1($), n2($)]);
    ny = nfirst:nlast;
    yorigin = 1 - nfirst;

    x1aligned = zeros(1, length(ny));
    x2aligned = zeros(1, length(ny));
    x1aligned(n1 - nfirst + 1) = x1n;
    x2aligned(n2 - nfirst + 1) = x2n;

    // Elementwise multiplication, not matrix multiplication.
    yn = x1aligned .* x2aligned;

    ymin = min([0, x1aligned, x2aligned, yn]) - 1;
    ymax = max([0, x1aligned, x2aligned, yn]) + 1;

    scf();
    subplot(3, 1, 1);
    plot2d3(ny, x1aligned);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nfirst-1, ymin; nlast+1, ymax];
    xtitle("x1(n)", "n", "A");
    xgrid();

    subplot(3, 1, 2);
    plot2d3(ny, x2aligned);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nfirst-1, ymin; nlast+1, ymax];
    xtitle("x2(n)", "n", "A");
    xgrid();

    subplot(3, 1, 3);
    plot2d3(ny, yn);
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [nfirst-1, ymin; nlast+1, ymax];
    xtitle("y(n) = x1(n) . x2(n)", "n", "A");
    xgrid();
endfunction

// Reuse the inputs from Exercise 4 to compare sum and product.
[yn, yorigin] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);

disp("yn =");
disp(yn);
disp("yorigin =");
disp(yorigin);
