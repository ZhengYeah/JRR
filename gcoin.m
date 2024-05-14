%%% JRR correlated perturbation table
%%% this file producd the same result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%             T_{u1}=1       T_{u1}=0
%%% T_{u2}=1   p^2+\rho pq       
%%% T_{u2}=0                  q^2+\rho pq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y=gcoin(n,p15,p05,p_15,raw_data)
p_05=p05;
% Randomly separate into n/2 groups, the user ids(1) and ids(2) in the same group
ids=randperm(n);

xi=randsrc(n,1,[1.5,0.5,-0.5,-1.5; p15,p05,p_05,p_15]);
x3=randsrc(n/2,1,[1,-1; 0.5,0.5]);

for gno=1:n/2
    % compute T_1 and T_2
    j=gno*2-1; 
    if xi(j)+x3(gno)>0
        T1=1;
    end
    if xi(j)+x3(gno)<=0
        T1=0;
    end
    if xi(j+1)-x3(gno)>0
        T2=1;
    end
    if xi(j+1)-x3(gno)<=0
        T2=0;
    end
    % generate data according to T1,T2
    if T1==1
        y(j)=raw_data(ids(j));
    else
        y(j)=1-raw_data(ids(j));
    end
    if T2==1
        y(j+1)=raw_data(ids(j+1));
    else
        y(j+1)=1-raw_data(ids(j+1));
    end
end