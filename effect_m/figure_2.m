close all
clear
clc

e = exp(1);
%% m/n affects the result
n = 10000;
m_limit = 2000;

f = 0.01;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
%% search part I
x_axis_1 = [];
y_axis_1 = [];
y_heu_1 = [];
for m = 0:100:m_limit
    p_limit = ((n-1-m)*e - m) / (e+1) / (n-1-m);
    rho_limit = 1 - 1/p_limit;

    variance = 0;
    min_variance = realmax;
    min_rho = 0;
    min_p = 0;
    for rho = 0:-0.0005:rho_limit
        p_limit = (n-1)*e / (e+1) / (n-1-rho*m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance = h_1 * h_2;
            if (variance < min_variance)
                min_variance = variance;
                min_rho = rho;
                min_p = p;
            end
        end
    end
    %% search part II
    for rho = rho_limit:-0.0005:-1
        p_limit = 1 / (1-rho);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance = h_1 * h_2;
            if (variance < min_variance)
                min_variance = variance;
                min_rho = rho;
                min_p = p;
            end
        end 
    end

    x_axis_1(end+1) = m;
    y_axis_1(end+1) = min_variance;
    % heuristic variance
    p = 1 - (n-1) / (n-1-m) / (e+1);
    rho = 1 - 1/p;
    q = 1 - p;
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance = h_1 * h_2;
    y_heu_1(end+1) = variance;
end

f = 0.1;
n_1 = n * f;
%% m: x-axis  optimal variance: y-axis
%% search part I
x_axis_2 = [];
y_axis_2 = [];
y_heu_2 = [];
for m = 0:100:m_limit
    p_limit = ((n-1-m)*e - m) / (e+1) / (n-1-m);
    rho_limit = 1 - 1/p_limit;

    variance = 0;
    min_variance = realmax;
    min_rho = 0;
    min_p = 0;
    for rho = 0:-0.0005:rho_limit
        p_limit = (n-1)*e / (e+1) / (n-1-rho*m);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance = h_1 * h_2;
            if (variance < min_variance)
                min_variance = variance;
                min_rho = rho;
                min_p = p;
            end
        end
    end
    %% search part II
    for rho = rho_limit:-0.0005:-1
        p_limit = 1 / (1-rho);
        for p = p_limit:-0.0005:0.51
            q = 1 - p;
            % variance
            h_1 = p * q / (p - q)^2;
            h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
            variance = h_1 * h_2;
            if (variance < min_variance)
                min_variance = variance;
                min_rho = rho;
                min_p = p;
            end
        end 
    end

    x_axis_2(end+1) = m;
    y_axis_2(end+1) = min_variance;
    % heuristic variance
    p = 1 - (n-1) / (n-1-m) / (e+1);
    rho = 1 - 1/p;
    q = 1 - p;
    h_1 = p * q / (p - q)^2;
    h_2 = n + rho * ((2 * n_1 - n)^2 - n) / (n - 1);
    variance = h_1 * h_2;
    y_heu_2(end+1) = variance;
end

hold on;
plot(x_axis_2, y_axis_2, LineWidth=3,Color=[0 1 0 0.8]);
plot(x_axis_2, y_heu_2, '*',LineWidth=2,Color=[0 1 0 0.8]);
plot(x_axis_1, y_axis_1, LineWidth=3,Color=[1 0 0 0.8]);
plot(x_axis_1, y_heu_1, '*', LineWidth=2,Color=[1 0 0 0.8]);

xlabel('\# colluders $m$',Interpreter='latex')
ylabel('$h(p,\rho)$',FontWeight='bold',Interpreter='latex')
set(gca,'FontSize',16, 'FontName', 'Times New Roman');
ax = gca;
ax.XAxis.Exponent = 3;
ax.YAxis.Exponent = 4;

%% RR
p =  e/(e+1);
q = 1 - p;
yline(p*q*n/((p-q)^2), '--',LineWidth=2,Color=[0 0 1]);

legend("JRR Optimal ($n_1/n = 0.1$)","JRR Heurestic ($n_1/n = 0.1$)","JRR Optimal ($n_1/n = 0.01$)", "JRR Heurestic ($n_1/n = 0.01$)","RR",Location="northwest",Interpreter='latex')

