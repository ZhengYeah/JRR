close all
clear
clc

e = exp(1);
%% m/n affects the result
n = 80000;
f=1;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
x_axis = [];
y_axis = [];
for m = 0:50:30000
    rho_limit = (n-1)/((e+1)*m - (n-1)*e);
    p_limit = 1 / (1 - rho_limit);

    variance = [];
    for p = e/(e+1):-0.0005:p_limit
        q = 1 - p;
        rho = 1 - 1/p;
        % variance
        h_1 = p * q / (p - q)^2;
        h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
        variance(end+1) = h_1 * h_2;
    end
    [optimal_var, opt_p] = max(variance);
    x_axis(end+1) = m;
    y_axis(end+1) = optimal_var;
end

plot(x_axis, y_axis, LineWidth=2,Color=[1 0 0]);
xlabel('\# colluders $m$',Interpreter='latex') 
ylabel('Optimal $Var(p,\rho,m)$',FontWeight='bold',Interpreter='latex') 
set(gca,'FontSize',20, 'FontName', 'Times New Roman');
ax = gca;
ax.XAxis.Exponent = 3;

%% RR
p =  e/(e+1);
q = 1 - p;
yline(p*q*n/((p-q)^2), LineWidth=2,Color=[0 0 1]);

legend("JRR","RR",Location="northwest")

