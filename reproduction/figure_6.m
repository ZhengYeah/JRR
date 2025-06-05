%% see folder `effect_f` for details
%% this is the small figures, the large figures for f = [0,1] are in `effect_f/whole_f`

close all
clear
clc

F = 0.49:0.0005:0.51;
len = length(F);
n = zeros(1, len) + 20000;

load ../effect_f/f_n10k.mat
n1 = n .* F;
n0 = n - n1;
var_pro_e(1, :) = gldp;
var_rr_e(1, :) = ldp;
for i = 2:len - 1
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro1 = mean(pro, 2);
re_rr1 = mean(rr, 2);
% re_pro1=mean(abs(est_pro1-n1),2);
% re_rr1=mean(abs(est_rr1-n1),2);

load ../effect_f/f_n40k.mat
n1 = n .* F;
n0 = n - n1;
var_pro_e(2, :) = gldp;
var_rr_e(2, :) = ldp;
for i = 2:len - 1
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro2 = mean(pro, 2);
re_rr2 = mean(rr, 2);

load ../effect_f/f_n80k.mat
n1 = n .* F;
n0 = n - n1;
var_pro_e(3, :) = gldp;
var_rr_e(3, :) = ldp;
for i = 2:len - 1
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro4 = mean(pro, 2);
re_rr4 = mean(rr, 2);
%% display of MSE
figure
plot(F, var_rr_e(1, :), '-b', 'LineWidth', 2)
hold on
plot(F, var_pro_e(1, :), '-r', 'LineWidth', 2)
hold on
% plot(log10(E),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',10)
% hold on
% plot(log10(E),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',10)
legend("RR", "JRR", 'location', 'south')
xlabel("$n_1/n$", Interpreter = 'latex')
ylabel("MSE")
% set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
ax = gca;
ax.YAxis.Exponent = 5;
xlim([0.49, 0.51])

figure
plot(F, var_rr_e(2, :), '-b', 'LineWidth', 2)
hold on
plot(F, var_pro_e(2, :), '-r', 'LineWidth', 2)
hold on
legend("RR", "JRR", 'location', 'south')
xlabel("$n_1/n$", Interpreter = 'latex')
ylabel("MSE")
% set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
ax = gca;
ax.YAxis.Exponent = 6;
xlim([0.49, 0.51])

figure
plot(F, var_rr_e(3, :), '-b', 'LineWidth', 2)
hold on
plot(F, var_pro_e(3, :), '-r', 'LineWidth', 2)
hold on
legend("RR", "JRR", 'location', 'south')
xlabel("$n_1/n$", Interpreter = 'latex')
ylabel("MSE")
% set(gca,'yTick',[log10(10^5),log10(10^6),log10(10^7),log10(10^8),log10(10^9)]);
% set(gca,'yTickLabel',{'10^5','10^6','10^7','10^8','10^9'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
ax = gca;
ax.YAxis.Exponent = 6;
xlim([0.49, 0.51])

