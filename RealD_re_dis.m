close all
clear
clc
% load ./data/e_var_Ecomm1.mat
load ./data/e_var_Ecomm0.mat
ec_pro=var_pro;
ec_rr=var_RR;
ec_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
ec_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;


% load ./data/e_var_amazon1.mat
load ./data/e_var_amazon0.mat
a_pro=var_pro;
a_rr=var_RR;
a_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
a_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;



% load ./data/e_var_impus1.mat
load ./data/e_var_impus0.mat
i_pro=var_pro;
i_rr=var_RR;
i_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
i_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;



% load ./data/e_var_kos1.mat
load ./data/e_var_kos0.mat
k_pro=var_pro;
k_rr=var_RR;
k_pro_e=(abs(est_pro1-n1)./n1+abs(est_pro0-n0)./n0)./2;
k_rr_e=(abs(est_rr1-n1)./n1+abs(est_rr0-n0)./n0)./2;



% a_pro=[mean(a_pro_e(1,:)),mean(a_pro_e(2,:)),mean(a_pro_e(3,:)),mean(a_pro_e(4,:))];
% a_rr=[mean(a_rr_e(1,:)),mean(a_rr_e(2,:)),mean(a_rr_e(3,:)),mean(a_rr_e(4,:))];
% k_pro=[mean(k_pro_e(1,:)),mean(k_pro_e(2,:)),mean(k_pro_e(3,:)),mean(k_pro_e(4,:))];
% k_rr=[mean(k_rr_e(1,:)),mean(k_rr_e(2,:)),mean(k_rr_e(3,:)),mean(k_rr_e(4,:))];
% i_pro=[mean(i_pro_e(1,:)),mean(i_pro_e(2,:)),mean(i_pro_e(3,:)),mean(i_pro_e(4,:))];
% i_rr=[mean(i_rr_e(1,:)),mean(i_rr_e(2,:)),mean(i_rr_e(3,:)),mean(i_rr_e(4,:))];
% ec_pro=[mean(ec_pro_e(1,:)),mean(ec_pro_e(2,:)),mean(ec_pro_e(3,:)),mean(ec_pro_e(4,:))];
% ec_rr=[mean(ec_rr_e(1,:)),mean(ec_rr_e(2,:)),mean(ec_rr_e(3,:)),mean(ec_rr_e(4,:))];

Err=0:10:150;
for i=1:size(Err,2)
    cdf_a_pro_e01(i)=size(find(a_pro_e(1,:)<Err(i)),2)/1000;
    cdf_a_rr_e01(i)=size(find(a_rr_e(1,:)<Err(i)),2)/1000;
    cdf_i_pro_e01(i)=size(find(i_pro_e(1,:)<Err(i)),2)/1000;
    cdf_i_rr_e01(i)=size(find(i_rr_e(1,:)<Err(i)),2)/1000;
    cdf_k_pro_e01(i)=size(find(k_pro_e(1,:)<Err(i)),2)/1000;
    cdf_k_rr_e01(i)=size(find(k_rr_e(1,:)<Err(i)),2)/1000;
    cdf_ec_pro_e01(i)=size(find(ec_pro_e(1,:)<Err(i)),2)/1000;
    cdf_ec_rr_e01(i)=size(find(ec_rr_e(1,:)<Err(i)),2)/1000;
end

plot(Err,cdf_k_pro_e01,'-b','LineWidth',2,'Markersize',5)
hold on
plot(Err,cdf_k_rr_e01,':b','LineWidth',2,'Markersize',5)
hold on
plot(Err,cdf_a_pro_e01,'-r','LineWidth',2,'Markersize',5)
hold on
plot(Err,cdf_a_rr_e01,':r','LineWidth',2,'Markersize',5)
hold on
plot(Err,cdf_ec_pro_e01,'-m','LineWidth',2,'Markersize',8)
hold on
plot(Err,cdf_ec_rr_e01,':m','LineWidth',2,'Markersize',8)
hold on
plot(Err,cdf_i_pro_e01,'-g','LineWidth',2,'Markersize',8)
hold on
plot(Err,cdf_i_rr_e01,':g','LineWidth',2,'Markersize',8)
hold on

h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
    "JRR EC","RR EC","JRR Census","RR Census",'location','SE');
xlabel("Relative Error")
ylabel("CDF")
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
% 
print -painters -dpdf -r500 RE_cdf_e0001.pdf
% 
figure
Err=0:1:15;
for i=1:size(Err,2)
    cdf_a_pro_e01(i)=size(find(a_pro_e(2,:)<Err(i)),2)/1000;
    cdf_a_rr_e01(i)=size(find(a_rr_e(2,:)<Err(i)),2)/1000;
    cdf_i_pro_e01(i)=size(find(i_pro_e(2,:)<Err(i)),2)/1000;
    cdf_i_rr_e01(i)=size(find(i_rr_e(2,:)<Err(i)),2)/1000;
    cdf_k_pro_e01(i)=size(find(k_pro_e(2,:)<Err(i)),2)/1000;
    cdf_k_rr_e01(i)=size(find(k_rr_e(2,:)<Err(i)),2)/1000;
    cdf_ec_pro_e01(i)=size(find(ec_pro_e(2,:)<Err(i)),2)/1000;
    cdf_ec_rr_e01(i)=size(find(ec_rr_e(2,:)<Err(i)),2)/1000;
end

plot(Err,cdf_k_pro_e01,'-b','LineWidth',2)
hold on
plot(Err,cdf_k_rr_e01,':b','LineWidth',2)
hold on
plot(Err,cdf_a_pro_e01,'-r','LineWidth',2)
hold on
plot(Err,cdf_a_rr_e01,':r','LineWidth',2)
hold on
plot(Err,cdf_ec_pro_e01,'-m','LineWidth',2)
hold on
plot(Err,cdf_ec_rr_e01,':m','LineWidth',2)
hold on
plot(Err,cdf_i_pro_e01,'-g','LineWidth',2)
hold on
plot(Err,cdf_i_rr_e01,':g','LineWidth',2)
hold on

h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
    "JRR EC","RR EC","JRR Census","RR Census",'location','SE');
xlabel("Relative Error")
ylabel("CDF")
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r500 RE_cdf_e001.pdf
% % 
figure
Err=0:0.1:1.5;
for i=1:size(Err,2)
    cdf_a_pro_e01(i)=size(find(a_pro_e(3,:)<Err(i)),2)/1000;
    cdf_a_rr_e01(i)=size(find(a_rr_e(3,:)<Err(i)),2)/1000;
    cdf_i_pro_e01(i)=size(find(i_pro_e(3,:)<Err(i)),2)/1000;
    cdf_i_rr_e01(i)=size(find(i_rr_e(3,:)<Err(i)),2)/1000;
    cdf_k_pro_e01(i)=size(find(k_pro_e(3,:)<Err(i)),2)/1000;
    cdf_k_rr_e01(i)=size(find(k_rr_e(3,:)<Err(i)),2)/1000;
    cdf_ec_pro_e01(i)=size(find(ec_pro_e(3,:)<Err(i)),2)/1000;
    cdf_ec_rr_e01(i)=size(find(ec_rr_e(3,:)<Err(i)),2)/1000;
end

plot(Err,cdf_k_pro_e01,'-b','LineWidth',2)
hold on
plot(Err,cdf_k_rr_e01,':b','LineWidth',2)
hold on
plot(Err,cdf_a_pro_e01,'-r','LineWidth',2)
hold on
plot(Err,cdf_a_rr_e01,':r','LineWidth',2)
hold on
plot(Err,cdf_ec_pro_e01,'-m','LineWidth',2)
hold on
plot(Err,cdf_ec_rr_e01,':m','LineWidth',2)
hold on
plot(Err,cdf_i_pro_e01,'-g','LineWidth',2)
hold on
plot(Err,cdf_i_rr_e01,':g','LineWidth',2)
hold on

h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
    "JRR EC","RR EC","JRR Census","RR Census",'location','SE');
xlabel("Relative Error")
ylabel("CDF")
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r500 RE_cdf_e01.pdf


Err=0:0.01:0.15;
for i=1:size(Err,2)
    cdf_a_pro_e01(i)=size(find(a_pro_e(4,:)<Err(i)),2)/1000;
    cdf_a_rr_e01(i)=size(find(a_rr_e(4,:)<Err(i)),2)/1000;
    cdf_i_pro_e01(i)=size(find(i_pro_e(4,:)<Err(i)),2)/1000;
    cdf_i_rr_e01(i)=size(find(i_rr_e(4,:)<Err(i)),2)/1000;
    cdf_k_pro_e01(i)=size(find(k_pro_e(4,:)<Err(i)),2)/1000;
    cdf_k_rr_e01(i)=size(find(k_rr_e(4,:)<Err(i)),2)/1000;
    cdf_ec_pro_e01(i)=size(find(ec_pro_e(4,:)<Err(i)),2)/1000;
    cdf_ec_rr_e01(i)=size(find(ec_rr_e(4,:)<Err(i)),2)/1000;
end
figure
plot(Err,cdf_k_pro_e01,'-b','LineWidth',2)
hold on
plot(Err,cdf_k_rr_e01,':b','LineWidth',2)
hold on
plot(Err,cdf_a_pro_e01,'-r','LineWidth',2)
hold on
plot(Err,cdf_a_rr_e01,':r','LineWidth',2)
hold on
plot(Err,cdf_ec_pro_e01,'-m','LineWidth',2)
hold on
plot(Err,cdf_ec_rr_e01,':m','LineWidth',2)
hold on
plot(Err,cdf_i_pro_e01,'-g','LineWidth',2)
hold on
plot(Err,cdf_i_rr_e01,':g','LineWidth',2)
hold on

h=legend("JRR Kosarak","RR Kosarak","JRR Amazon","RR Amazon",...
    "JRR EC","RR EC","JRR Census","RR Census",'location','SE');
xlabel("Relative Error")
ylabel("CDF")
set(gca,'Fontsize',18)
set(h,'Fontsize',15)
print -painters -dpdf -r500 RE_cdf_e1.pdf