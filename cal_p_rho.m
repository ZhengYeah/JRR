function [p_opt,rho_opt,flag]=cal_p_rho(e,n,delta,rdelta)
flag=0;
p=exp(e)/(1+exp(e));
if n==2
    rho=1-1/p+rdelta;
else
    rho=1-1/p;
end
    while true    
        q=1-p;
        p11=rho*p*q+p^2;
        p10=(1-rho)*p*q;
        p00=rho*p*q+q^2;
        pmax=max([p11,p10,p00]);
        pmin=min([p11,p10,p00]);
        if (pmax+p*p*(n-2))/(pmin+q*q*(n-2))<=exp(2*e)
            p_opt=p;
            rho_opt=rho;
            flag=1;
            break
        else
            if rho+rdelta<0
                rho=rho+rdelta;
%                 rho=(p*q+p^2*(n-2)-q^2*exp(2*e)*(n-1))/(p*q*(1+exp(2*e)));
            else 
                p=p-delta;
                if n==2
                    rho=1-1/p+rdelta;
                else
                    rho=1-1/p;
                end
                if p<0.5
                    flag=10;
                    break
                end
            end
        end
        if flag==10
            break
        end
    end
% end
