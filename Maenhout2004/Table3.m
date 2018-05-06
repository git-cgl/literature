function error = table3(params,the,Num)

error = zeros(1,2);
for T=1:2
    N = Num(T);
    sigmaC = params(T,2);
    rho = params(T,4);

    theta = the(T);
    
    d = -sqrt(N)*theta*sigmaC*rho/2;
    error(T) = normcdf(d)*100;
end

disp('Table 3');
disp('Detection error probabilities for \theta as required in Table 2');
disp(' ');
disp(error);
disp(' ');