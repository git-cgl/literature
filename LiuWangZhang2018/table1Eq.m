function OutputArg = table1Eq(x,Parameter1,Parameter2)

Kappa = x(1);
Pi = x(2);

ExcessRet = Parameter1(1);
Vol = Parameter1(2);
Rf = Parameter1(3);

Delta = Parameter2(1);
Gamma = Parameter2(2);
Theta = Parameter2(3);

A = (1/Gamma)*(Delta-(1-Gamma)*Rf-((1-Gamma)*ExcessRet^2)/(2*Gamma*Vol^2));

% L1Numerator1 = A^Gamma;
% L1Numerator21 = ((Delta-(1-Gamma)*Rf)^2)*(Vol^2);
% L1Numerator22 = ((1-Gamma)*(ExcessRet^2)*(Delta-(1-Gamma)*Rf))/Gamma;
% L1Dinominator = abs(1-Gamma)*(ExcessRet^2);
% Lambda1 = (L1Numerator1*(L1Numerator21-L1Numerator22))/L1Dinominator;
% 
% L2Numerator = (A^Gamma)*abs(1-Gamma)*(ExcessRet^2);
% L2Dinominator = 4*Gamma^2;
% Lambda2 = L2Numerator/L2Dinominator;
% 
% Lambda = Lambda1*Vol^2 + Lambda2;

LambdaNumerator = A^(2+Gamma)*Gamma^2*Vol^4;
LambdaDinominator = abs(1-Gamma)*(ExcessRet^2);
Lambda = LambdaNumerator/LambdaDinominator;


OutputArg(1) = Kappa - (1/Gamma)*(Delta-(1-Gamma)*Rf-0.5*(1-Gamma)*ExcessRet*Pi);
OutputArg(2) = Pi - ExcessRet/(Kappa^(-Gamma)*Lambda*Theta+Gamma*Vol^2);

end

