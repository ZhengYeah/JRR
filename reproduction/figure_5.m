%% change n = [40k, 80k] to reproduce the other two figures

close all
clear
clc

addpath('../');
e = 0.1;

%% m/n affects the result
% change n = [40k, 80k] to reproduce the other two figures
n = 10000;
f = 0.01;
pdelta = 0.0001;
rdelta = 0.0001;
TESTNUM = 10;

m_set = [0, 1, 2, 5, 10, 20, 50, 100, 200, 1000, 2000, 10000];

for i = 1:length(m_set)
    m = m_set(i);
    idx = randperm(n);
    raw_data = zeros(n, 1);
    n1 = floor(n*f);
    if n1 >= 1
        raw_data(idx(1:n1), 1) = 1;
    end
    %% Baseline solution
    p_b = exp(e) / (1 + exp(e));
    q_b = 1 - p_b;
    ldp(i) = p_b * q_b * n / ((p_b - q_b)^2);
    % result from RR
    n0 = n - n1;
    for tno = 1:TESTNUM
        y_RR = RR(n0, n1, p_b);
        a_est1(tno) = (sum(y_RR) - n * q_b) / (p_b - q_b);
        a_est0(tno) = n - a_est1(tno);
    end
    est_rr1(i, :) = a_est1;
    est_rr0(i, :) = a_est0;
    var_RR(i) = (sum((a_est1 - n1).^2) / TESTNUM + sum((a_est0 - n0).^2) / TESTNUM) * 0.5;
    %% JRR
    [p, rho, flag] = cal_p_rho2(e, n, pdelta, rdelta, m)
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));
    if flag == 1
        p15 = p - q;
        p05 = q;
        p_15 = 0;
    else
        p15 = p - sqrt(-rho*p*q);
        p05 = sqrt(-rho*p*q);
        p_15 = q - sqrt(-rho*p*q);
    end
    for tno = 1:TESTNUM
        y_coin = gcoin(n, p15, p05, p_15, raw_data);
        a_est_n1(tno) = (sum(y_coin) - n * q) / (p - q);
        a_est_n0(tno) = n - a_est_n1(tno);
    end
    est_pro1(i, :) = a_est_n1;
    est_pro0(i, :) = a_est_n0;
    var_pro(i) = 0.5 * (sum((a_est_n1 - n1).^2) / TESTNUM + sum((a_est_n0 - n0).^2) / TESTNUM);
end
hold on;
plot(log10(m_set), ldp, '--', LineWidth = 2, Color = [0, 0, 1]);
plot(log10(m_set), gldp, LineWidth = 3, Color = [0, 1, 0]);


f = 0.1;
for i = 1:length(m_set)
    m = m_set(i);
    idx = randperm(n);
    raw_data = zeros(n, 1);
    n1 = floor(n*f);
    if n1 >= 1
        raw_data(idx(1:n1), 1) = 1;
    end
    %% Baseline solution
    p_b = exp(e) / (1 + exp(e));
    q_b = 1 - p_b;
    ldp(i) = p_b * q_b * n / ((p_b - q_b)^2);
    % result from RR
    n0 = n - n1;
    for tno = 1:TESTNUM
        y_RR = RR(n0, n1, p_b);
        a_est1(tno) = (sum(y_RR) - n * q_b) / (p_b - q_b);
        a_est0(tno) = n - a_est1(tno);
    end
    est_rr1(i, :) = a_est1;
    est_rr0(i, :) = a_est0;
    var_RR(i) = (sum((a_est1 - n1).^2) / TESTNUM + sum((a_est0 - n0).^2) / TESTNUM) * 0.5;
    %% JRR
    [p, rho, flag] = cal_p_rho2(e, n, pdelta, rdelta, m)
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));
    if flag == 1
        p15 = p - q;
        p05 = q;
        p_15 = 0;
    else
        p15 = p - sqrt(-rho*p*q);
        p05 = sqrt(-rho*p*q);
        p_15 = q - sqrt(-rho*p*q);
    end
    for tno = 1:TESTNUM
        y_coin = gcoin(n, p15, p05, p_15, raw_data);
        a_est_n1(tno) = (sum(y_coin) - n * q) / (p - q);
        a_est_n0(tno) = n - a_est_n1(tno);
    end
    est_pro1(i, :) = a_est_n1;
    est_pro0(i, :) = a_est_n0;
    var_pro(i) = 0.5 * (sum((a_est_n1 - n1).^2) / TESTNUM + sum((a_est_n0 - n0).^2) / TESTNUM);
end
plot(log10(m_set), gldp, LineWidth = 2, Color = [1, 0, 1]);


f = 1;
for i = 1:length(m_set)
    m = m_set(i);
    idx = randperm(n);
    raw_data = zeros(n, 1);
    n1 = floor(n*f);
    if n1 >= 1
        raw_data(idx(1:n1), 1) = 1;
    end
    %% Baseline solution
    p_b = exp(e) / (1 + exp(e));
    q_b = 1 - p_b;
    ldp(i) = p_b * q_b * n / ((p_b - q_b)^2);
    % result from RR
    n0 = n - n1;
    for tno = 1:TESTNUM
        y_RR = RR(n0, n1, p_b);
        a_est1(tno) = (sum(y_RR) - n * q_b) / (p_b - q_b);
        a_est0(tno) = n - a_est1(tno);
    end
    est_rr1(i, :) = a_est1;
    est_rr0(i, :) = a_est0;
    var_RR(i) = (sum((a_est1 - n1).^2) / TESTNUM + sum((a_est0 - n0).^2) / TESTNUM) * 0.5;
    %% JRR
    [p, rho, flag] = cal_p_rho2(e, n, pdelta, rdelta, m)
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));
    if flag == 1
        p15 = p - q;
        p05 = q;
        p_15 = 0;
    else
        p15 = p - sqrt(-rho*p*q);
        p05 = sqrt(-rho*p*q);
        p_15 = q - sqrt(-rho*p*q);
    end
    for tno = 1:TESTNUM
        y_coin = gcoin(n, p15, p05, p_15, raw_data);
        a_est_n1(tno) = (sum(y_coin) - n * q) / (p - q);
        a_est_n0(tno) = n - a_est_n1(tno);
    end
    est_pro1(i, :) = a_est_n1;
    est_pro0(i, :) = a_est_n0;
    var_pro(i) = 0.5 * (sum((a_est_n1 - n1).^2) / TESTNUM + sum((a_est_n0 - n0).^2) / TESTNUM);
end
plot(log10(m_set), gldp, LineWidth = 2, Color = [1, 0, 0]);

f = 1;
for i = 1:length(m_set)
    m = m_set(i);
    idx = randperm(n);
    raw_data = zeros(n, 1);
    n1 = floor(n*f);
    if n1 >= 1
        raw_data(idx(1:n1), 1) = 1;
    end
    %% Baseline solution
    p_b = exp(e) / (1 + exp(e));
    q_b = 1 - p_b;
    ldp(i) = p_b * q_b * n / ((p_b - q_b)^2);
    % result from RR
    n0 = n - n1;
    for tno = 1:TESTNUM
        y_RR = RR(n0, n1, p_b);
        a_est1(tno) = (sum(y_RR) - n * q_b) / (p_b - q_b);
        a_est0(tno) = n - a_est1(tno);
    end
    est_rr1(i, :) = a_est1;
    est_rr0(i, :) = a_est0;
    var_RR(i) = (sum((a_est1 - n1).^2) / TESTNUM + sum((a_est0 - n0).^2) / TESTNUM) * 0.5;
    %% JRR
    [p, rho, flag] = cal_p_rho2(e, n, pdelta, rdelta, m)
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));
    if flag == 1
        p15 = p - q;
        p05 = q;
        p_15 = 0;
    else
        p15 = p - sqrt(-rho*p*q);
        p05 = sqrt(-rho*p*q);
        p_15 = q - sqrt(-rho*p*q);
    end
    for tno = 1:TESTNUM
        y_coin = gcoin(n, p15, p05, p_15, raw_data);
        a_est_n1(tno) = (sum(y_coin) - n * q) / (p - q);
        a_est_n0(tno) = n - a_est_n1(tno);
    end
    est_pro1(i, :) = a_est_n1;
    est_pro0(i, :) = a_est_n0;
    var_pro(i) = 0.5 * (sum((a_est_n1 - n1).^2) / TESTNUM + sum((a_est_n0 - n0).^2) / TESTNUM);
end
plot(log10(m_set), gldp, LineWidth = 2, Color = [1, 0, 0]);


set(gca, 'xTick', [0, log10(10), log10(100), log10(1000), log(10000)]);
set(gca, 'xTickLabel', {'0', '10', '100', '1000', '10000'});
xlabel('$M$', Interpreter = 'latex')
ylabel('MSE')
set(gca, 'FontSize', 20, 'FontName', 'Times New Roman');
ax = gca;
% ax.XAxis.Exponent = 3;
ax.YAxis.Exponent = 5;
% ylim([0, 5000000])
legend("RR", "JRR ($n_1/n = 0.01$)", "JRR ($n_1/n = 0.1$)", "JRR ($n_1/n = 1$)", Location = "SE", Interpreter = 'latex')
