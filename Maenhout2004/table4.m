function table4(Parameters,Error,Gamma,Length)

disp('Calibration of ambiguity aversion as a function of error');

N = Length;
SigmaC = Parameters(2);
SigmaS = Parameters(3);
Corr = Parameters(4);
    
Theta =  -2*norminv(Error')./(SigmaC*Corr*sqrt(N));
EPgap = 100*Theta.*(SigmaC*SigmaS*Corr);
EPt = 100*(Gamma+Theta).*(SigmaC*SigmaS*Corr);

disp([Theta;EPgap;EPt]);
% 
% disp(' ');
% for T=1:2
%     N = Num(T);
%     sigmaS = params(T,3);
%     
%     for i = 1:NE
%         err = ERROR(i);
%         diff =  -2*sigmaS*norminv(err)/sqrt(N)*100;
%         fprintf('%2.2f\t',diff);
%     end
%     fprintf('\t');
% end
% 
% disp(' ');
% for T=1:2
%     N = Num(T);
%     sigmaS = params(T,3);
%     
%     for i = 1:NE
%         err = ERROR(i);
%         diff =  -2*sigmaS*norminv(err)/sqrt(N)*100;
%         EPt = diff+EPp(2*T)*100;
%         fprintf('%2.2f\t',EPt);
%     end
%     fprintf('\t');
% end
% disp(' ');
