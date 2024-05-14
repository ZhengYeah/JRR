close all
clear
clc
n=[10,20,30,40,60,80,100,120,140,160];
e0001=[0.2788,0.3435,0.35991,0.359913,0.35992,0.359923,0.359925,...
    0.359926,0.3599272,0.3599276,0.3599282,0.359929];
e001=[0.4296,0.4501,0.455008,0.455032,0.455055,0.45507,0.455072,...
    0.455077,0.45508,0.455084,0.455085,0.45509];
e01=[0.478215,0.4842,0.48483,0.4849,0.48498,0.485,0.48503,...
    0.48504,0.48505,0.485057,0.4850633,0.485068];
e1=[0.49001,0.49066,0.49088,0.491,0.491115,0.49118,0.49121,...
   0.4912324,0.4912495, 0.4912622,0.4912721,0.4913];
% 
% E=[0.002,0.005,0.01,0.02,0.05, 0.1,0.2,0.5,1];
% rf_n20k=[0.3435,0.38877,0.42945,0.4501,0.4648,0.4777,0.4842,0.4884,0.491,0.491];
% rf_n40k=[0.359913,0.400375,0.436676,0.455032,0.467977,0.47934,0.4849,0.4886,0.491,0.491];
% rf_n80k=[0.359923,0.40039,0.436702,0.45507,0.46803,0.47942,0.485,0.48874,0.49135,0.49118];

E=[0.001];
for eno=1:length(E)
    e=E(eno);
    f_set=0.3435:0.00001:0.36;
    TESTNUM=1;
    delta=0.00001;
%     n=1e6;
     n=20000;
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
        ldp(eno,i)=p_b*q_b*n/((p_b-q_b)^2);% ideal case
        %% CRRM
        [p,rho,flag]=cal_rho(e,n,delta);
        q=1-p;
        gldp(eno,i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));% ideal case
       
    end
end
plot((f_set),log10(gldp(1,:)),'-r.')
hold on
plot((f_set),log10(ldp(1,:)),'-b.')
hold on
legend("GLDP","RR")
xlabel("n")
ylabel("Var")


%%%%%%%%%%%%%%%worst case for E ###########################
% E=[0.01,0.02,0.05,0.1,0.2,0.5,1];
% n=200000;
% f=0.5;
% idx=randperm(n);
% raw_data=zeros(n,1);
% n1=floor(n*f);
% if n1>=1
%     raw_data(idx(1:n1),1)=1;
% end
% n0=n-n1;
% TESTNUM=1;
% delta=0.00001;
% for i=1:length(E)
%     e=E(i);
%     %% Baseline solution 
%     p_b=exp(e)/(1+exp(e));
%     q_b=1-p_b;
%     ldp(i)=p_b*q_b*n/((p_b-q_b)^2);% ideal case
%     for tno=1:TESTNUM
%         y_RR=RR(n0,n1,p_b);
%         a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
%         a_est0(tno)=n-a_est1(tno);
%     end
%     est_rr1(i,:)=a_est1;
%     est_rr0(i,:)=a_est0;
%     var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;
%     %% CRRM
%     [p,rho,flag]=cal_rho(e,n,delta);
%     q=1-p;
%     gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));% ideal case
%     if flag==1
%         p15=p-q;
%         p05=q;
%         p_15=0;
%     else
%         p15=p-sqrt(-rho*p*q);
%         p05=sqrt(-rho*p*q);
%         p_15=q-sqrt(-rho*p*q);
%     end
%         
%     for tno=1:TESTNUM
%        y_coin=gcoin(n,p15,p05,p_15,raw_data);
%        a_est_n1(tno)=(sum(y_coin)-n*q)/(p-q);
%        a_est_n0(tno)=n-a_est_n1(tno);
%     end
%     est_pro1(i,:)=a_est_n1;
%     est_pro0(i,:)=a_est_n0;
%     var_pro(i)=0.5*(sum((a_est_n1-n1).^2)/TESTNUM +sum((a_est_n0-n0).^2)/TESTNUM);
% end
% plot((E),log10((gldp(1,:)-ldp(1,:))./ldp(1,:)),':ro')
% hold on
% xlabel("n")
% ylabel("Var")
% % save ./data/var_worst2_e_n1k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% % save ./data/var_worst2_e_n10k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst2_e_n100k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% % save ./data/worst2_e_n100.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0


%%%%%%%%%%%%%%%worst case for n ###########################
% % dset=[0.0001,0.00002,0.00001];
% delta=0.00001;
% % nset=[10,100,1000,10000,100000,1000000];
% nset=[20,200,2000,20000,200000,2000000];
% f=0.5;
% e=0.1;
% TESTNUM=1;
% for i=1:length(nset)
%     n=nset(i);
%     idx=randperm(n);
%     raw_data=zeros(n,1);
%     n1=floor(n*f);
%     if n1>=1
%         raw_data(idx(1:n1),1)=1;
%     end
%     n0=n-n1;
%      %% Baseline solution 
%     p_b=exp(e)/(1+exp(e));
%     q_b=1-p_b;
%     ldp(i)=p_b*q_b*n/((p_b-q_b)^2);% ideal case
%     for tno=1:TESTNUM
%         y_RR=RR(n0,n1,p_b);
%         a_est1(tno)=(sum(y_RR)-n*q_b)/(p_b-q_b);
%         a_est0(tno)=n-a_est1(tno);
%     end
%     est_rr1(i,:)=a_est1;
%     est_rr0(i,:)=a_est0;
%     var_RR(i)=(sum((a_est1-n1).^2)/TESTNUM+sum((a_est0-n0).^2)/TESTNUM)*0.5;      
%     %% CRRM
%     [p,rho,flag]=cal_rho(e,n,delta);
%     q=1-p;
%     gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));% ideal case
%     if flag==1
%         p15=p-q;
%         p05=q;
%         p_15=0;
%     else
%         p15=p-sqrt(-rho*p*q);
%         p05=sqrt(-rho*p*q);
%         p_15=q-sqrt(-rho*p*q);
%     end
%         
%     for tno=1:TESTNUM
%        y_coin=gcoin(n,p15,p05,p_15,raw_data);
%        a_est_n1(tno)=(sum(y_coin)-n*q)/(p-q);
%        a_est_n0(tno)=n-a_est_n1(tno);
%     end
%     est_pro1(i,:)=a_est_n1;
%     est_pro0(i,:)=a_est_n0;
%     var_pro(i)=0.5*(sum((a_est_n1-n1).^2)/TESTNUM +sum((a_est_n0-n0).^2)/TESTNUM);
% end
% plot(log10(nset),(gldp(1,:)-ldp(1,:))./ldp(1,:),':ro')
% plot(log10(nset),log10((gldp(1,:)-ldp(1,:))./ldp(1,:)),':ro')
% hold on
% plot(log10(nset),log10((gldp(2,:)-ldp(2,:))./ldp(2,:)),'-bd')
% hold on
% plot(log10(nset),log10((gldp(3,:)-ldp(3,:))./ldp(3,:)),'-bd')
% hold on
% legend("GLDP","0.0001")
% xlabel("n")
% ylabel("Var")
% save ./data/worst1_n_e1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst1_n_e01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst1_n_e001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/worst1_n_e0001.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

