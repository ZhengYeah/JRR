close all
clear
clc

% dset=[0.0001,0.00002,0.00001];
delta=0.00001;
% nset=[10,100,1000,10000,100000,1000000];
% nset=[20,200,2000,20000,200000,2000000];
nset=[10000,20000,30000,40000,60000,80000,100000];
f=0.5;
e=0.01;
TESTNUM=1;
for i=1:length(nset)
    n=nset(i);
    idx=randperm(n);
    raw_data=zeros(n,1);
    n1=floor(n*f);
    if n1>=1
        raw_data(idx(1:n1),1)=1;
    end
    n0=n-n1;
     %% Baseline solution 
    p_b=exp(e)/(1+exp(e));
    q_b=1-p_b;
    ldp(i)=p_b*q_b*n/((p_b-q_b)^2);% ideal case
    for tno=1:TESTNUM
        y_RR=RR(n0,n1,p_b);
        a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        a_est0(tno)=n-a_est1(tno);
    end
    est_rr1(i,:)=a_est1;
    est_rr0(i,:)=a_est0;
    var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;      
    %% CRRM
    [p,rho,flag]=cal_rho(e,n,delta);
    
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));% ideal case
    if flag==1
        p15=p-q;
        p05=q;
        p_15=0;
    else
        p15=p-sqrt(-rho*p*q);
        p05=sqrt(-rho*p*q);
        p_15=q-sqrt(-rho*p*q);
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
plot(log10(nset),log10((gldp-ldp)./ldp),':ro')
% plot(log10(nset),log10((gldp(1,:)-ldp(1,:))./ldp(1,:)),':ro')
% hold on
% plot(log10(nset),log10((gldp(2,:)-ldp(2,:))./ldp(2,:)),'-bd')
% hold on
% plot(log10(nset),log10((gldp(3,:)-ldp(3,:))./ldp(3,:)),'-bd')
% hold on
legend("GLDP","0.0001")
xlabel("n")
% ylabel("Var")
% save ./data/worst1_n_e1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst1_n_e01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
save ./data/worst1_n_e001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst1_n_e0001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

