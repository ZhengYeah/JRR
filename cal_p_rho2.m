function [p_opt,rho_opt,flag]=cal_p_rho2(e,n,pdelta,rdelta,m)
MAX=exp(e)/(1+exp(e));
% p=0.500240000000000
for p=MAX-pdelta:-pdelta:0.5   
    flag=0;
    q=1-p;
    for rho=1-1/p:rdelta:0
%          p11=rho*p*q+p^2;
%         p10=(1-rho)*p*q;
%         p00=rho*p*q+q^2;
%         pmax=max([p11,p10,p00]);
%         pmin=min([p11,p10,p00]);
%          if (pmax+p*p*(n-2))/(pmin+q*q*(n-2))<=exp(2*e)
%              flag=1;
%              p_opt=p;
%              rho_opt=rho;
%              break
%          end
%         r1=(p*(n-m-1)+m*(1-rho)*p);
%         r2=(p*(n-m-1)+m*(q+rho*p));
        ppmax=(1-rho)*p;
        ppmin=(q+rho*p);
%         r1=p*(n-1)^2+(ppmax-p)*m;
%         r2=q*(n-1)^2+m*(ppmin-q);
        r1=ppmax*m+p*(n-m-1);
        r2=ppmin*m+q*(n-m-1);
        if r2>0 && r1/r2<=exp(e)
            flag=1;
            p_opt=p;
            rho_opt=rho;
            break
        end
    end
 if flag==1
     break
 end
end
