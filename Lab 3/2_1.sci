// Supplementary Problem 2.1: piecewise signal, folding and shifting.
function values = signal21(n)
    values = zeros(1, length(n));
    ramp = find((n >= -3) & (n <= -1));
    flat = find((n >= 0) & (n <= 3));
    values(ramp) = 1 + n(ramp)/3;
    values(flat) = 1;
endfunction

function values = step21(n)
    values = bool2s(n >= 0);
endfunction

function values = impulse21(n)
    values = bool2s(n == 0);
endfunction

// Include all original and transformed samples, with zero padding.
n = -8:8;
xn = signal21(n);

// (b1) v(n) = x(-n), then y(n) = v(n-4) = x(-(n-4)).
yb1 = signal21(-(n-4));

// (b2) v(n) = x(n-4), then y(n) = v(-n) = x(-n-4).
yb2 = signal21(-n-4);

// (c) Direct evaluation of x(-n+4).
yc = signal21(-n+4);

// (e) Reconstruction from impulses and from unit steps.
xdelta = (1/3)*impulse21(n+2) + (2/3)*impulse21(n+1) ..
       + impulse21(n) + impulse21(n-1) ..
       + impulse21(n-2) + impulse21(n-3);
xstep = (1+n/3).*(step21(n+3)-step21(n)) ..
      + step21(n)-step21(n-4);

disp("(a) Values at n = -3:3:");
disp(signal21(-3:3));
disp("(b1) Values at n = 1:7:");
disp(signal21(4-(1:7)));
disp("(b2) Values at n = -7:-1:");
disp(signal21(-(-7:-1)-4));
disp("(d) Maximum difference between (b1) and (c), expected 0:");
disp(max(abs(yb1-yc)));
disp("(e) Impulse reconstruction error, expected approximately 0:");
disp(max(abs(xn-xdelta)));
disp("(e) Step reconstruction error, expected approximately 0:");
disp(max(abs(xn-xstep)));

// Four plots on the same time and amplitude scales.
signals = [xn; yb1; yb2; yc];
titles = ["(a) x(n)"; ..
          "(b1) Fold then delay: x(4-n)"; ..
          "(b2) Delay then fold: x(-n-4)"; ..
          "(c) x(-n+4)"];
scf();
for p = 1:4
    subplot(2, 2, p);
    plot2d3(n, signals(p, :));
    e = gce();
    e.children(1).thickness = 3;
    a = gca();
    a.data_bounds = [-8, -0.1; 8, 1.2];
    xtitle(titles(p), "n", "A");
    xgrid();
end
