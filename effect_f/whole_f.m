close all
clear
clc

addpath('../')
f_set=[0,0.01,0.1,0.2,0.3,0.4,0.45,0.475,0.5,0.525,0.55,0.6,0.7,0.8,0.9,0.99,1];

n=10000;
e=1;

TESTNUM=1000;

for i=1:length(f_set)
    f=f_set(1,i);
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

% plot((f_set),log10(var_RR(1,:)),':ro')
% hold on
% plot((f_set),log10(var_pro(1,:)),':bd')
% hold on
plot((f_set),ldp,'r--','LineWidth',2)
hold on
plot((f_set),gldp,'-b','LineWidth',2)
hold on
% axis([0 1 6 12])
legend("RR","JRR",'location','south')
xlabel("f")
ylabel("MSE")

% set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^0)]);
% set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','1'});
% axis([-0.02 1.02 -0.02 0.6 ])
% set(gca,'Fontsize',18)
% print -painters -dpdf -r300 var_f_nsf.pdf


% save ./whole_f_n1k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./whole_f_n4k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
save ./whole_f_n10k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0


