function Table4(params,EPp,Num)

ERROR = [0.1, 0.2, 0.3];
NE = length(ERROR);

disp('Table 4');
disp('Calibration of \theta as a function of error');
disp(' ');
for T=1:2
    N = Num(T);
    sigmaC = params(T,2);
    rho = params(T,4);
    
    for i = 1:NE
        err = ERROR(i);
        theta =  -2*norminv(err)/(sigmaC*rho*sqrt(N));
        fprintf('%2.1f\t',theta);
    end
    fprintf('\t');
end

disp(' ');
for T=1:2
    N = Num(T);
    sigmaS = params(T,3);
    
    for i = 1:NE
        err = ERROR(i);
        diff =  -2*sigmaS*norminv(err)/sqrt(N)*100;
        fprintf('%2.2f\t',diff);
    end
    fprintf('\t');
end

disp(' ');
for T=1:2
    N = Num(T);
    sigmaS = params(T,3);
    
    for i = 1:NE
        err = ERROR(i);
        diff =  -2*sigmaS*norminv(err)/sqrt(N)*100;
        EPt = diff+EPp(2*T)*100;
        fprintf('%2.2f\t',EPt);
    end
    fprintf('\t');
end
disp(' ');