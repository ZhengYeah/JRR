close all
clear
clc

E=[0.001,0.002,0.005,0.01,0.02,0.05,0.1,0.2,0.5,1];
% E=1;
RR=exp(E)./(1+exp(E));

n_set=[20,200, 2000, 20000];
% n_set=20000;
% E=[0.001,0.01,0.1,1];
% f=0.01;
% n1=floor(n*f);
% n0=n-n1;
% idx=randperm(n);
% raw_data=zeros(n,1);
% raw_data(idx(1:n1),1)=1;
pdelta=0.00001;
rdelta=0.00001;
m=1;

for i=1:length(E)
    e=E(i);
    for j=1:length(n_set)
        n=n_set(j);
    [P(i,j),R(i,j),flag]=cal_p_rho2(e,n,pdelta,rdelta,m);
    if flag==0
        P(i,j),R(i,j)
    end
    end
end

yyaxis left
plot(log10(E),RR,'-m*','LineWidth',2,'Markersize',10);
hold on
plot(log10(E),P(:,1),'-bd','LineWidth',2,'Markersize',10);
hold on
xlabel('\epsilon')
set(gca,'xTick',[log10(0.001),log10(0.01),log10(0.1),log10(1)]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
ylabel('p')
axis([-3.1,0.1,0.49,1])

yyaxis right
plot(log10(E),R(:,1),'-ro','LineWidth',2,'Markersize',10);
hold on
axis([-3.1,0.1,-1,0.02])
ylabel('\rho')
h=legend('RR: p','JRR: p','JRR: \rho','location','best');
set(h,'position',[0.2,0.45,0.1,0.05])
hold on
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gca,'Fontsize',18)

print -painters -dpdf -r300 alg_n20.pdf

figure
yyaxis left
plot(log10(E),RR,'-m*','LineWidth',2,'Markersize',10);
hold on
plot(log10(E),P(:,2),'-bd','LineWidth',2,'Markersize',10);
hold on
xlabel('\epsilon')
set(gca,'xTick',[log10(0.001),log10(0.01),log10(0.1),log10(1)]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
ylabel('p')
axis([-3.1,0.1,0.49,1])

yyaxis right
plot(log10(E),R(:,2),'-ro','LineWidth',2,'Markersize',10);
hold on
axis([-3.1,0.1,-1,0.02])
ylabel('\rho')
h=legend('RR: p','JRR: p','JRR: \rho','location','best');
set(h,'position',[0.2,0.45,0.1,0.05])
hold on
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gca,'Fontsize',18)

print -painters -dpdf -r300 alg_n200.pdf

figure
yyaxis left
plot(log10(E),RR,'-m*','LineWidth',2,'Markersize',10);
hold on
plot(log10(E),P(:,3),'-bd','LineWidth',2,'Markersize',10);
hold on
xlabel('\epsilon')
set(gca,'xTick',[log10(0.001),log10(0.01),log10(0.1),log10(1)]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
ylabel('p')
axis([-3.1,0.1,0.49,1])

yyaxis right
plot(log10(E),R(:,3),'-ro','LineWidth',2,'Markersize',10);
hold on
axis([-3.1,0.1,-1,0.02])
ylabel('\rho')
h=legend('RR: p','JRR: p','JRR: \rho','location','best');
set(h,'position',[0.2,0.45,0.1,0.05])
hold on
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gca,'Fontsize',18)

print -painters -dpdf -r300 alg_n2k.pdf
figure
yyaxis left
plot(log10(E),RR,'-m*','LineWidth',2,'Markersize',10);
hold on
plot(log10(E),P(:,4),'-bd','LineWidth',2,'Markersize',10);
hold on
xlabel('\epsilon')
set(gca,'xTick',[log10(0.001),log10(0.01),log10(0.1),log10(1)]);
set(gca,'xTickLabel',{'0.001','0.01','0.1','1'});
ylabel('p')
axis([-3.1,0.1,0.49,1])

yyaxis right
plot(log10(E),R(:,4),'-ro','LineWidth',2,'Markersize',10);
hold on
axis([-3.1,0.1,-1,0.02])
ylabel('\rho')
h=legend('RR: p','JRR: p','JRR: \rho','location','best');
set(h,'position',[0.2,0.65,0.1,0.05])
hold on
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
set(gca,'Fontsize',18)

print -painters -dpdf -r300 alg_n20k.pdf
    