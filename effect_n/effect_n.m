close all
clear
clc

addpath('../')
e=1;
n_set=[20, 200, 2000, 20000,200000,2000000];

f=1;
TESTNUM=1000;
pdelta=0.0001;
rdelta=0.0001;
M=5;


for i=1:length(n_set)
    n=n_set(1,i);
    idx=randperm(n);
    raw_data=zeros(n,1);
    n1=floor(n*f);
    if n1>=1
        raw_data(idx(1:n1),1)=1;
    end
    %% RR
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i)=n*p_b*q_b/(p_b-q_b)^2;
    %result from RR
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
    [p,rho]=cal_p_rho2(e,n,pdelta,rdelta,M);
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));
    p15=p-sqrt(-rho*p*q);
    p05=sqrt(-rho*p*q);
    p_15=q-sqrt(-rho*p*q);
    % due to the matlab small number issues.
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
plot(log10(n_set),log10(var_RR),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(n_set),log10(var_pro),'-ro','LineWidth',2,'Markersize',10)
hold on
plot(log10(n_set),log10(ldp),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(n_set),log10(gldp),'-ro','LineWidth',2,'Markersize',10)
hold on
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1",'location','SW');
xlabel("n")
ylabel("MSE")
set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
% set(gca,'yTick',[-4,-2,0,2,4]);
% set(gca,'yTickLabel',{'10^{-4}','10^{-2}','1','10^{2}','10^{4}'});
% axis([0,6.5,-4.8,4.5])
set(gca,'Fontsize',18)


% save ./MSE_n_e001_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./MSE_n_e01_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./MSE_n_e1_f001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

% save ./MSE_n_e001_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./MSE_n_e01_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./MSE_n_e1_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0


% save ./MSE_n_e001_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./MSE_n_e01_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
save ./MSE_n_e1_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

