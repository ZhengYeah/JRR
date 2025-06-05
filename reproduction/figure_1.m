%% see folder `real_world` for details
%% if you want to reproduce the `.mat` files, please rerun `real_world/estimated_*.m` files first
close all
clear
clc

for epsilon_index = 2:4
    load ../real_world/estimated_Kos.mat
    mse_kos_jrr = var_pro(epsilon_index);
    mse_kos_rr = var_RR(epsilon_index);
    load ../real_world/estimated_Amazon.mat
    mse_amazon_jrr = var_pro(epsilon_index);
    mse_amazon_rr = var_RR(epsilon_index);
    load ../real_world/estimated_EC.mat
    mse_ec_jrr = var_pro(epsilon_index);
    mse_ec_rr = var_RR(epsilon_index);
    load ../real_world/estimated_Census.mat
    mse_census_jrr = var_pro(epsilon_index);
    mse_census_rr = var_RR(epsilon_index);
    
    bar_data = [mse_kos_jrr, mse_kos_rr;
        mse_amazon_jrr, mse_amazon_rr;
        mse_ec_jrr, mse_ec_rr;
        mse_census_jrr, mse_census_rr];
    figure;
    bar(bar_data);
    xlabel = {'Kosarak', 'Amazon', 'EC', 'Census'};
    set(gca, 'XTick', 1:size(bar_data, 1));
    set(gca, 'XTickLabel', xlabel);
    legend({'JRR', "RR"});
    set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman');
    filename = sprintf('real_world_index_%d.pdf', epsilon_index);
end

