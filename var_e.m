close all
clear
clc

% load D:/papers/G-LDP/code/Dataset/EC.mat
pdelta=0.001;
rdelta=0.00001;

% E=[0.001,0.002,0.005,0.01,0.02,0.05,0.1];
E=1.8
n=10000;
m=1000;
f=1;
n1=floor(n*f);
n0=n-n1;
idx=randperm(n);
raw_data=zeros(n,1);
raw_data(idx(1:n1),1)=1;

TESTNUM=1;

for i=1:length(E)
    %% RR
    e=E(i);
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
    [p,rho,flag]=cal_p_rho2(e,n,pdelta,rdelta,m)
    q=1-p;
    gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1));
    p15=p-sqrt(-rho*p*q);
    p05=sqrt(-rho*p*q);
    p_15=q-sqrt(-rho*p*q);
    %%%due to the matlab small number issues.
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
% plot(E,log10(var_RR),'-bd','LineWidth',2,'Markersize',10)
% hold on 
% plot(E,log10(var_pro),'-ro','LineWidth',2,'Markersize',10)
% hold on
plot(E,log10(ldp-gldp),':b+','LineWidth',2,'Markersize',10)
hold on 
% plot(E,log10(gldp),':r*','LineWidth',2,'Markersize',10)
% var_rr_f001=[49.9999958333461	12.4999958333354	1.99999583333848	0.499995833354188	0.124995833416664	0.0199958338541150	0.00499583541584023];
% var_pro_f001=[2.39160791064603	0.562122473633504	0.0915366442507508	0.0249382382238952	0.00737663569165858	0.00173254471159853	0.000655137231572248];
% var_pro_f01=[21.3023690095211	4.89970574775063	0.750128724127762	0.186132394939252	0.0469534107781457	0.00784711296189200	0.00210599618915356];
% var_pro_f1=[0.0543228310097790	0.0260166757089138	0.0101376231423563	0.00501536492199719	0.00248512416411521	0.000976811557067877	0.000475817585129613];
% 
% plot(log10(E),log10(var_rr_f001(1,:)),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(var_pro_f001(1,:)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',10)
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1");
% xlabel("\epsilon")
% ylabel("MSE")
% set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
%     log10(0.02),log10(0.05),log10(0.1)]);
% set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
% set(gca,'yTick',[-4,-2,0,2]);
% set(gca,'yTickLabel',{'10^{-4}','10^{-2}','10^0','10^{2}'});
% axis([-3.05 -0.95 -4 2])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 var_e_nsf.pdf


% save ./data/var1_e_n10k_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n20k_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n40k_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n80k_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

% save ./data/var1_e_n10k_f01_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n20k_f01_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n40k_f01_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n80k_f01_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

% save ./data/var1_e_n10k_f1_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n20k_f1_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n40k_f1_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var1_e_n80k_f1_m05.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0

%%%----the result of d=0.000005
% save ./data/var_e_n10k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n20k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n40k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n80k.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n10k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n20k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n40k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n80k_f01.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n10k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n20k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n40k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
% save ./data/var_e_n80k_f1.mat var_RR var_pro est_pro0 est_pro1 est_rr0 est_rr1 ldp gldp n1 n0
