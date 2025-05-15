close all
clear
clc

addpath('../');

%% parameters
% E=[0.001, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1];
E = [0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1];
n = 10000;
f = 1;

n1 = floor(n*f);
n0 = n - n1;
idx = randperm(n);

raw_data = zeros(n, 1);
raw_data(idx(1:n1), 1) = 1;

TESTNUM = 1000;
pdelta = 0.0003;
rdelta = 0.0003;
M = 5;

for i = 1:length(E)
    %% RR
    e = E(i);
    p_b = exp(e) / (1 + exp(e));
    q_b = 1 - p_b;
    ldp(i) = p_b * q_b * n / ((p_b - q_b)^2);
    for tno = 1:TESTNUM
        y_RR = RR(n0, n1, p_b);
        a_est1(tno) = (sum(y_RR) - n * q_b) / (p_b - q_b);
        a_est0(tno) = n - a_est1(tno);
    end
    est_rr1(i, :) = a_est1;
    est_rr0(i, :) = a_est0;
    var_RR(i) = (sum((a_est1 - n1).^2) / TESTNUM + sum((a_est0 - n0).^2) / TESTNUM) * 0.5;
    %% JRR
    [p, rho] = cal_p_rho2(e, n, pdelta, rdelta, M)
    q = 1 - p;
    gldp(i) = p * q * n / ((p - q)^2) + p * q * rho * n / ((p - q)^2) * ((n * (2 * f - 1)^2 - 1) / (n - 1));

    p15 = p - sqrt(-rho*p*q);
    p05 = sqrt(-rho*p*q);
    p_15 = q - sqrt(-rho*p*q);
    % due to the matlab small number issues.
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

% save ./estimated_n10k_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n40k_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n80k_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

% save ./estimated_n10k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n40k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n80k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

save ./estimated_n10k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n40k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./estimated_n80k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
