function table21(Parameters)

x0 = [0.5;0.5;0.5];
options = optimoptions('fsolve','Algorithm','levenberg-marquardt','Display','off');
Sol = fsolve(@(x) table21Eq(x,Parameters), x0, options);

disp(Sol');
