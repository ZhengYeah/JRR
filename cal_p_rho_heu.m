function [p_heu,rho_heu]=cal_p_rho_heu(e, n, M)
p_heu = 1 - (n-1) / (n-1-M) / (e+1);
rho_heu = 1 - 1/p_heu;
end
