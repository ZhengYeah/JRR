function [p,rho,flag]=cal_rho(e,n,delta)
flag=0;
% e1=e-e*delta;
p=max(exp(e)/(1+exp(e))-delta,0.500001);
% p=exp(e1)/(1+exp(e1))
q=1-p;
temp=exp(2*e)*q^2-p^2;
na=q/temp+2;
na1=(p+(1-3*q)*exp(2*e))/(2*temp)+2;
nb=((p-q)*(exp(2*e)-1)*p)/(2*temp)+1;
nb2=(q^2*(exp(2*e)-1))/temp+1;
beta=((1-n)*temp)/(p*q*(exp(2*e)-1));
if p<=(2/3)
    if n>na
        rho=1-1/p;
        flag=1;
    end
    if n>na1 && n<=na
        rho=(p*q+p^2*(n-2)-q^2*exp(2*e)*(n-1))/(p*q*(1+exp(2*e)));
    end
    if n<na1
       %%calculate r2
        if n>nb
            rho=1-1/(2*q);
        else
            rho=beta;
        end
    end
else
    if n>nb2
        rho=1-1/p;
        flag=1;
    else
        rho=beta;
    end
end
end