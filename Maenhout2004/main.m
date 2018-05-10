clear all
clc

%% Table 1
ExcessReturn = 0.06;
Volatility = 0.16;
% To calibrate different levels of risk-aversion and ambiguity-aversion
RiskAversion = [1;5;7;10];
AmbiguityAversion = [0;0.1;0.5;1;2;5;10];

disp('Table 1');
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
% Set 1: Annualized consumption and return parameters 1891-1994;
% Set 2: Quarterly postwar sample 1947.2-1996.3;
% Rows: Consumption Growth, Consumption Vol, Risky Asset Vol, Correlation ,
% Risk-free Rate, Excess Return
Parameter1 = [0.01742; 0.03257; 0.18534; 0.497; 0.01955; 0.06258];
Parameter2 = [0.01908; 0.01084; 0.15218; 0.193; 0.007852; 0.07852];

disp('Table 2')

disp('Data set 1: Annualized consumption and return parameters 1891-1994')
Psi1 = 1/0.6;
Gamma1 = 7;
disp('Standard expected utility:')
table2(Parameter1,Psi1,Gamma1,0);
disp('Stochastic differential utility with robustness:')
[AnnualT, AnnualEPp] = table2(Parameter1,Psi1,Gamma1,1);

disp('Data set 2: Quarterly postwar sample 1947.2-1996.3')

Psi2 = 1/0.6;
Gamma2 = 10;
disp('Standard expected utility:')
table2(Parameter2,Psi2,Gamma2,0);
disp('Stochastic differential utility with robustness:')
[QuaterlyT, QuaterlyEPp] = table2(Parameter2,Psi2,Gamma2,1);

disp('Table 2e')

disp('Data set 1: Annualized consumption and return parameters 1891-1994')
Psi1 = 1/0.6;
Gamma1 = 7;
disp('Standard expected utility:')
table2e(Parameter1,Psi1,Gamma1,0);
disp('Stochastic differential utility with robustness:')
table2e(Parameter1,Psi1,Gamma1,1);

disp('Data set 2: Quarterly postwar sample 1947.2-1996.3')

Psi2 = 1/0.6;
Gamma2 = 10;
disp('Standard expected utility:')
table2e(Parameter2,Psi2,Gamma2,0);
disp('Stochastic differential utility with robustness:')
table2e(Parameter2,Psi2,Gamma2,1);

%% Table 3
disp('Table 3 and Table 4')
DetectionProb = [0.1;0.2;0.3];

disp('Data set 1: Annualized consumption and return parameters 1891-1994')
T1 = 104;
table3(Parameter1,[AnnualT, AnnualEPp],T1);
table4(Parameter1,DetectionProb,Gamma1,T1);

disp('Data set 2: Quarterly postwar sample 1947.2-1996.3')
T2 = 50;
table3(Parameter2,[QuaterlyT, QuaterlyEPp],T2);
table4(Parameter2,DetectionProb,Gamma2,T2);
