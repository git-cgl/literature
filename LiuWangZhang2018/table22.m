function table22(Parameter1,Parameter2)

x0 = [2;10;1;1;0.5;0.5];
options = optimoptions('fsolve','Algorithm','levenberg-marquardt','Display','off');
Sol = fsolve(@(x) table22Eq(x,Parameter1,Parameter2), x0, options);

disp(Sol');