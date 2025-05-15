close all
clear
clc


F = 0.49:0.0005:0.51;
len = length(F);
n = zeros(1, len) + 20000;

load ./f_n1k.mat
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

load ./f_n4k.mat
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

load ./f_n8k.mat
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
print -vector -dpdf -r300 f_n1k.pdf

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
print -vector -dpdf -r300 f_n4k.pdf


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
print -vector -dpdf -r300 f_n10k.pdf


% %% display of RE
% figure
% plot(F(2:len-1),log10(re_rr1(2:len-1)),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F(2:len-1),log10(re_pro1(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','N')
% xlabel("f")
% ylabel("ARE")
% set(gca,'Fontsize',18)
% % axis([0 1 10 45])
% set(gca,'yTick',[log10(10),log10(20),log10(50),log10(100),log10(200),log10(500)]);
% set(gca,'yTickLabel',{'10','20','50','100','200','500'});
% axis([-0.01 1.01 log10(8),log10(500)])
% print -painters -dpdf -r300 re_f_e0001.pdf
% %
% figure
% plot(F(2:len-1),log10(re_rr2(2:len-1)),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F(2:len-1),log10(re_pro2(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','N')
% xlabel("f")
% ylabel("ARE")
% set(gca,'Fontsize',18)
% % axis([0 1 1 3.5])
% set(gca,'yTick',[log10(1),log10(2),log10(5),log10(10),log10(20),log10(50)]);
% set(gca,'yTickLabel',{'1','2','5','10','20','50'});
% axis([-0.01 1.01 log10(0.8),log10(50)])
% print -painters -dpdf -r300 re_f_e001.pdf
% % %
% figure
% plot(F(2:len-1),log10(re_rr4(2:len-1)),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F(2:len-1),log10(re_pro4(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','N')
% xlabel("f")
% ylabel("ARE")
% set(gca,'Fontsize',18)
% % axis([0 1 0.1 0.35])
% set(gca,'yTick',[log10(0.1),log10(0.2),log10(0.5),log10(1),log10(2),log10(5)]);
% set(gca,'yTickLabel',{'0.1','0.2','0.5','1','2','5'});
% axis([-0.01 1.01 log10(0.08),log10(5)])
% print -painters -dpdf -r300 re_f_e01.pdf
% %
% figure
% plot(F(2:len-1),log10(re_rr8(2:len-1)),':bd','LineWidth',2,'Markersize',10)
% hold on
% plot(F(2:len-1),log10(re_pro8(2:len-1)),'-ro','LineWidth',2,'Markersize',10)
% hold on
% legend("RR","JRR",'location','N')
% xlabel("f")
% ylabel("ARE")
% set(gca,'Fontsize',18)
% set(gca,'yTick',[log10(0.01),log10(0.02),log10(0.05),log10(0.1),log10(0.2),log10(0.5)]);
% set(gca,'yTickLabel',{'0.01','0.02','0.05','0.1','0.2','0.5'});
% axis([-0.01 1.01 log10(0.008),log10(0.5)])
% print -painters -dpdf -r300 re_f_e1.pdf
