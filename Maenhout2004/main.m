clear all
clc

%% Table 1
ExcessReturn = 0.06;
Volatility = 0.16;
% To calibrate different levels of risk-aversion and ambiguity-aversion
RiskAversion = [1;5;7;10];
AmbiguityAversion = [0;0.1;0.5;1;2;5;10];

table1(ExcessReturn,Volatility,RiskAversion,AmbiguityAversion);

% Result in Text - Detection error probability for EPp = 2% and 3%
N = 100;
sigmaC = 0.16;
EPt = 0.06;
EPp = [0.03 0.02];
error = zeros(1,2);
d = -sqrt(N)*(EPt-EPp)/(2*sigmaC);
error = normcdf(d)*100;

disp('Result in Text (1)');
disp('Detection error probability for EPp = 2% and 3%');
disp(' ');
disp(error);
disp(' ');

%% Table 2
% Parameters from Campbell (1999)
% Column 1: Annualized consumption and return parameters 1891-1994;
% Column 2: Quarterly postwar sample 1947.2-1996.3;
% Rows: Consumption growth, Consumption Volatility, sigma_S, rho,r, mu_S-r
params = [0.01742, 0.03257, 0.18534, 0.497,  0.01955, 0.06258;
          0.01908, 0.01084, 0.15218, 0.193, 0.007852, 0.07852];
pinvphi = 0.6;
pgamma = [7,10];
[delta,invphi,gamma,theta,EPp] = table2(params,pinvphi,pgamma);

%% Table 3
Tnum = [104,50];
table3(params,theta([2,4]),Tnum);
% Table3(params,[14 237],Tnum);

%% Table 4
table4(params,EPp,Tnum)
