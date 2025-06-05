close all
close
clc

n_set = 1000:1000:40000;
range_R_e001 = 1.000001 ./ sqrt(n_set);
range_R_e01 = 1.0000002 ./ sqrt(n_set);
range_R_e1 = 1.0000003 ./ sqrt(n_set);
figure
hold on
plot(n_set, range_R_e001,'-*',LineWidth=3,Color=[1 0 0])
plot(n_set, range_R_e01,'-ro', LineWidth=3,Color=[1 0 1])
plot(n_set, range_R_e1,'-g+', LineWidth=2,Color=[0 1 0])
xlabel('$n$',Interpreter='latex')
ylabel('$R$', Interpreter='latex')
set(gca,'FontSize',24, 'FontName', 'Times New Roman');
ax = gca;
ax.YAxis.Exponent = -2;
legend("$\varepsilon=0.01$", "$\varepsilon=0.1$", "$\varepsilon=1$",'FontSize',20,Location="NE",Interpreter='latex')


%% R range
n_set = [10000, 40000, 80000];
e_set = [0.001, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1];
n = n_set(1);
range_R_n1k = repmat(1./sqrt(n), 1, 10);
n = n_set(2);
range_R_n10k = repmat(1./sqrt(n), 1, 10);
n = n_set(3);
range_R_n40k = repmat(1./sqrt(n), 1, 10);
figure
hold on;
plot(e_set, range_R_n1k, LineWidth = 3, Color = [1, 0, 0])
plot(e_set, range_R_n10k, LineWidth = 3, Color = [1, 0, 1])
plot(e_set, range_R_n40k, LineWidth = 3, Color = [0, 1, 0])
xlabel('$\varepsilon$', Interpreter = 'latex')
ylabel('$R$', Interpreter = 'latex')
set(gca, 'FontSize', 24, 'FontName', 'Times New Roman');
ax = gca;
ax.YAxis.Exponent = -3;
legend("$n=10^4$", "$n=4\times 10^4$", "$n=8\times 10^4$", 'FontSize', 20, Location = "NE", Interpreter = 'latex')
