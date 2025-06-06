p = 0.50001:0.0025:0.58;
q = 1 - p;
rho = -1:0.0025:0;

m = 500;

n = 10000;
n_1 = 100;
e = exp(0.01);

rho_2 = 1 - 1 ./ p;
p_2 = (n-1)*e ./ (e + 1) ./ (n-1- m * rho); 
% p_3 = 1 - (n-1) ./ (exp(1) + 1) ./ (n-1- m * rho);

h_1 = p .* q ./ (p - q).^2;
h_2 = n + rho' * ((2 * n_1 - n)^2 - n) / (n - 1);
h = h_1 .* h_2;

hold on;

imagesc(p, rho, h)
colormap("sky")

plot(p, rho_2, LineWidth=2);
plot(p_2, rho, LineWidth=1);
% plot(p_3, rho)
xline(e / (1 + e), LineWidth=2);

set(gca,'FontSize',20, 'FontName', 'Times New Roman');
xlabel('Probability $p$',FontWeight='bold',Interpreter='latex') 
ylabel('Correlation $\rho$',FontWeight='bold',Interpreter='latex') 
legend("RR","JRR")

hold off;

