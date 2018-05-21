function [Kappa,Pi,EPp] = table1(AssetArg,BehaviorArg)

Parameter1 = AssetArg;
Parameter2 = BehaviorArg;

x0 = [0.1;0.1];
options = optimoptions('fsolve','Algorithm','levenberg-marquardt','Display','off');
Sol = fsolve(@(x) table1Eq(x,Parameter1,Parameter2), x0, options);

Kappa = Sol(1);
Pi = Sol(2);

ExcessRet = Parameter1(1);
Vol = Parameter1(2);
Rf = Parameter1(3);

Delta = Parameter2(1);
Gamma = Parameter2(2);
Theta = Parameter2(3);

A = (1/Gamma)*(Delta-(1-Gamma)*Rf-((1-Gamma)*ExcessRet^2)/(2*Gamma*Vol^2));
LambdaNumerator = A^(2+Gamma)*Gamma^2*Vol^4;
LambdaDinominator = abs(1-Gamma)*(ExcessRet^2);
Lambda = LambdaNumerator/LambdaDinominator;

U = -Pi*Theta*Lambda*Kappa^(-Gamma);
EPp = ExcessRet + U;

end