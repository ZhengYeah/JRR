close all
clear
clc
e=0.01;
n=2;
delta=0.00001;
rdelta=0.01;
F=0.1;
for i=1:1
    f=F(i);
p=exp(e)/(1+exp(e));
q=1-p;
RR(i)=p*q*n/((p-q)^2)
[p,rho,flag]=cal_p_rho(e,n,delta,rdelta);
q=1-p;

gldp(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1))


[p,rho,flag]=cal_rho_p(e,n,delta,rdelta);
q=1-p;

gldp2(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1))

[p,rho,flag]=cal_rho(e,n,delta);
q=1-p;
gldp3(i)=p*q*n/((p-q)^2)+p*q*rho*n/((p-q)^2)*((n*(2*f-1)^2-1)/(n-1))
end
% plot(F,RR,'-bo');
% hold on
% plot(F,gldp,'-r+');
% hold on
% % plot(F,gldp2,'-g+');
% hold on
% plot(F,gldp3,':r+');
% hold on