close all
clear
clc

E=[0.001, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1];

load ./estimated_n10k_f001.mat
var_pro_f001=[];
var_pro_f001(1,:)=var_pro;
var_rr_f001(1,:)=var_RR;
re_pro1=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr1=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
load ./estimated_n40k_f001.mat
var_pro_f001(2,:)=var_pro;
var_rr_f001(2,:)=var_RR;
re_pro2_f001=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr2=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
load ./estimated_n80k_f001.mat
var_pro_f001(3,:)=var_pro;
var_rr_f001(3,:)=var_RR;
re_pro4=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr4=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);


load ./estimated_n10k_f01.mat
var_pro_f01=[];
var_pro_f01(1,:)=var_pro;
re_pro1_f01=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr1_f01=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
load ./estimated_n40k_f01.mat
var_pro_f01(2,:)=var_pro;
re_pro2_f01=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr2_f01=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
load ./estimated_n80k_f01.mat
var_pro_f01(3,:)=var_pro;
re_pro4_f01=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
re_rr4_f01=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);


load ./estimated_n10k_f1.mat
var_pro_f1=[];
var_pro_f1(1,:)=var_pro;
re_pro1_f1=mean((abs(est_pro1-n1)./n1),2);
re_rr1_f1=mean((abs(est_rr1-n1)./n1),2);
load ./estimated_n40k_f1.mat
var_pro_f1(2,:)=var_pro;
re_pro2_f1=mean((abs(est_pro1-n1)./n1),2);
re_rr2_f1=mean((abs(est_rr1-n1)./n1),2);
load ./estimated_n80k_f1.mat
var_pro_f1(3,:)=var_pro;
re_pro4_f1=mean((abs(est_pro1-n1)./n1),2);
re_rr4_f1=mean((abs(est_rr1-n1)./n1),2);


%% display of MSE
figure
plot(log10(E),log10(var_rr_f001(1,:)),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(E),log10(var_pro_f001(1,:)),'-ro','LineWidth',2,'Markersize',10)
hold on
plot(log10(E),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',10)
hold on
plot(log10(E),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',10)
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",Interpreter='latex');
xlabel("$\varepsilon$",Interpreter='latex')
ylabel("MSE")
set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
    log10(0.02),log10(0.05),log10(0.1)]);
set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
set(gca,'yTick',[5,7,9,11]);
set(gca,'yTickLabel',{'10^5','10^7','10^9','10^{11}'});
axis([-3.05 -0.95 5 11])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',16,'Fontname','Times New Roman')
print -painters -dpdf -r300 MSE_n_10k.pdf


figure
plot(log10(E),log10(var_rr_f001(2,:)),'-bd','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f001(2,:)),'-ro','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f01(2,:)),'-g*','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f1(2,:)),'-m+','LineWidth',2,'Markersize',8)
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",Interpreter='latex');
xlabel("$\varepsilon$",Interpreter='latex')
ylabel("MSE")
set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
    log10(0.02),log10(0.05),log10(0.1)]);
set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
set(gca,'yTick',[5,7,9,11]);
set(gca,'yTickLabel',{'10^5','10^7','10^9','10^{11}'});
axis([-3.05 -0.95 5 11])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',16,'Fontname','Times New Roman')
print -painters -dpdf -r300 MSE_n_40k.pdf


figure
plot(log10(E),log10(var_rr_f001(3,:)),'-bd','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f001(3,:)),'-ro','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f01(3,:)),'-g*','LineWidth',2,'Markersize',8)
hold on
plot(log10(E),log10(var_pro_f1(3,:)),'-m+','LineWidth',2,'Markersize',8)
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",Interpreter='latex');
xlabel("$\varepsilon$",Interpreter='latex')
ylabel("MSE")
set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
    log10(0.02),log10(0.05),log10(0.1)]);
set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
set(gca,'yTick',[5,7,9,11]);
set(gca,'yTickLabel',{'10^5','10^7','10^9','10^{11}'});
axis([-3.05 -0.95 5 11])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',16,'Fontname','Times New Roman')
print -painters -dpdf -r300 MSE_n_80k.pdf


% %% display of RE
% figure
% plot(log10(E),log10(re_rr1),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro1),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_rr1_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro1_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR $n_1/n=0.01$","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','SW',Interpreter='latex');
% xlabel("$\varepsilon$",Interpreter='latex')
% ylabel("ARE")
% set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
%     log10(0.02),log10(0.05),log10(0.1)]);
% set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
% set(gca,'yTick',[log10(0.1),log10(1),log10(10),log10(100),log10(500)]);
% set(gca,'yTickLabel',{'0.1','1','10','100','500'});
% axis([log10(0.0009) log10(0.11) log10(0.08) log10(600) ])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 RE_n10k.pdf
% 
% 
% figure
% plot(log10(E),log10(re_rr2),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro2),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_rr2_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro2_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','SW');
% xlabel("\varepsilon",Interpreter='latex')
% ylabel("ARE")
% set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
%     log10(0.02),log10(0.05),log10(0.1)]);
% set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
% set(gca,'yTick',[log10(0.1),log10(1),log10(10),log10(100),log10(500)]);
% set(gca,'yTickLabel',{'0.1','1','10','100','500'});
% axis([log10(0.0009) log10(0.11) log10(0.08) log10(500) ])
% set(gca,'Fontsize',20,'Fontname','Times New Roman')
% set(h,'Fontsize',18,'Fontname','Times New Roman')
% print -painters -dpdf -r300 RE_n40k.pdf
% 
% 
% figure
% plot(log10(E),log10(re_rr4),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro4),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_rr4_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(re_pro4_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','SW');
% xlabel("\varepsilon",Interpreter='latex')
% ylabel("ARE")
% set(gca,'xTick',[log10(0.001),log10(0.002),log10(0.005),log10(0.01),...
%     log10(0.02),log10(0.05),log10(0.1)]);
% set(gca,'xTickLabel',{'0.001','0.002','0.005','0.01','0.02','0.05','0.1'});
% set(gca,'yTick',[log10(0.1),log10(1),log10(10),log10(100),log10(500)]);
% set(gca,'yTickLabel',{'0.1','1','10','100','500'});
% axis([log10(0.0009) log10(0.11) log10(0.08) log10(500) ])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 RE_n80k.pdf