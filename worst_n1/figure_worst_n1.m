close all
clear
clc

e = exp(1);
n = 1000;
m = 0;

f = 0.5;
n_1 = n * f;

%% rho: x-axis  optimal variance: y-axis
variance = [];
for rho = 0:0.05:1
    q = (n-1) / (1+e) / (n-1-m*rho);
    p = 1-q;
    % variance
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance(end+1) = h_1 * h_2;
end

rho = 0:0.05:1;
plot(rho, variance, LineWidth=2,Color=[1 0 0]);

xlabel('Correlation $\rho$',Interpreter='latex')
ylabel('$Var(p,\rho)$',FontWeight='bold',Interpreter='latex')
set(gca,'FontSize',20, 'FontName', 'Times New Roman');
set(gcf,'Position',[100 100 500 500])

p =  e/(e+1);
q = 1 - p;
yline(p*q*n/((p-q)^2), '--',LineWidth=2,Color=[0 0 1]);

legend("JRR","RR",Location="southwest",Interpreter='latex')


