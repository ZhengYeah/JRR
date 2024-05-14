function [p_opt,rho_opt]=cal_p_rho(e)
p_opt = exp(e)/(1+exp(e));
rho_opt = 1-1/p_opt;
end
