close all
clear
clc

e = exp(1);
%% m/n affects the result
n = 80000;
m_limit = 15000;

f = 0.01;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
x_axis_1 = [];
y_axis_1 = [];
for m = 0:100:m_limit
    p = 1 - (n-1) / (n-1-m) / (e+1);
    rho = 1 - 1/p;

    q = 1 - p;
    % variance
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance = h_1 * h_2;

    x_axis_1(end+1) = m;
    y_axis_1(end+1) = variance;
end


f = 0.1;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
x_axis_2 = [];
y_axis_2 = [];
for m = 0:100:m_limit
    p = 1 - (n-1) / (n-1-m) / (e+1);
    rho = 1 - 1/p;

    q = 1 - p;
    % variance
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance = h_1 * h_2;

    x_axis_2(end+1) = m;
    y_axis_2(end+1) = variance;
end


f = 0.2;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
x_axis_3 = [];
y_axis_3 = [];
for m = 0:100:m_limit
    p = 1 - (n-1) / (n-1-m) / (e+1);
    rho = 1 - 1/p;

    q = 1 - p;
    % variance
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance = h_1 * h_2;

    x_axis_3(end+1) = m;
    y_axis_3(end+1) = variance;
end

hold on;
plot(x_axis_1, y_axis_1, LineWidth=2,Color=[1 0 0]);
plot(x_axis_2, y_axis_2, LineWidth=2,Color=[1 0 1]);
plot(x_axis_3, y_axis_3, LineWidth=2,Color=[0 1 0]);


xlabel('$M$',Interpreter='latex')
ylabel('MSE')
set(gca,'FontSize',20, 'FontName', 'Times New Roman');
ax = gca;
ax.XAxis.Exponent = 3;
ax.YAxis.Exponent = 4;

%% RR
p =  e/(e+1);
q = 1 - p;
yline(p*q*n/((p-q)^2), '--',LineWidth=2,Color=[0 0 1]);

legend("JRR ($n_1/n = 0.01$)","JRR ($n_1/n = 0.1$)","JRR ($n_1/n = 0.2$)","RR",Location="northwest",Interpreter='latex')

