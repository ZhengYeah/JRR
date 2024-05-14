close all
clear
clc
load ./data/p_rho_e1_n20k.mat 
delta=0.005;

plot(pl,rl);
hold on
plot(pl,rr);
hold on
c=[1,1,0.8];
p1=fill([pl,fliplr(pl)],[rl,fliplr(rr)],c);
% p1.EdgeColor = c;

hold on
e=1;
p=exp(e)/(1+exp(e));
plot([p,p],[-1.1,1.1],':b','LineWidth',1.5)
hold on
pp=0.48:delta:0.74;
plot(pp,1-1./pp,':r','LineWidth',1.5)
hold on

set(gca,'Fontsize',18)


load ./data/p_rho_e01_n20k.mat
plot(pl,rl);
hold on
plot(pl,rr);
hold on
c=[1,0.9,0.5];
p2=fill([pl,fliplr(pl)],[rl,fliplr(rr)],c);
% p2.EdgeColor = c;
e=0.1;
p=exp(e)/(1+exp(e));
plot([p,p],[-1.1,1.1],':k','LineWidth',1.5)
hold on



load ./data/p_rho_e001_n20k.mat
plot(pl,rl);
hold on
plot(pl,rr);
hold on
c=[1,0.6,0];
p3=fill([pl,fliplr(pl)],[rl,fliplr(rr)],c);
% p3.EdgeColor = c;
hold on
e=0.01;
p=exp(e)/(1+exp(e));
plot([p,p],[-1.1,1.1],':m','LineWidth',1.5)
hold on
xlabel('p')
ylabel('\rho')
h=legend([p1,p2,p3],"\epsilon=1","\epsilon=0.1","\epsilon=0.01",'location','SE')


text(0.6,-0.7,'\leftarrow 1-1/p','Fontsize',15,'color','red')
hold on
text(0.667,0.8,'e^1/(1+e^1)\rightarrow ','Fontsize',15,'color','blue')
hold on
text(0.525,-0.5,'\leftarrow e^{0.1}/(1+e^{0.1}) ','Fontsize',15,'color','k')
hold on
text(0.502,0.3,'\leftarrow e^{0.01}/(1+e^{0.01})','Fontsize',15,'color','m')
set(gca,'Fontsize',18)
set(h,'Fontsize',15,'Position',[0.75,0.22,0.1,0.1])
axis([0.485,0.75,-1.05,1.05])

print -painters -dpdf -r300 p_rho_n20k.pdf
% hold on
% plot(pl,1-1./pl,'-ro')
% hold on
% q=1-pl;
% plot(pl,1-1./(2*q),'-ro')
% hold on
% plot(pl,1-1./(2*pl),'-go')
% n=20;
% y=exp(2*1);
% a=(pl.*q+pl.*pl*(n-2)-q.*q*y*(n-1))./(pl.*q*(1+y));
% b=(pl.*pl-y*q.*q).*(n-1)./(pl.*q.*(y-1));
% plot(pl,b,'-m+')
% hold on
% plot(pl,a,'-bo')
