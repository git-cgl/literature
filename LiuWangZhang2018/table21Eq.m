function OutputArg = table21Eq(x,AssetArg)

Delta = x(1);
Gamma = x(2);
Kappa = x(3);
Pi = 1;
Theta = 0;

MuC = AssetArg(1);
SigmaC = AssetArg(2);
SigmaS = AssetArg(3);
Corr = AssetArg(4);
Rf = AssetArg(5);
ExcessRet = AssetArg(6);

SigmaCS = SigmaC*SigmaS*Corr;

A = (1/Gamma)*(Delta-(1-Gamma)*Rf-((1-Gamma)*ExcessRet^2)/(2*Gamma*SigmaCS));

L1Numerator1 = A^Gamma;
L1Numerator21 = ((Delta-(1-Gamma)*Rf)^2)*(SigmaCS);
L1Numerator22 = ((1-Gamma)*(ExcessRet^2)*(Delta-(1-Gamma)*Rf))/Gamma;
L1Dinominator = abs(1-Gamma)*(ExcessRet^2);
Lambda1 = (L1Numerator1*(L1Numerator21-L1Numerator22))/L1Dinominator;
 
L2Numerator = (A^Gamma)*abs(1-Gamma)*(ExcessRet^2);
L2Dinominator = 4*Gamma^2;
Lambda2 = L2Numerator/L2Dinominator;

Lambda = Lambda1*SigmaCS+Lambda2;

% LambdaNumerator = A^(2+Gamma)*Gamma^2*Vol^4;
% LambdaDinominator = abs(1-Gamma)*(ExcessRet^2);
% Lambda = LambdaNumerator/LambdaDinominator;

OutputArg(1) = ExcessRet - (Gamma + Kappa^(-Gamma)*Lambda1*Theta)*SigmaCS + Kappa^(-Gamma)*Lambda2*Theta;
OutputArg(2) = ExcessRet + Rf - Kappa - MuC;
OutputArg(3) = Kappa - (1/Gamma)*(Delta-(1-Gamma)*Rf-0.5*(1-Gamma)*ExcessRet*Pi);
OutputArg(4) = Pi - ExcessRet/(Kappa^(-Gamma)*Lambda*Theta+Gamma*SigmaCS);

end

