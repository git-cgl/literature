function [D,B,P,G,T,EPp] = table2e(Parameters,Phi,Gamma,Case)

MuC = Parameters(1);
SigmaC = Parameters(2);
R = Parameters(3);
ExcessRet = Parameters(4);

switch Case
    case {0}
        G = ExcessRet/(SigmaC^2);
        P = G;
        T = 0;
        EPp = NaN;
    case {1}
        G = Gamma;
        T = ExcessRet/(SigmaC^2) - G;
        P = Phi;
        EPp = 100*G*SigmaC^2;
end
D = R - P*MuC + 0.5*(1+P)*(G+T)*SigmaC^2;
B = exp(-D);

disp([D,B,1/P,G,T,EPp]);
