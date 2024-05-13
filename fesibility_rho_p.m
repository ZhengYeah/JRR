close all
clear
clc
e=0.01;
n=20000;
delta=0.001;
rdelta=0.0001;

pdelta=0.00001;
% pdelta=0;
MAX_p=exp(e)/(1+exp(e));

P=[MAX_p,MAX_p-pdelta:-delta:0.5];
% P=0.5:delta:MAX_p;
pl=zeros(1,length(P));
rl=zeros(1,length(P))-2;
rr=rl;
m=1;
for i=length(P):-1:1
    p=P(i);
    q=1-p;
    for rho=1-1/p:rdelta:0
        r1=(p*(n-m-1)+m*(1-rho)*p);
        r2=(p*(n-m-1)+m*(q+rho*p));
        if r1/r2<=exp(e)
            pl(i)=p;
            if rl(i)==-2
                rl(i)=rho;
            else
                rl(i)=min(rho,rl(i));
            end
            if rr(i)==-2
                rr(i)=rho;
            else
                rr(i)=max(rho,rr(i));
            end
            plot(p,rho,'r+')
            hold on
         end
    end
%      if i==1
%         P(i)
%         rr(i)
%         rl(i)
%     end
end
save ./data/p_rho_e001_n20k.mat pl rl rr
figure
plot(pl,rl);
hold on
plot(pl,rr);
hold on
c=[1,1,0.85];
p=fill([pl,fliplr(pl)],[rl,fliplr(rr)],c);
p.EdgeColor = c;
xlabel('p')
ylabel('\rho')
set(gca,'Fontsize',18)
% print -painters -dpdf -r300 p_rho_e1.pdf
% for i=1:1:length(P)
%          plot([pl(i),pl(i)],[rl(i),rr(i)],'-b');
%         hold on
% end

