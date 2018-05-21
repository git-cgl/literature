function OutputArg = table22Eq(x,AssetArg1,AssetArg2)

Gamma = x(1);
Theta = x(2);
Delta1 = x(3);
Delta2 = x(4);
Kappa1 = x(5);
Kappa2 = x(6);
Pi = 1;

MuC1 = AssetArg1(1);
SigmaC1 = AssetArg1(2);
SigmaS1 = AssetArg1(3);
Corr1 = AssetArg1(4);
Rf1 = AssetArg1(5);
ExcessRet1 = AssetArg1(6);

SigmaCS1 = SigmaC1*SigmaS1*Corr1;
A1 = (1/Gamma)*(Delta1-(1-Gamma)*Rf1-((1-Gamma)*ExcessRet1^2)/(2*Gamma*SigmaCS1));

Lambda1Numerator = A1^(2+Gamma)*Gamma^2*SigmaCS1^2;
Lambda1Dinominator = abs(1-Gamma)*(ExcessRet1^2);
Lambda1 = Lambda1Numerator/Lambda1Dinominator;

MuC2 = AssetArg2(1);
SigmaC2 = AssetArg2(2);
SigmaS2 = AssetArg2(3);
Corr2 = AssetArg2(4);
Rf2 = AssetArg2(5);
ExcessRet2 = AssetArg2(6);

SigmaCS2 = SigmaC2*SigmaS2*Corr2;

A2 = (1/Gamma)*(Delta2-(1-Gamma)*Rf2-((1-Gamma)*ExcessRet2^2)/(2*Gamma*SigmaCS2));

Lambda2Numerator = A2^(2+Gamma)*Gamma^2*SigmaCS2^2;
Lambda2Dinominator = abs(1-Gamma)*(ExcessRet2^2);
Lambda2 = Lambda2Numerator/Lambda2Dinominator;

OutputArg(1) = ExcessRet1 - (Gamma + Kappa1^(-Gamma)*Lambda1*Theta);
OutputArg(2) = ExcessRet2 - (Gamma + Kappa2^(-Gamma)*Lambda2*Theta);
OutputArg(3) = ExcessRet1 + Rf1 - Kappa1 - MuC1;
OutputArg(4) = ExcessRet2 + Rf2 - Kappa2 - MuC2;
OutputArg(5) = Kappa1 - (1/Gamma)*(Delta1-(1-Gamma)*Rf1-0.5*(1-Gamma)*ExcessRet1*Pi);
OutputArg(6) = Kappa2 - (1/Gamma)*(Delta2-(1-Gamma)*Rf2-0.5*(1-Gamma)*ExcessRet2*Pi);
OutputArg(7) = Pi - ExcessRet1/(Kappa1^(-Gamma)*Lambda1*Theta+Gamma*SigmaCS1);
OutputArg(8) = Pi - ExcessRet2/(Kappa2^(-Gamma)*Lambda2*Theta+Gamma*SigmaCS2);

end

