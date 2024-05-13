close all
clear
clc

close all
clear
clc


% E=[0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5];
% E=[0.002,0.004,0.006,0.008,0.01];
TESTNUM=1000;
E=[1];
for eno=1:length(E)
    e=E(eno);
%     n_set=[20000];
     n_set=[2000,4000,6000,8000,10000];
    % n_set=[2,4,6,8,10,12];
    f=0.01;
    % delta=0.0001;
    delta=0.0001;
    for i=1:length(n_set)
        n=n_set(1,i);
        idx=randperm(n);
        raw_data=zeros(n,1);
        n1=floor(n*f);
        if n1>=1
            raw_data(idx(1:n1),1)=1;
        end
    
        %% Baseline solution 
        p_b=exp(e)/(1+exp(e));
        q_b=1-p_b;
        %result from RR
        n0=n-n1;
        for tno=1:TESTNUM
            y_RR=RR(n0,n1,p_b);
            a_est1(i,tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
        end
        %% CRRM
        [p,rho,flag]=cal_rho(e,n,delta);
        q=1-p;
       
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
               a_est_n1(i,tno)=(sum(y_coin)-n*q)/(p-q);
        end
    end
end
crrm_m=mean(a_est_n1,2)
rr_m=mean(a_est1,2)
% 
% 
plot(n_set,mean(a_est_n1,2),'-ro' )
hold on
plot(n_set,mean(a_est1,2),'-b+' )
hold on
plot(n_set,n_set.*f,':m')
hold on
legend('CRRM','RR')
% boxplot([a_est_n1',a_est1'],'Labels',{'CRRM','RR'})

% 
% save ./data/var_n_2e.mat var_RR var_pro MAE_RR MAE_pro ldp gldp

