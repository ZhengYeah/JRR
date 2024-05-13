close all
clear
clc
len=13;
n=zeros(1,13)+20000;
F=[0,0.01,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.99,1];

load ./data/var1_f_e0001.mat
n1=n.*F;
n0=n-n1;
var_pro_e(1,:)=gldp;
var_rr_e(1,:)=ldp;
for i=2:len-1
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro1=mean(pro,2);
re_rr1=mean(rr,2);
% re_pro1=mean(abs(est_pro1-n1),2);
% re_rr1=mean(abs(est_rr1-n1),2);
load ./data/var1_f_e001.mat
n1=n.*F;
n0=n-n1;
var_pro_e(2,:)=gldp;
var_rr_e(2,:)=ldp;
for i=2:len-1
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro2=mean(pro,2);
re_rr2=mean(rr,2);

load ./data/var1_f_e01.mat
n1=n.*F;
n0=n-n1;
var_pro_e(3,:)=gldp;
var_rr_e(3,:)=ldp;
for i=2:len-1
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro4=mean(pro,2);
re_rr4=mean(rr,2);
load ./data/var1_f_e1.mat
n1=n.*F;
n0=n-n1;
% var_pro_e(4,:)=var_pro;
% var_rr_e(4,:)=var_RR;
var_pro_e(4,:)=gldp;
var_rr_e(4,:)=ldp;
for i=2:len-1
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro8=mean(pro,2);
re_rr8=mean(rr,2);

%% ------display of MSE
% figure
% plot(F,var_rr_e(1,:),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F,var_pro_e(1,:),'-ro','LineWidth',2,'Markersize',10)
% hold on
% % plot(log10(E),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',10)
% % hold on
% % plot(log10(E),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',10)
%  legend("RR","JRR",'location','south')
% xlabel("f")
% ylabel("MSE")
% % set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% % set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
% axis([-0.02 1.02 0 2.5e10 ])
% set(gca,'Fontsize',18)
% print -painters -dpdf -r300 var_f_e0001.pdf
% 
% figure
% plot(F,var_rr_e(2,:),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F,var_pro_e(2,:),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','south')
% xlabel("f")
% ylabel("MSE")
% % set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% % set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
% axis([-0.02 1.02 0 2.2e8 ])
% set(gca,'Fontsize',18)
% print -painters -dpdf -r300 var_f_e001.pdf
% % % 
% figure
% plot(F,var_rr_e(3,:),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F,var_pro_e(3,:),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','south')
% xlabel("f")
% ylabel("MSE")
% % set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% % set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
% axis([-0.02 1.02 0 2.2e6 ])
% set(gca,'Fontsize',18)
% print -painters -dpdf -r300 var_f_e01.pdf
% % 
% figure
% plot(F,var_rr_e(4,:),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F,var_pro_e(4,:),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','south')
% xlabel("f")
% ylabel("MSE")
% % set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% % set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
% axis([-0.02 1.02 1e4 2e4 ])
% set(gca,'Fontsize',18)
% print -painters -dpdf -r300 var_f_e1.pdf

%% display of RE
figure
plot(F(2:len-1),log10(re_rr1(2:len-1)),':bd','LineWidth',2,'Markersize',10)
hold on
plot(F(2:len-1),log10(re_pro1(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
hold on
legend("RR","JRR",'location','N')
xlabel("f")
ylabel("ARE")
set(gca,'Fontsize',18)
% axis([0 1 10 45])
set(gca,'yTick',[log10(10),log10(20),log10(50),log10(100),log10(200),log10(500)]);
set(gca,'yTickLabel',{'10','20','50','100','200','500'});
axis([-0.01 1.01 log10(8),log10(500)])
print -painters -dpdf -r300 re_f_e0001.pdf
% 
figure
plot(F(2:len-1),log10(re_rr2(2:len-1)),':bd','LineWidth',2,'Markersize',10)
hold on
plot(F(2:len-1),log10(re_pro2(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
hold on
legend("RR","JRR",'location','N')
xlabel("f")
ylabel("ARE")
set(gca,'Fontsize',18)
% axis([0 1 1 3.5])
set(gca,'yTick',[log10(1),log10(2),log10(5),log10(10),log10(20),log10(50)]);
set(gca,'yTickLabel',{'1','2','5','10','20','50'});
axis([-0.01 1.01 log10(0.8),log10(50)])
print -painters -dpdf -r300 re_f_e001.pdf
% % 
figure
plot(F(2:len-1),log10(re_rr4(2:len-1)),':bd','LineWidth',2,'Markersize',10)
hold on
plot(F(2:len-1),log10(re_pro4(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
hold on
legend("RR","JRR",'location','N')
xlabel("f")
ylabel("ARE")
set(gca,'Fontsize',18)
% axis([0 1 0.1 0.35])
set(gca,'yTick',[log10(0.1),log10(0.2),log10(0.5),log10(1),log10(2),log10(5)]);
set(gca,'yTickLabel',{'0.1','0.2','0.5','1','2','5'});
axis([-0.01 1.01 log10(0.08),log10(5)])
print -painters -dpdf -r300 re_f_e01.pdf
% 
figure
plot(F(2:len-1),log10(re_rr8(2:len-1)),':bd','LineWidth',2,'Markersize',10)
hold on
plot(F(2:len-1),log10(re_pro8(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
hold on
legend("RR","JRR",'location','N')
xlabel("f")
ylabel("ARE")
set(gca,'Fontsize',18)
set(gca,'yTick',[log10(0.01),log10(0.02),log10(0.05),log10(0.1),log10(0.2),log10(0.5)]);
set(gca,'yTickLabel',{'0.01','0.02','0.05','0.1','0.2','0.5'});
axis([-0.01 1.01 log10(0.008),log10(0.5)])
print -painters -dpdf -r300 re_f_e1.pdf
