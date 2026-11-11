// Supplementary Problem 2.2: transformations of Figure P2.2.
function values = signal22(n)
    values = zeros(1, length(n));
    full = find((n >= -1) & (n <= 2));
    half = find((n == 3) | (n == 4));
    values(full) = 1;
    values(half) = 1/2;
endfunction

n = -5:7;
xn = signal22(n);
ya = signal22(n-2);
yb = signal22(4-n);
yc = signal22(n+2);
yd = xn .* bool2s(2-n >= 0);
ye = signal22(n-1) .* bool2s(n-3 == 0);
yf = signal22(n.^2);
xeven = (xn + signal22(-n))/2;
xodd = (xn - signal22(-n))/2;

// Window 1: parts (a)--(d).
signalsAD = [ya; yb; yc; yd];
titlesAD = ["(a) x(n-2)"; "(b) x(4-n)"; ..
            "(c) x(n+2)"; "(d) x(n)u(2-n)"];
scf();
for p = 1:4
    subplot(2, 2, p);
    plot2d3(n, signalsAD(p, :));
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [-5, -0.6; 7, 1.2];
    xtitle(titlesAD(p), "n", "A");
    xgrid();
end

// Window 2: parts (e)--(h).
signalsEH = [ye; yf; xeven; xodd];
titlesEH = ["(e) x(n-1)delta(n-3)"; "(f) x(n^2)"; ..
            "(g) Even part of x(n)"; "(h) Odd part of x(n)"];
scf();
for p = 1:4
    subplot(2, 2, p);
    plot2d3(n, signalsEH(p, :));
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [-5, -0.6; 7, 1.2];
    xtitle(titlesEH(p), "n", "A");
    xgrid();
end

disp("Input samples at n = -1:4:");
disp(signal22(-1:4));
disp("(f) x(n^2) at n = -2:2:");
disp(signal22((-2:2).^2));
nsym = -4:4;
disp("(g) Even part at n = -4:4:");
disp((signal22(nsym)+signal22(-nsym))/2);
disp("(h) Odd part at n = -4:4:");
disp((signal22(nsym)-signal22(-nsym))/2);
disp("Maximum reconstruction error, expected 0:");
disp(max(abs(xn-xeven-xodd)));
