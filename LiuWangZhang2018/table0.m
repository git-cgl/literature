function [C,W] = table0(AssetArg,BehaviorArg)

ExcessRet = AssetArg(1);
Vol = AssetArg(2);
Rf = AssetArg(3);

Delta = BehaviorArg(1);
Gamma = BehaviorArg(2);

C = (1/Gamma)*(Delta-(1-Gamma)*Rf-((1-Gamma)*ExcessRet^2)/(2*Gamma*Vol^2));
W = ExcessRet/(Gamma*Vol^2);

end