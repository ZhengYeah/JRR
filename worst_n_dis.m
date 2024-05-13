close all
clear
clc

figure

N=20000:20000:200000;
load ./data/worst1_n_e1.mat
f=0.5;
var_pro_e1=gldp;
var_rr_e1=ldp;
load ./data/worst1_n_e01.mat
var_pro_e01=gldp;
var_rr_e01=ldp;
load ./data/worst1_n_e001.mat
var_pro_e001=gldp;
var_rr_e001=ldp;
load ./data/worst1_n_e0001.mat
var_pro_e0001=gldp;
var_rr_e0001=ldp;

plot(N,log10((var_pro_e1-var_rr_e1)./var_rr_e1),'-ro','LineWidth',2,'Markersize',10)
hold on
plot(N,log10((var_pro_e01-var_rr_e01)./var_rr_e01),'-g*','LineWidth',2,'Markersize',10)
hold on
plot(N,log10((var_pro_e001-var_rr_e001)./var_rr_e001),'-bd','LineWidth',2,'Markersize',10)
hold on
plot(N,log10((var_pro_e0001-var_rr_e0001)./var_rr_e0001),'-m+','LineWidth',2,'Markersize',10)
hold on
% plot(N,(var_pro_e1-var_rr_e1)./var_rr_e1,'-ro','LineWidth',2,'Markersize',10)
% hold on
% plot(N,(var_pro_e01-var_rr_e01)./var_rr_e01,'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(N,(var_pro_e001-var_rr_e001)./var_rr_e001,'-bd','LineWidth',2,'Markersize',10)
% hold on
% plot(N,(var_pro_e0001-var_rr_e0001)./var_rr_e0001,'-m+','LineWidth',2,'Markersize',10)
% hold on
h=legend("JRR e=1","JRR e=0.1","JRR e=0.01","JRR e=0.001","JRR e=0.001",'location','NE')

set(gca,'yTick',[log10(0.0001),log10(0.001),log10(0.01), log10(0.1)]);
% set(gca,'yTickLabel',{'0.0001','0.001','0.01','0.1'});
set(gca,'yTickLabel',{'10^{-4}','10^{-3}','10^{-2}','10^{-1}'});
% set(h,'Position',[0.67,0.71,0.1,0.1])
xlabel("n")
ylabel("RI")

set(gca,'Fontsize',18)
axis([15000 205000 -4.1 -0.9])
% axis([15000,205000,-0.002,0.1])

print -painters -dpdf -r300 worst_n.pdf

