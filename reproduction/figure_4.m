%% see folder `effect_n` for details
%% if you want to reproduce the `.mat` files, please rerun `effect_n/effect_n.m` file first

close all
clear
clc

N = [20, 200, 2000, 20000, 200000, 2000000];
load ../effect_n/MSE_n_e001_f001.mat
f = 0.01;
n1 = N .* f;
n0 = N - n1;
var_pro_f001 = [];
var_pro_f001(1, :) = var_pro;
var_rr_f001(1, :) = var_RR;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro1 = mean(pro, 2);
re_rr1 = mean(rr, 2);

load ../effect_n/MSE_n_e01_f001.mat
var_pro_f001(2, :) = var_pro;
var_rr_f001(2, :) = var_RR;
f = 0.01;
n1 = N .* f;
n0 = N - n1;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro2 = mean(pro, 2);
re_rr2 = mean(rr, 2);

load ../effect_n/MSE_n_e1_f001.mat
var_pro_f001(3, :) = var_pro;
var_rr_f001(3, :) = var_RR;
f = 0.01;
n1 = N .* f;
n0 = N - n1;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro4 = mean(pro, 2);
re_rr4 = mean(rr, 2);

load ../effect_n/MSE_n_e001_f01.mat
var_pro_f01(1, :) = var_pro;
var_rr_f01(1, :) = var_RR;
f = 0.1;
n1 = N .* f;
n0 = N - n1;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro1_f01 = mean(pro, 2);
re_rr1_f01 = mean(rr, 2);

load ../effect_n/MSE_n_e01_f01.mat
var_pro_f01(2, :) = var_pro;
var_rr_f01(2, :) = var_RR;
f = 0.1;
n1 = N .* f;
n0 = N - n1;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro2_f01 = mean(pro, 2);
re_rr2_f01 = mean(rr, 2);

load ../effect_n/MSE_n_e1_f01.mat
var_pro_f01(3, :) = var_pro;
var_rr_f01(3, :) = var_RR;
f = 0.1;
n1 = N .* f;
n0 = N - n1;
for i = 1:size(N, 2)
    pro(i, :) = (abs(est_pro1(i, :)-n1(i)) ./ n1(i) + abs(est_pro0(i, :)-n0(i)) ./ n0(i)) ./ 2;
    rr(i, :) = (abs(est_rr1(i, :)-n1(i)) ./ n1(i) + abs(est_rr0(i, :)-n0(i)) ./ n0(i)) ./ 2;
end
re_pro4_f01 = mean(pro, 2);
re_rr4_f01 = mean(rr, 2);

load ../effect_n/MSE_n_e001_f1.mat
var_pro_f1 = [];
var_pro_f1(1, :) = var_pro;
var_rr_f1(1, :) = var_RR;
load ../effect_n/MSE_n_e01_f1.mat
var_pro_f1(2, :) = var_pro;
var_rr_f1(2, :) = var_RR;
load ../effect_n/MSE_n_e1_f1.mat
var_pro_f1(3, :) = var_pro;
var_rr_f1(3, :) = var_RR;
%% display adveraged MSE
figure
plot(log10(N),log10(var_rr_f01(1,:)),'-bd','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f001(1,:)),'-ro','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f01(1,:)),'-g*','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f1(1,:)),'-m+','LineWidth',2,'Markersize',8)
hold on
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",'location','NW', Interpreter='latex');
xlabel("$n$",Interpreter='latex')
ylabel("MSE")
set(gca,'XTick',[log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{20','200','2000','2\times10^4','2\times10^5','2\times10^6'});
set(gca,'yTick',[4,6,8,10]);
set(gca,'yTickLabel',{'10^4','10^6','10^8','10^{10}'});
% axis([0,10, 6,12.5])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',15,'Fontname','Times New Roman')
xlim([log10(15) log10(3000000)])

figure
plot(log10(N),log10(var_rr_f01(2,:)),'-bd','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f001(2,:)),'-ro','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f01(2,:)),'-g*','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f1(2,:)),'-m+','LineWidth',2,'Markersize',8)
hold on
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",'location','NW', Interpreter='latex');
xlabel("$n$",Interpreter='latex')
ylabel("MSE")
set(gca,'XTick',[log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{20','200','2000','2\times10^4','2\times10^5','2\times10^6'});
set(gca,'yTick',[2,4,6,8,10]);
set(gca,'yTickLabel',{'10^2','10^4','10^6','10^8','10^{10}'});
% axis([0,10, 6,12.5])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',15,'Fontname','Times New Roman')
xlim([log10(15) log10(3000000)])

figure
plot(log10(N),log10(var_rr_f01(3,:)),'-bd','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f001(3,:)),'-ro','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f01(3,:)),'-g*','LineWidth',2,'Markersize',8)
hold on
plot(log10(N),log10(var_pro_f1(3,:)),'-m+','LineWidth',2,'Markersize',8)
hold on
h=legend("RR","JRR ($n_1/n=0.01$)","JRR ($n_1/n=0.1$)","JRR ($n_1/n=1$)",'location','NW', Interpreter='latex');
xlabel("$n$",Interpreter='latex')
ylabel("MSE")
set(gca,'XTick',[log10(20),log10(200),log10(2000),log10(20000),log10(200000),log10(2000000)]);
set(gca,'XTickLabel',{20','200','2000','2\times10^4','2\times10^5','2\times10^6'});
set(gca,'yTick',[2,4,6,8]);
set(gca,'yTickLabel',{'10^2','10^4','10^6','10^8'});
xlim([log10(15) log10(3000000)])
% axis([0,10, 6,12.5])
set(gca,'Fontsize',20,'Fontname','Times New Roman')
set(h,'Fontsize',15,'Fontname','Times New Roman')

%% display of RE
figure
plot(log10(N), log10(re_rr1), ':bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro1), '-bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_rr1_f01), ':r+', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro1_f01), '-r+', 'LineWidth', 2, 'Markersize', 8)
hold on
h = legend("RR ($n_1/n=0.01$)", "JRR ($n_1/n=0.01$)", "RR ($n_1/n=0.1$)", "JRR ($n_1/n=0.1$)", 'location', 'SW', Interpreter = 'latex');
xlabel("$n$", Interpreter = 'latex')
ylabel("ARE")
set(gca, 'XTick', [log10(20), log10(200), log10(2000), log10(20000), log10(200000), log10(2000000)]);
set(gca, 'XTickLabel', {20', '200', '2000', '2\times10^4', '2\times10^5', '2\times10^6'});
set(gca, 'YTick', [0, log10(10), log10(100), 3, 4, 5]);
set(gca, 'yTickLabel', {'1', '10', '10^2', '10^3', '10^4', '10^5'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
set(h, 'Fontsize', 14, 'Fontname', 'Times New Roman')
xlim([log10(15), log10(3000000)])

figure
plot(log10(N), log10(re_rr2), ':bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro2), '-bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_rr2_f01), ':r+', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro2_f01), '-r+', 'LineWidth', 2, 'Markersize', 8)
hold on
h = legend("RR ($n_1/n=0.01$)", "JRR ($n_1/n=0.01$)", "RR ($n_1/n=0.1$)", "JRR ($n_1/n=0.1$)", 'location', 'SW', Interpreter = 'latex');
xlabel("$n$", Interpreter = 'latex')
ylabel("ARE")
set(gca, 'XTick', [log10(20), log10(200), log10(2000), log10(20000), log10(200000), log10(2000000)]);
set(gca, 'XTickLabel', {20', '200', '2000', '2\times10^4', '2\times10^5', '2\times10^6'});
set(gca, 'YTick', [log10(0.1), log10(1), log10(10), log10(100), 3, 4]);
set(gca, 'yTickLabel', {'0.1', '1', '10', '10^2', '10^3', '10^4'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
set(h, 'Fontsize', 14, 'Fontname', 'Times New Roman')
xlim([log10(15), log10(3000000)])

figure
plot(log10(N), log10(re_rr4), ':bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro4), '-bd', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_rr4_f01), ':r+', 'LineWidth', 2, 'Markersize', 8)
hold on
plot(log10(N), log10(re_pro4_f01), '-r+', 'LineWidth', 2, 'Markersize', 8)
hold on
h = legend("RR ($n_1/n=0.01$)", "JRR ($n_1/n=0.01$)", "RR ($n_1/n=0.1$)", "JRR ($n_1/n=0.1$)", 'location', 'NE', Interpreter = 'latex');
xlabel("$n$", Interpreter = 'latex')
ylabel("ARE")
set(gca, 'XTick', [log10(20), log10(200), log10(2000), log10(20000), log10(200000), log10(2000000)]);
set(gca, 'XTickLabel', {20', '200', '2000', '2\times10^4', '2\times10^5', '2\times10^6'});
set(gca, 'YTick', [-2, log10(0.1), log10(1), log10(10), log10(100), 3, 4]);
set(gca, 'yTickLabel', {'0.01', '0.1', '1', '10', '10^2', '10^3', '10^4'});
set(gca, 'Fontsize', 20, 'Fontname', 'Times New Roman')
set(h, 'Fontsize', 14, 'Fontname', 'Times New Roman')
xlim([log10(15), log10(3000000)])
