clear all
clc

%% Merton 1971: CRRA utility with no ambiguity

disp('Merton (1971)');
disp('Row 1: Consumption share; Row 2: Optimal Weight');disp(' ');

ExcessReturn = 0.06;
Volatility = 0.15;
RiskFreeRate = 0.02;

TimeDiscount = 0.025;
RiskAversion = [2,4,6,8];

ConsumptionRate1 = zeros(1,length(RiskAversion));
OptimalWeight1 = zeros(1,length(RiskAversion));

for j = 1:length(RiskAversion)
    
    Mkt = [ExcessReturn;Volatility;RiskFreeRate];
    Agent = [TimeDiscount;RiskAversion(j)];
    [ConsumptionRate1(j),OptimalWeight1(j)] = table0(Mkt,Agent);
    
end

disp('Optimal fraction allocated to the risky asset');disp(' ');
disp(100*OptimalWeight1);
disp('Consumption rate');disp(' ');
disp(100*ConsumptionRate1);

%% Liu 2018: CRRA utility with ambiguity

disp('Table 1');
disp('Row 1: Consumption share; Row 2: Optimal Weight');disp(' ');

ExcessReturn = 0.06;
Volatility = 0.15;
RiskFreeRate = 0.02;

TimeDiscount = 0.025;
RiskAversion = [2;4;6;8];
AmbiguityAversion = [0;9;45;90;180;450];

disp('Risk aversion levels in columns');
disp(RiskAversion');
disp('Ambiguity aversion degrees in rows');
disp(AmbiguityAversion');

ConsumptionRate = zeros(length(AmbiguityAversion),length(RiskAversion));
OptimalWeight = zeros(length(AmbiguityAversion),length(RiskAversion));
WorstScenario = zeros(length(AmbiguityAversion),length(RiskAversion));

for i = 1:length(AmbiguityAversion)
for j = 1:length(RiskAversion)
    
    Mkt = [ExcessReturn;Volatility;RiskFreeRate];
    Agent = [TimeDiscount;RiskAversion(j);AmbiguityAversion(i)];
    [ConsumptionRate(i,j),OptimalWeight(i,j),WorstScenario(i,j)] = table1(Mkt,Agent);
    
end
end

disp('Optimal fraction allocated to the risky asset');disp(' ');
disp(100*OptimalWeight);
disp('Equity premium');disp(' ');
disp(100*WorstScenario);
disp('Consumption rate');disp(' ');
disp(100*ConsumptionRate);

disp('Table 2.1: Ambiguity Neutral Model')

% Set 1: Annualized consumption and return parameters 1891-1994;
% Set 2: Quarterly postwar sample 1947.2-1996.3;
% Rows: Consumption Growth, Consumption Vol, Risky Asset Vol, Correlation ,
% Risk-free Rate, Excess Return

disp('Data set 1: Annualized consumption and return parameters 1891-1994')

Parameter1 = [0.01742; 0.03257; 0.18534; 0.497; 0.01955; 0.06258];
table21(Parameter1);

disp('Data set 2: Quarterly postwar sample 1947.2-1996.3')
Parameter2 = [0.01908; 0.01084; 0.15218; 0.193; 0.007852; 0.07852];
table21(Parameter2);

disp('Table 2.2: Ambiguity Averse Model 1')
table22(Parameter1,Parameter2);