function error = table3(Parameters,T2Result,Length)

N = Length;
SigmaC = Parameters(2);
Corr = Parameters(4);

Theta = T2Result(1);
EPp = T2Result(2);

Error = normcdf(-sqrt(N)*Theta*SigmaC*Corr/2)*100;

disp('Detection error probabilities as required in Table 2');
disp([EPp, Theta, Error]);
