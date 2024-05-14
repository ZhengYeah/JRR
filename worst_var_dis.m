close all
close
clc

E=[0.001,0.002,0.005,0.01,0.02,0.05,0.1,0.2,0.5,1];
% load ./data/worst2_e_n100
% var_pro_n01=gldp;
% var_rr_n01=ldp;
% 
% load ./data/var_worst2_e_n1k
% f=0.5;
% var_pro_n1=gldp;
% var_rr_n1=ldp;

% re_pro_n1=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
% re_rr_n1=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
% load ./data/var_worst2_e_n10k
% var_pro_n10=gldp;
% var_rr_n10=ldp;
load ./data/var_worst2_e_n20k.mat
var_pro_n20=gldp;
var_rr_n20=ldp;
load ./data/var_worst2_e_n40k.mat
var_pro_n40=gldp;
var_rr_n40=ldp;
load ./data/var_worst2_e_n80k.mat
var_pro_n80=gldp;
var_rr_n80=ldp;
% re_pro_n10=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
% re_rr_n10=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);
% load ./data/worst2_e_n100k
% var_pro_n100=gldp;
% var_rr_n100=ldp;
% re_pro_n100=mean((abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2,2);
% re_rr_n100=mean((abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2,2);

figure
% plot((E),log10((var_pro_n01-var_rr_n01)./var_rr_n01),'-m+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10((var_pro_n1-var_rr_n1)./var_rr_n1),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10((var_pro_n10-var_rr_n10)./var_rr_n10),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10((var_pro_n100-var_rr_n100)./var_rr_n100),'-ro','LineWidth',2,'Markersize',10)
% % % 
plot(log10(E),log10((var_pro_n20-var_rr_n20)./var_rr_n20),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(E),log10((var_pro_n40-var_rr_n40)./var_rr_n40),'-g*','LineWidth',2,'Markersize',10)
hold on
plot(log10(E),log10((var_pro_n80-var_rr_n80)./var_rr_n80),'-ro','LineWidth',2,'Markersize',10)
% 
% set(gca,'xTick',[log10(0.01),log10(0.02),log10(0.05),log10(0.1),log10(0.2),log10(0.5), log10(1)]);
% set(gca,'xTickLabel',{'0.01','0.02','0.05','0.1','0.2','0.5','1'});
set(gca,'xTick',[-3,-2,-1,0]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
set(gca,'yTick',[-3,-2,-1,0]);
set(gca,'yTickLabel',{'0.001','0.01','0.1','1'})
% set(gca,'yTick',[log10(0.0001),log10(0.0002),log10(0.0005),log10(0.001),log10(0.002),log10(0.005), log10(0.01)]);
% set(gca,'yTickLabel',{'0.0001','0.0002','0.0005','0.001','0.002','0.005','0.01'});
% legend("JRR n=2,000 ","JRR n=20,000","JRR n=200,000",'location','NE')
legend("JRR n=20,000 ","JRR n=40,000","JRR n=80,000",'location','NE')
xlabel("\epsilon")
ylabel("RI")
% 
set(gca,'Fontsize',18)
axis([log10(0.001)-0.05,log10(1)+0.05,-4,-0.8])
print -painters -dpdf -r300 worst_e.pdf

% figure
% plot((E),((re_pro_n1-re_rr_n1)./re_rr_n1),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot((E),((re_pro_n1-re_rr_n10)./re_rr_n10),'-g+','LineWidth',2,'Markersize',10)
% hold on
% plot((E),((re_pro_n1-re_rr_n100)./re_rr_n100),'-ro','LineWidth',2,'Markersize',10)
% legend("CRRM n=1000 ","CRRM n=10,000","CRRM n=100,000",'location','NE')
% xlabel("\epsilon")
% ylabel("RI")
% set(gca,'Fontsize',15)
% print -painters -dpdf -r300 re_worst_e.pdf




