function Table1(Ret,Vol,RA,AA)
%
% Table 1 in Maenhout (2004)
%

Ng = length(RA);
Nt = length(AA);

disp('Table 1');
disp('Portfolio share invested in equity and implied pessimistic scenario');
disp('Risk aversion levels in columns');
disp(RA');
disp('Ambiguity aversion levels in rows');
disp(AA');
OptimalShare = (Ret/Vol^2)./(ones(Nt,1)*RA'+AA*ones(1,Ng));
disp('Optimal protfolio wieght allocated to the risky asset');
disp(OptimalShare);
WorstCase = (ones(Nt,1)*RA')./(ones(Nt,1)*RA'+AA*ones(1,Ng))*Ret;
disp('Model-assoiciated pessimistic scenario supporting the portfolio');
disp(WorstCase);