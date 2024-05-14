function y_RR=RR(n0,n1,p)
temp1=randsrc(n1,1,[1,0; p,1-p]);
temp2=randsrc(n0,1,[0,1; p,1-p]);
y_RR=[temp1;temp2];
end