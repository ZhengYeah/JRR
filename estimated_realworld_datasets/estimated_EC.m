close all
clear
clc

addpath('../');
load ../Dataset/EC.mat
E=[0.001,0.01,0.1,1];
n=23486;
raw_data=EC;
n1=sum(raw_data(1:n));
n0=n-n1;
f=n1/n;
TESTNUM=1000;

for i=1:length(E)
    %% RR
    e=E(i);
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i) = p_b*q_b*n/((p_b-q_b)^2); % variance list
    for tno=1:TESTNUM
        y_RR=RR(n0,n1,p_b);
        a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        a_est0(tno)=n-a_est1(tno);
    end
    est_rr1(i,:)=a_est1;
    est_rr0(i,:)=a_est0;
    var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM + sum((a_est0-n0).^2)/TESTNUM) *0.5;

    %% CRRM
    [p,rho]=cal_p_rho(e);
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1)); % variance list

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
    var_pro(i)=0.5 * (sum((a_est_n1-n1).^2)/TESTNUM + sum((a_est_n0-n0).^2)/TESTNUM);
end

plot(E,log10(var_RR),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(E,log10(var_pro),'-ro','LineWidth',2,'Markersize',10)
hold on
plot(E,log10(ldp),':b+','LineWidth',2,'Markersize',10)
hold on
plot(E,log10(gldp),':r*','LineWidth',2,'Markersize',10)
(ldp-gldp)./ldp
% plot(E,log10(var_RR),'-bd')
% hold on
% plot(E,log10(var_pro),'-ro')

%  experimental MSE (RR, JRR); estimation of JRR and RR of n0, n1; theoretical error; 
save ./estimated_EC.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
