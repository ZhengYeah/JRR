close all
clear
clc

addpath('../')
f = 0.5;
TESTNUM=1000;

e_set = [0.001,0.002,0.005,0.01,0.02,0.05, 0.1,0.2,0.5,1];

n=10000;
for i = 1:length(e_set)
    e = e_set(i);
    idx=randperm(n);
    raw_data=zeros(n,1);
    n1=floor(n*f);
    if n1>=1
        raw_data(idx(1:n1),1)=1;
    end

    %% Baseline solution
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i)=p_b*q_b*n/((p_b-q_b)^2);
    % result from RR
    n0=n-n1;
    for tno=1:TESTNUM
        y_RR=RR(n0,n1,p_b);
        a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        a_est0(tno)=n-a_est1(tno);
    end
    est_rr1(i,:)=a_est1;
    est_rr0(i,:)=a_est0;
    var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;

    %% CRRM
    [p,rho]=cal_p_rho(e);
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2) + p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));

    p15=p-sqrt(-rho*p*q);
    p05=sqrt(-rho*p*q);
    p_15=q-sqrt(-rho*p*q);
    if p_15<0
        p15=p-q;
        p05=q;
        p_15=0;
    end

    for tno=1:TESTNUM
        y_coin=gcoin(n,p15,p05,p_15,raw_data);
        a_est_n1(tno)=(sum(y_coin)-n*q)/(p-q);
        a_est_n0(tno)=n-a_est_n1(tno);
    end
    est_pro1(i,:)=a_est_n1;
    est_pro0(i,:)=a_est_n0;
    var_pro(i)=0.5*(sum((a_est_n1-n1).^2)/TESTNUM +sum((a_est_n0-n0).^2)/TESTNUM);
end
under_1 = (gldp - ldp)./ldp;
% under_1 = (var_pro - var_RR) ./ var_RR;


n = 40000;
for i = 1:length(e_set)
    e = e_set(i);
    idx=randperm(n);
    raw_data=zeros(n,1);
    n1=floor(n*f);
    if n1>=1
        raw_data(idx(1:n1),1)=1;
    end

    %% Baseline solution
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i)=p_b*q_b*n/((p_b-q_b)^2);
    % result from RR
    n0=n-n1;
    for tno=1:TESTNUM
        y_RR=RR(n0,n1,p_b);
        a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        a_est0(tno)=n-a_est1(tno);
    end
    est_rr1(i,:)=a_est1;
    est_rr0(i,:)=a_est0;
    var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;

    %% CRRM
    [p,rho]=cal_p_rho(e);
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2) + p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));

    p15=p-sqrt(-rho*p*q);
    p05=sqrt(-rho*p*q);
    p_15=q-sqrt(-rho*p*q);
    if p_15<0
        p15=p-q;
        p05=q;
        p_15=0;
    end

    for tno=1:TESTNUM
        y_coin=gcoin(n,p15,p05,p_15,raw_data);
        a_est_n1(tno)=(sum(y_coin)-n*q)/(p-q);
        a_est_n0(tno)=n-a_est_n1(tno);
    end
    est_pro1(i,:)=a_est_n1;
    est_pro0(i,:)=a_est_n0;
    var_pro(i)=0.5*(sum((a_est_n1-n1).^2)/TESTNUM +sum((a_est_n0-n0).^2)/TESTNUM);
end
under_2 = (gldp - ldp)./ldp;
% under_1 = (var_pro - var_RR) ./ var_RR;


n = 80000;
for i = 1:length(e_set)
    e = e_set(i);
    idx=randperm(n);
    raw_data=zeros(n,1);
    n1=floor(n*f);
    if n1>=1
        raw_data(idx(1:n1),1)=1;
    end

    %% Baseline solution
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i)=p_b*q_b*n/((p_b-q_b)^2);
    % result from RR
    n0=n-n1;
    for tno=1:TESTNUM
        y_RR=RR(n0,n1,p_b);
        a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        a_est0(tno)=n-a_est1(tno);
    end
    est_rr1(i,:)=a_est1;
    est_rr0(i,:)=a_est0;
    var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;

    %% CRRM
    [p,rho]=cal_p_rho(e);
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2) + p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));

    p15=p-sqrt(-rho*p*q);
    p05=sqrt(-rho*p*q);
    p_15=q-sqrt(-rho*p*q);
    if p_15<0
        p15=p-q;
        p05=q;
        p_15=0;
    end

    for tno=1:TESTNUM
        y_coin=gcoin(n,p15,p05,p_15,raw_data);
        a_est_n1(tno)=(sum(y_coin)-n*q)/(p-q);
        a_est_n0(tno)=n-a_est_n1(tno);
    end
    est_pro1(i,:)=a_est_n1;
    est_pro0(i,:)=a_est_n0;
    var_pro(i)=0.5*(sum((a_est_n1-n1).^2)/TESTNUM +sum((a_est_n0-n0).^2)/TESTNUM);
end
under_3 = (gldp - ldp)./ldp;
% under_1 = (var_pro - var_RR) ./ var_RR;


hold on;
plot(log10(e_set), under_3,LineWidth=3,Color=[1 0 0])
plot(log10(e_set), under_2,LineWidth=3,Color=[0 0 1])
plot(log10(e_set), under_1,LineWidth=3,Color=[1 0 1])
set(gca,'xTick',[-3,-2,-1,0]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
xlabel('$\varepsilon$',Interpreter='latex')
ylabel('RI')
set(gca,'FontSize',24, 'FontName', 'Times New Roman');

legend("$n=10^4$", "$n=4\times 10^4$", "$n=8\times10^4$",'FontSize',20,Location="NW",Interpreter='latex')





