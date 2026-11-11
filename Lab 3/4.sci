// Exercise 4: add two signals after aligning their time coordinates.
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Use row vectors for both inputs.
    x1n = matrix(x1n, 1, -1);
    x2n = matrix(x2n, 1, -1);

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    // Common time interval covering both input vectors.
    nfirst = min([n1(1), n2(1)]);
    nlast = max([n1($), n2($)]);
    ny = nfirst:nlast;
    yorigin = 1 - nfirst;

    // Insert each input at the positions for its own time coordinates.
    x1aligned = zeros(1, length(ny));
    x2aligned = zeros(1, length(ny));
    x1aligned(n1 - nfirst + 1) = x1n;
    x2aligned(n2 - nfirst + 1) = x2n;

    yn = x1aligned + x2aligned;

    // Three subplots with the same axis limits and line thickness.
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
    xtitle("y(n) = x1(n) + x2(n)", "n", "A");
    xgrid();
endfunction

// Example from the lab handout.
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);

disp("yn =");
disp(yn);
disp("yorigin =");
disp(yorigin);
