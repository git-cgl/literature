function Table1(ExcessReturn,sigma)
%
% Generate Table 1 in Maenhout (2004)
%  

theta = [0, 0.1, 0.5, 1, 2, 5, 10];
gam = [1,5,7,10];

NT = length(theta);
NG = length(gam);

disp('Table 1');
disp('Portfolio share invested in equity and implied pessimistic scenario');
disp(' ');
for j = 1:NT
    for i = 1:NG
        omega = ExcessReturn/(sigma^2*(gam(i)+theta(j)));
        EPp = ExcessReturn*gam(i)/(gam(i)+theta(j));
        fprintf('%1.4f\t%1.4f\t\t',omega,EPp);
    end
    disp(' ');
end

disp(' ');