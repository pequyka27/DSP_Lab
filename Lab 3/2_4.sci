// Supplementary Problem 2.4: unique even/odd decomposition.
n = -2:2;
xn = [2, 3, 4, 5, 6];
xorigin = 3;

// Reversal gives x(-n) here because n is symmetric about zero.
xfold = xn($:-1:1);
xeven = (xn + xfold)/2;
xodd = (xn - xfold)/2;
xreconstructed = xeven + xodd;

disp("Time indices n:");
disp(n);
disp("x(n):");
disp(xn);
disp("x(-n):");
disp(xfold);
disp("Even part:");
disp(xeven);
disp("Odd part:");
disp(xodd);
disp("Reconstruction error, expected 0:");
disp(max(abs(xn-xreconstructed)));
disp("Even symmetry error, expected 0:");
disp(max(abs(xeven-xeven($:-1:1))));
disp("Odd symmetry error, expected 0:");
disp(max(abs(xodd+xodd($:-1:1))));

signals = [xn; xeven; xodd; xreconstructed];
titles = ["Original x(n)"; "Even part xe(n)"; ..
          "Odd part xo(n)"; "Reconstruction xe(n) + xo(n)"];
scf();
for p = 1:4
    subplot(2, 2, p);
    plot2d3(n, signals(p, :));
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [-3, -3; 3, 7];
    xtitle(titles(p), "n", "A");
    xgrid();
end
