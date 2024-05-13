close all
clear
clc
N=[2,20,200, 2000, 20000,200000,2e6];
load ./data/var1_n_e0001.mat
f=0.01;
n1=N.*f;
n0=N-n1;
var_pro_f001=[];
var_pro_f001(1,:)=var_pro;
var_rr_f001(1,:)=var_RR;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro1=mean(pro,2);
re_rr1=mean(rr,2);

load ./data/var1_n_e001.mat
var_pro_f001(2,:)=var_pro;
var_rr_f001(2,:)=var_RR;
f=0.01;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro2=mean(pro,2);
re_rr2=mean(rr,2);

load ./data/var1_n_e01.mat
var_pro_f001(3,:)=var_pro;
var_rr_f001(3,:)=var_RR;
f=0.01;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro4=mean(pro,2);
re_rr4=mean(rr,2);
load ./data/var1_n_e1.mat
var_pro_f001(4,:)=var_pro;
var_rr_f001(4,:)=var_RR;
f=0.01;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro8=mean(pro,2);
re_rr8=mean(rr,2);

load ./data/var1_n_e0001_f01.mat
var_pro_f01(1,:)=var_pro;
var_rr_f01(1,:)=var_RR;
f=0.1;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro1_f01=mean(pro,2);
re_rr1_f01=mean(rr,2);
load ./data/var1_n_e001_f01.mat
var_pro_f01(2,:)=var_pro;
var_rr_f01(2,:)=var_RR;
f=0.1;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro2_f01=mean(pro,2);
re_rr2_f01=mean(rr,2);
load ./data/var1_n_e01_f01.mat
var_pro_f01(3,:)=var_pro;
var_rr_f01(3,:)=var_RR;
f=0.1;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro4_f01=mean(pro,2);
re_rr4_f01=mean(rr,2);
load ./data/var1_n_e1_f01.mat
var_pro_f01(4,:)=var_pro;
var_rr_f01(4,:)=var_RR;
f=0.1;
n1=N.*f;
n0=N-n1;
for i=1:size(N,2)
    pro(i,:)=(abs(est_pro1(i,:)-n1(i))./n1(i)+abs(est_pro0(i,:)-n0(i))./n0(i))./2;
    rr(i,:)=(abs(est_rr1(i,:)-n1(i))./n1(i)+abs(est_rr0(i,:)-n0(i))./n0(i))./2;
end
re_pro8_f01=mean(pro,2);
re_rr8_f01=mean(rr,2);

load ./data/var1_n_e0001_f1.mat
var_pro_f1=[];
var_pro_f1(1,:)=var_pro;
var_rr_f1(1,:)=var_RR;
load ./data/var1_n_e001_f1.mat
var_pro_f1(2,:)=var_pro;
var_rr_f1(2,:)=var_RR;
load ./data/var1_n_e01_f1.mat
var_pro_f1(3,:)=var_pro;
var_rr_f1(3,:)=var_RR;
load ./data/var1_n_e1_f1.mat
var_pro_f1(4,:)=var_pro;
var_rr_f1(4,:)=var_RR;
%% display adveraged MSE
% figure
% plot(log10(N),log10(var_rr_f01(1,:)),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f001(1,:)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1",'location','NW');
% xlabel("n")
% ylabel("MSE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
% set(gca,'yTick',[6,8,10,12]);
% set(gca,'yTickLabel',{'10^6','10^8','10^{10}','10^{12}'});
% axis([0,6.5,6,12.5])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 var_n_e0001.pdf
% % 
% figure
% plot(log10(N),log10(var_rr_f01(2,:)),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f001(2,:)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f01(2,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f1(2,:)),'-m+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1",'location','NW');
% xlabel("n")
% ylabel("MSE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
% set(gca,'yTick',[4,6,8,10]);
% set(gca,'yTickLabel',{'10^4','10^6','10^8','10^{10}'});
% axis([0,6.5,4,10.5])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 var_n_e001.pdf
% % % % 
% figure
% plot(log10(N),log10(var_rr_f01(3,:)),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f001(3,:)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f01(3,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f1(3,:)),'-m+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1",'location','NW');
% xlabel("n")
% ylabel("MSE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
% set(gca,'yTick',[2,4,6,8]);
% set(gca,'yTickLabel',{'10^2','10^4','10^6','10^{8}'});
% axis([0,6.5,2,8.5])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 var_n_e01.pdf
% % % 
% figure
% plot(log10(N),log10(var_rr_f01(4,:)),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f001(4,:)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f01(4,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(var_pro_f1(4,:)),'-m+','LineWidth',2,'Markersize',10)
% hold on
% h=legend("RR","JRR f=0.01","JRR f=0.1","JRR f=1",'location','NW');
% xlabel("n")
% ylabel("MSE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
% set(gca,'yTick',[0,2,4,6]);
% set(gca,'yTickLabel',{'0','10^2','10^4','10^6'});
% axis([0,6.5,0,6.5])
% set(gca,'Fontsize',18)
% set(h,'Fontsize',15)
% print -painters -dpdf -r300 var_n_e1.pdf
% 
% %% ------------- display of RE-----------------
figure
plot(log10(N),log10(re_rr1),':bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro1),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_rr1_f01),':r+','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro1_f01),'-r+','LineWidth',2,'Markersize',10)
hold on
h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','SW');
xlabel("n")
ylabel("ARE")
set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
set(gca,'YTick',[0,log10(10),log10(100),3,4,5]);
set(gca,'yTickLabel',{'1','10','10^2','10^3','10^4','10^5'});
axis([0,6.5,0,5])
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r300 re_n_e0001.pdf
% 
figure
plot(log10(N),log10(re_rr2),':bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro2),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_rr2_f01),':r+','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro2_f01),'-r+','LineWidth',2,'Markersize',10)
hold on
h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','SW');
xlabel("n")
ylabel("ARE")
set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
set(gca,'YTick',[log10(0.1),log10(1),log10(10),log10(100),3,4]);
set(gca,'yTickLabel',{'0.1','1','10','10^2','10^3','10^4'});
axis([0,6.5,-1,4])
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r300 re_n_e001.pdf

figure
plot(log10(N),log10(re_rr4),':bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro4),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_rr4_f01),':r+','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro4_f01),'-r+','LineWidth',2,'Markersize',10)
hold on
h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','NE');
xlabel("n")
ylabel("ARE")
set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
set(gca,'YTick',[-2,log10(0.1),log10(1),log10(10),log10(100),3,4]);
set(gca,'yTickLabel',{'0.01','0.1','1','10','10^2','10^3','10^4'});
axis([0,6.5,-2,3])
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r300 re_n_e01.pdf

figure
plot(log10(N),log10(re_rr8),':bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro8),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_rr8_f01),':r+','LineWidth',2,'Markersize',10)
hold on
plot(log10(N),log10(re_pro8_f01),'-r+','LineWidth',2,'Markersize',10)
hold on
h=legend("RR f=0.01","JRR f=0.01","RR f=0.1","JRR f=0.1",'location','NE');
xlabel("n")
ylabel("ARE")
set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{'2','20','200','2000','20000','200000','2000000'});
set(gca,'YTick',[-3,log10(0.01),log10(0.1),log10(1),log10(10),log10(100),3]);
set(gca,'yTickLabel',{'0.001','0.01','0.1','1','10','10^2','10^3'});
axis([0,6.5,-2.7,2])
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r300 re_n_e1.pdf
% 
% figure
% plot(log10(N),log10(re_rr2),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro2),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_rr2_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro2_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% legend("RR f=0.01","CRRM f=0.01","RR f=0.1","CRRM f=0.1",'location','SW')
% xlabel("n")
% ylabel("Averaged RE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000'});
% set(gca,'YTick',[log10(0.1),log10(0.2),log10(0.5),log10(1),log10(2),log10(5)]);
% set(gca,'yTickLabel',{'0.1','0.2','0.5','1','2','5'});
% axis([0,5.5,log10(0.05),log10(5)])
% set(gca,'Fontsize',15)
% print -painters -dpdf -r300 re_n_e002.pdf
% 
% figure
% plot(log10(N),log10(re_rr4),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro4),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_rr4_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro4_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% legend("RR f=0.01","CRRM f=0.01","RR f=0.1","CRRM f=0.1",'location','SW')
% xlabel("n")
% ylabel("Averaged RE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000'});
% set(gca,'YTick',[log10(0.1),log10(0.2),log10(0.5),log10(1),log10(2),log10(5)]);
% set(gca,'yTickLabel',{'0.1','0.2','0.5','1','2','5'});
% axis([0,5.5,log10(0.05),log10(5)])
% set(gca,'Fontsize',15)
% print -painters -dpdf -r300 re_n_e004.pdf
% 
% figure
% plot(log10(N),log10(re_rr8),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro8),'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_rr8_f01),':r+','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(N),log10(re_pro8_f01),'-r+','LineWidth',2,'Markersize',10)
% hold on
% legend("RR f=0.01","CRRM f=0.01","RR f=0.1","CRRM f=0.1",'location','SW')
% xlabel("n")
% ylabel("Averaged RE")
% set(gca,'XTick',[log10(2),log10(20),log10(200),log10(2000),log10(20000),log10(200000)]);
% set(gca,'XTickLabel',{'2','20','200','2000','20000','200000'});
% set(gca,'YTick',[log10(0.1),log10(0.2),log10(0.5),log10(1),log10(2)]);
% set(gca,'yTickLabel',{'0.1','0.2','0.5','1','2'});
% axis([0,5.5,log10(0.05),log10(2)])
% set(gca,'Fontsize',15)
% print -painters -dpdf -r300 re_n_e008.pdf