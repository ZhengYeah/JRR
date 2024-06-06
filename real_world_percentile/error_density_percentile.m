close all
clear
clc

load ./estimated_EC.mat
ec_pro=var_pro;
ec_rr=var_RR;
ec_pro_e=(abs(est_pro1-n1)./n1 + abs(est_pro0-n0)./n0) ./2;
ec_rr_e=(abs(est_rr1-n1)./n1 + abs(est_rr0-n0)./n0) ./2;

load ./estimated_Amazon.mat
a_pro=var_pro;
a_rr=var_RR;
a_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
a_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;

load ./estimated_Census.mat
i_pro=var_pro;
i_rr=var_RR;
i_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
i_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;

load ./estimated_Kos.mat
k_pro=var_pro;
k_rr=var_RR;
k_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
k_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;

%% used for Relative Error
a_pro=[mean(a_pro_e(1,:)),mean(a_pro_e(2,:)),mean(a_pro_e(3,:)),mean(a_pro_e(4,:))];
a_rr=[mean(a_rr_e(1,:)),mean(a_rr_e(2,:)),mean(a_rr_e(3,:)),mean(a_rr_e(4,:))];
k_pro=[mean(k_pro_e(1,:)),mean(k_pro_e(2,:)),mean(k_pro_e(3,:)),mean(k_pro_e(4,:))];
k_rr=[mean(k_rr_e(1,:)),mean(k_rr_e(2,:)),mean(k_rr_e(3,:)),mean(k_rr_e(4,:))];
i_pro=[mean(i_pro_e(1,:)),mean(i_pro_e(2,:)),mean(i_pro_e(3,:)),mean(i_pro_e(4,:))];
i_rr=[mean(i_rr_e(1,:)),mean(i_rr_e(2,:)),mean(i_rr_e(3,:)),mean(i_rr_e(4,:))];
ec_pro=[mean(ec_pro_e(1,:)),mean(ec_pro_e(2,:)),mean(ec_pro_e(3,:)),mean(ec_pro_e(4,:))];
ec_rr=[mean(ec_rr_e(1,:)),mean(ec_rr_e(2,:)),mean(ec_rr_e(3,:)),mean(ec_rr_e(4,:))];


%% epsilon = 0.01
figure
Err=0:1:15;

for i=1:size(Err,2)
    if size(find(a_pro_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_pro_e01(i)=size(find(a_pro_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(a_rr_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_rr_e01(i)=size(find(a_rr_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(i_pro_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_pro_e01(i)=size(find(i_pro_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(i_rr_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_rr_e01(i)=size(find(i_rr_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(k_pro_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_pro_e01(i)=size(find(k_pro_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(k_rr_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_rr_e01(i)=size(find(k_rr_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(ec_pro_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_pro_e01(i)=size(find(ec_pro_e(2,:)<Err(i)),2)/1000;
    end
    if size(find(ec_rr_e(2,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_rr_e01(i)=size(find(ec_rr_e(2,:)<Err(i)),2)/1000;
    end
end

plot(cdf_k_pro_e01,Err(1:length(cdf_k_pro_e01)),'-','Color',[0 0 1],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_k_rr_e01,Err(1:length(cdf_k_rr_e01)),'--','Color',[0 0 1 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_pro_e01,Err(1:length(cdf_a_pro_e01)),'-','Color',[1 0 0],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_rr_e01,Err(1:length(cdf_a_rr_e01)),'--','Color',[1 0 0 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_ec_pro_e01,Err(1:length(cdf_ec_pro_e01)),'-m','LineWidth',2,'Markersize',8)
hold on
plot(cdf_ec_rr_e01,Err(1:length(cdf_ec_rr_e01)),'--','Color',[1 0 1 0.4],'LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_pro_e01,Err(1:length(cdf_i_pro_e01)),'-g','LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_rr_e01,Err(1:length(cdf_i_rr_e01)),'--','Color',[0 1 0 0.4],'LineWidth',2,'Markersize',8)
hold on

h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
    "JRR EC","RR EC","JRR Census","RR Census",'location','northwest');
xlabel("Percentile")
ylabel("Relative Error")
set(gca,'Fontsize',20)
set(h,'Fontsize',15)
set(gca,'Fontname','Times New Roman')
print -vector -dpdf -r500 percentile_e001.pdf

%% epsilon = 0.1

figure
Err=0:0.1:1.5;
for i=1:size(Err,2)
    if size(find(a_pro_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_pro_e01(i)=size(find(a_pro_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(a_rr_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_rr_e01(i)=size(find(a_rr_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(i_pro_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_pro_e01(i)=size(find(i_pro_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(i_rr_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_rr_e01(i)=size(find(i_rr_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(k_pro_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_pro_e01(i)=size(find(k_pro_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(k_rr_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_rr_e01(i)=size(find(k_rr_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(ec_pro_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_pro_e01(i)=size(find(ec_pro_e(3,:)<Err(i)),2)/1000;
    end
    if size(find(ec_rr_e(3,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_rr_e01(i)=size(find(ec_rr_e(3,:)<Err(i)),2)/1000;
    end
end

plot(cdf_k_pro_e01,Err(1:length(cdf_k_pro_e01)),'-','Color',[0 0 1],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_k_rr_e01,Err(1:length(cdf_k_rr_e01)),'--','Color',[0 0 1 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_pro_e01,Err(1:length(cdf_a_pro_e01)),'-','Color',[1 0 0],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_rr_e01,Err(1:length(cdf_a_rr_e01)),'--','Color',[1 0 0 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_ec_pro_e01,Err(1:length(cdf_ec_pro_e01)),'-m','LineWidth',2,'Markersize',8)
hold on
plot(cdf_ec_rr_e01,Err(1:length(cdf_ec_rr_e01)),'--','Color',[1 0 1 0.4],'LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_pro_e01,Err(1:length(cdf_i_pro_e01)),'-g','LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_rr_e01,Err(1:length(cdf_i_rr_e01)),'--','Color',[0 1 0 0.4],'LineWidth',2,'Markersize',8)
hold on

% h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
%     "JRR EC","RR EC","JRR Census","RR Census",'location','northwest');
xlabel("Percentile")
ylabel("Relative Error")
set(gca,'Fontsize',20)
% set(h,'Fontsize',15)
set(gca,'Fontname','Times New Roman')
print -vector -dpdf -r500 percentile_e01.pdf

%% epsilon = 1
figure
Err=0:0.01:0.15;
for i=1:size(Err,2)
    if size(find(a_pro_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_pro_e01(i)=size(find(a_pro_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(a_rr_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_a_rr_e01(i)=size(find(a_rr_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(i_pro_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_pro_e01(i)=size(find(i_pro_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(i_rr_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_i_rr_e01(i)=size(find(i_rr_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(k_pro_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_pro_e01(i)=size(find(k_pro_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(k_rr_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_k_rr_e01(i)=size(find(k_rr_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(ec_pro_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_pro_e01(i)=size(find(ec_pro_e(4,:)<Err(i)),2)/1000;
    end
    if size(find(ec_rr_e(4,:)<Err(i)),2)/1000 <= 0.98
        cdf_ec_rr_e01(i)=size(find(ec_rr_e(4,:)<Err(i)),2)/1000;
    end
end

plot(cdf_k_pro_e01,Err(1:length(cdf_k_pro_e01)),'-','Color',[0 0 1],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_k_rr_e01,Err(1:length(cdf_k_rr_e01)),'--','Color',[0 0 1 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_pro_e01,Err(1:length(cdf_a_pro_e01)),'-','Color',[1 0 0],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_a_rr_e01,Err(1:length(cdf_a_rr_e01)),'--','Color',[1 0 0 0.4],'LineWidth',2,'Markersize',5)
hold on
plot(cdf_ec_pro_e01,Err(1:length(cdf_ec_pro_e01)),'-m','LineWidth',2,'Markersize',8)
hold on
plot(cdf_ec_rr_e01,Err(1:length(cdf_ec_rr_e01)),'--','Color',[1 0 1 0.4],'LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_pro_e01,Err(1:length(cdf_i_pro_e01)),'-g','LineWidth',2,'Markersize',8)
hold on
plot(cdf_i_rr_e01,Err(1:length(cdf_i_rr_e01)),'--','Color',[0 1 0 0.4],'LineWidth',2,'Markersize',8)
hold on

% h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
%     "JRR EC","RR EC","JRR Census","RR Census",'location','northwest');
xlabel("Percentile")
ylabel("Relative Error")
set(gca,'Fontsize',20)
% set(h,'Fontsize',15)
set(gca,'Fontname','Times New Roman')
print -vector -dpdf -r500 percentile_e1.pdf
