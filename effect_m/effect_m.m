close all
clear
clc

e = exp(1);

%% m/n affects the result
n = 80000;
m_limit = 20000;

f = 0;
n_1 = n * f;

%% m: x-axis  optimal variance: y-axis
x_axis_1 = [];
y_axis_1 = [];
for m = 0:100:m_limit
    rho_limit = (n - 1) / ((e + 1) * m - (n - 1) * e);

    variance = [];
    for rho = 0:-0.0005:rho_limit
        p_limit = (n - 1) * e / (e + 1) / (n - 1 - rho * m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance(end+1) = h_1 * h_2;
        end
    end
    [optimal_var, opt_p] = min(variance);
    x_axis_1(end+1) = m;
    y_axis_1(end+1) = optimal_var;
end


f = 0.1;
n_1 = n * f;

%% m: x-axis  optimal variance: y-axis
x_axis_2 = [];
y_axis_2 = [];
for m = 0:100:m_limit
    rho_limit = (n - 1) / ((e + 1) * m - (n - 1) * e);

    variance = [];
    for rho = 0:-0.0005:rho_limit
        p_limit = (n - 1) * e / (e + 1) / (n - 1 - rho * m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance(end+1) = h_1 * h_2;
        end
    end
    [optimal_var, opt_p] = min(variance);
    x_axis_2(end+1) = m;
    y_axis_2(end+1) = optimal_var;
end


f = 0.2;
n_1 = n * f;

%% m: x-axis  optimal variance: y-axis
x_axis_3 = [];
y_axis_3 = [];
for m = 0:100:m_limit
    rho_limit = (n - 1) / ((e + 1) * m - (n - 1) * e);

    variance = [];
    for rho = 0:-0.0005:rho_limit
        p_limit = (n - 1) * e / (e + 1) / (n - 1 - rho * m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance(end+1) = h_1 * h_2;
        end
    end
    [optimal_var, opt_p] = min(variance);
    x_axis_3(end+1) = m;
    y_axis_3(end+1) = optimal_var;
end


f = 0.3;
n_1 = n * f;

%% m: x-axis  optimal variance: y-axis
x_axis_4 = [];
y_axis_4 = [];
for m = 0:100:m_limit
    rho_limit = (n - 1) / ((e + 1) * m - (n - 1) * e);

    variance = [];
    for rho = 0:-0.0005:rho_limit
        p_limit = (n - 1) * e / (e + 1) / (n - 1 - rho * m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance(end+1) = h_1 * h_2;
        end
    end
    [optimal_var, opt_p] = min(variance);
    x_axis_4(end+1) = m;
    y_axis_4(end+1) = optimal_var;
end

hold on;
plot(x_axis_1, y_axis_1, LineWidth = 2, Color = [1, 0, 0, 0.8]);
plot(x_axis_2, y_axis_2, LineWidth = 2, Color = [0, 1, 0, 0.8]);
plot(x_axis_3, y_axis_3, LineWidth = 2, Color = [1, 0, 1, 0.8]);
plot(x_axis_4, y_axis_4, LineWidth = 2, Color = [1, 1, 0, 0.8]);


xlabel('\# colluders $m$', Interpreter = 'latex')
ylabel('Optimal $Var(p,\rho,m)$', FontWeight = 'bold', Interpreter = 'latex')
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
ax = gca;
ax.XAxis.Exponent = 4;
ax.YAxis.Exponent = 4;
%% RR
p = e / (e + 1);
q = 1 - p;
yline(p*q*n/((p - q)^2), '--', LineWidth = 2, Color = [0, 0, 1]);

legend("JRR ($n_1/n = 0$)", "JRR ($n_1/n = 0.1$)", "JRR ($n_1/n = 0.2$)", "JRR ($n_1/n = 0.3$)", "RR", Location = "southeast", Interpreter = 'latex')
