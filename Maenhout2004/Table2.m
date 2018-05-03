function [delta,invphi,gamma,theta,EPp] = Table2(params,pinvphi,pgamma)
%
% Generate Table 2 in Maenhout (2004)
%  

delta = zeros(2,2);
invphi = zeros(2,2);
gamma = zeros(2,2);
theta = zeros(2,2);
EPp = NaN(2,2);
for T=1:2  % 1 for 1981-1994 annually; 2 for 1947.2-1996.3 quarterly
    muC = params(T,1);
    sigmaC = params(T,2);
    sigmaS = params(T,3);
    rho = params(T,4);
    r = params(T,5);
    excess = params(T,6);
        
    sigmaCS = sigmaC*sigmaS*rho;
    aversion = excess/sigmaCS;
    
    for flag = 1:2  % 1 for standard EU; 2 for robust problem
        if flag==1
            gamma(T,flag) = aversion;
            invphi(T,flag) = 1/gamma(T,flag);
        else
            if T==1
                gamma(T,flag) = pgamma(T);
            else
                gamma(T,flag)=pgamma(T);
            end
            theta(T,flag) = aversion - gamma(T,flag);
            invphi(T,flag) = 1/pinvphi;
            EPp(T,flag) = gamma(T,flag)*sigmaCS;
        end
        delta(T,flag) = r - (invphi(T,flag)*muC-0.5*(1+invphi(T,flag))*aversion*sigmaC^2);
    end
end
delta = reshape(delta',1,4);
invphi = reshape(invphi',1,4);
gamma = reshape(gamma',1,4);
theta = reshape(theta',1,4);
EPp = reshape(EPp',1,4);
results = [delta;invphi;gamma;theta;EPp];
disp(' ');
disp('Table 2');
disp('Preference parameters required to match risk-free rate and equity premium');
disp(' ');
disp(results);
disp(' ');