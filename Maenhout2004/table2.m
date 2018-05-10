function [T,EPp] = table2(Parameters,Phi,Gamma,Case)

MuC = Parameters(1);
SigmaC = Parameters(2);
SigmaS = Parameters(3);
Corr = Parameters(4);
R = Parameters(5);
ExcessRet = Parameters(6);
        
SigmaCS = SigmaC*SigmaS*Corr;

switch Case
    case {0}
        G = ExcessRet/SigmaCS;
        P = G;
        T = 0;
        EPp = NaN;
    case {1}
        G = Gamma;
        T = ExcessRet/SigmaCS - G;
        P = Phi;
        EPp = 100*G*SigmaCS;
end
D = R - P*MuC + 0.5*(1+P)*(G+T)*SigmaC^2;
B = exp(-D);

disp([D,B,1/P,G,T,EPp]);
