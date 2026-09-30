n = -5:5;
u_r(n)
ur = n .* bool2s(n >= 0);

clf;
plot2d3(n, ur);
title("Unit Ramp Signal u_r(n)");
xlabel("Sample index n");
ylabel("Amplitude u_r(n)");
