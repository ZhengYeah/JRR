%% see folder `under_performance` for details
close all;
clear
clc

addpath('../')
f = 0.5;
TESTNUM = 1;

n_set = 1000:1000:40000;

e = exp(0.01);
for i = 1:length(n_set)
    n = n_set(i);
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
    [p, rho] = cal_p_rho(e);
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));

    p15 = p - sqrt(-rho*p*q);
    p05 = sqrt(-rho*p*q);
    p_15 = q - sqrt(-rho*p*q);
    if p_15 < 0
        p15 = p - q;
        p05 = q;
        p_15 = 0;
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
under_1 = (gldp - ldp) ./ ldp;


e = exp(0.1);
for i = 1:length(n_set)
    n = n_set(i);
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
    [p, rho] = cal_p_rho(e);
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));

    p15 = p - sqrt(-rho*p*q);
    p05 = sqrt(-rho*p*q);
    p_15 = q - sqrt(-rho*p*q);
    if p_15 < 0
        p15 = p - q;
        p05 = q;
        p_15 = 0;
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
under_2 = (gldp - ldp) ./ ldp;


e = exp(1);
for i = 1:length(n_set)
    n = n_set(i);
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
    [p, rho] = cal_p_rho(e);
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));

    p15 = p - sqrt(-rho*p*q);
    p05 = sqrt(-rho*p*q);
    p_15 = q - sqrt(-rho*p*q);
    if p_15 < 0
        p15 = p - q;
        p05 = q;
        p_15 = 0;
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
under_3 = (gldp - ldp) ./ ldp;


hold on;
plot(n_set, under_1, LineWidth = 3, Color = [1, 0, 1])
plot(n_set, under_2, LineWidth = 3, Color = [0, 0, 1])
plot(n_set, under_3, LineWidth = 3, Color = [1, 0, 0])
xlabel('$n$', Interpreter = 'latex')
ylabel('RI')
set(gca, 'FontSize', 24, 'FontName', 'Times New Roman');
legend("$\varepsilon=0.01$", "$\varepsilon=0.1$", "$\varepsilon=1$", 'FontSize', 20, Location = "NE", Interpreter = 'latex')
