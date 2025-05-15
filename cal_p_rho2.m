function [p_opt, rho_opt, flag] = cal_p_rho2(e, n, pdelta, rdelta, m)
MAX = exp(e) / (1 + exp(e));
for p = MAX - pdelta:-pdelta:0.5
    flag = 0;
    q = 1 - p;
    for rho = 1 - 1 / p:rdelta:0
        ppmax = (1 - rho) * p;
        ppmin = (q + rho * p);
        r1 = ppmax * m + p * (n - m - 1);
        r2 = ppmin * m + q * (n - m - 1);
        if r2 > 0 && r1 / r2 <= exp(e)
            flag = 1;
            p_opt = p;
            rho_opt = rho;
            break
        end
    end
    if flag == 1
        break
    end
end
