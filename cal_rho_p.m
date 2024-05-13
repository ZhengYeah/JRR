function [p_opt,rho_opt,flag]=cal_rho_p(e,n,delta,rdelta)
flag=0;
p=exp(e)/(1+exp(e));
rho=1-1/p;
    while true    
        q=1-p;
        p11=rho*p*q+p^2;
        p10=(1-rho)*p*q;
        p00=rho*p*q+q^2;
        pmax=max([p11,p10,p00]);
        pmin=min([p11,p10,p00]);
        r1=(p*(n-m-1)+m*(1-rho)*p);
        r2=(p*(n-m-1)+m*(q+rho*p));


        if (pmax+p*p*(n-2))/(pmin+q*q*(n-2))<=exp(2*e)
            p_opt=p;
            rho_opt=rho;
            flag=1;
            break
        else
            if p-delta>0.5
                p=p-delta;
                %                 rho=(p*q+p^2*(n-2)-q^2*exp(2*e)*(n-1))/(p*q*(1+exp(2*e)));
            else 
                rho=rho+rdelta;
                p=exp(e)/(1+exp(e));
%                 rho=1-1/p;
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
