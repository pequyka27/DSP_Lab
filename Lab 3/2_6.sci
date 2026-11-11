// Supplementary Problem 2.6: time invariance, input delay k = 2.
function values = signal26(n)
    values = bool2s((n >= 0) & (n <= 3));
endfunction

function plot26(n, xn, yn, ydelayed, xdelayed, yshiftinput, systemTitle)
    difference = yshiftinput - ydelayed;
    signals = [xn; yn; ydelayed; xdelayed; yshiftinput; difference];
    titles = ["(1) x(n)"; "(2) y(n) = T[x(n)]"; ..
              "(3) Shift output: y(n-2)"; "(4) Shift input: x(n-2)"; ..
              "(5) T[x(n-2)]"; "(6) T[x(n-2)] - y(n-2)"];
    ymin = min([0, xn, yn, ydelayed, xdelayed, yshiftinput, difference])-1;
    ymax = max([0, xn, yn, ydelayed, xdelayed, yshiftinput, difference])+1;

    scf();
    f = gcf();
    f.figure_name = systemTitle;
    f.figure_size = [1200, 800];
    for p = 1:6
        subplot(3, 2, p);
        plot2d3(n, signals(p, :));
        e = gce();
        e.children(1).thickness = 3;
        a = gca();
        a.data_bounds = [n(1), ymin; n($), ymax];
        xtitle(systemTitle + " | " + titles(p), "n", "A");
        xgrid();
    end
    disp(systemTitle);
    disp("Maximum absolute difference on the displayed interval:");
    disp(max(abs(difference)));
endfunction

n = -4:8;
k = 2;
xn = signal26(n);
xdelayed = signal26(n-k);

// (a), (b): T[x](n) = x(n^2).
yB = signal26(n.^2);
yBdelayed = signal26((n-k).^2);
yBshiftinput = signal26(n.^2-k);
plot26(n, xn, yB, yBdelayed, xdelayed, yBshiftinput, "(b) x(n^2)");

// (c): T[x](n) = x(n)-x(n-1).
yC = signal26(n)-signal26(n-1);
yCdelayed = signal26(n-k)-signal26(n-k-1);
yCshiftinput = xdelayed-signal26((n-1)-k);
plot26(n, xn, yC, yCdelayed, xdelayed, yCshiftinput, "(c) x(n)-x(n-1)");

// (d): T[x](n) = n*x(n).
yD = n.*xn;
yDdelayed = (n-k).*signal26(n-k);
yDshiftinput = n.*xdelayed;
plot26(n, xn, yD, yDdelayed, xdelayed, yDshiftinput, "(d) n*x(n)");

// Expected differences: (b) 1, (c) 0, (d) 2.
// One counterexample disproves time invariance. Agreement for one input
// does not prove it; use the general derivation in the report for (c).
