%%
clear
clc
parameters(1)  = 12;  %T
parameters(2)  = 0.05;%rho
parameters(3)  = 0.5; %mu1
parameters(4)  = 0.1; %mu2
parameters(5)  = 0.1; %mu3
parameters(6)  = 0.5; %alpha
parameters(7)  = 0.0; %beta
parameters(8)  = 0.0; %gamma
parameters(9)  = 100; %theta
parameters(10) = 100; %c0
parameters(11) = 0.0; %lambda
parameters(12) = 0.0; %eta
parameters(13) = 1.0; %k1
parameters(14) = 1.0; %k2
parameters(15) = 0.0; %g1
parameters(16) = 0.0; %g2
x_init = [120;0];
[tick,ref_p,quantity,ret_p,adv_l,who_p,qual_l,demand,cost] = app(parameters,x_init,1);
%%
figure
hold on
%r-demand
plot(ref_p,demand,'-b' ,'LineWidth',1.2)
%p-demand
plot(ret_p,demand,'--g','LineWidth',1.2)
%w-demand
plot(who_p,demand,'-.r','LineWidth',1.2)
ylabel({'$D$'},'Interpreter','latex','fontsize',17);
h=legend(...
    '$r$',...
    '$p$',...
    '$w$',...
    'Location','southeast');
set(h,'Interpreter','latex');
set(h,'FontSize',17);
box on
grid on
grid minor
saveas(gcf,'rpw_D','epsc')
hold off
%%
figure
hold on
%t-r
plot(tick, ref_p,'-b' ,'LineWidth',1.2)
%t-p
plot(tick, ret_p,'--g','LineWidth',1.2)
%t-w
plot(tick, who_p,'-.r','LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
h=legend(...
    '$r$',...
    '$p$',...
    '$w$',...
    'Location','southeast');
set(h,'Interpreter','latex');
set(h,'FontSize',17);
box on
grid on
grid minor
saveas(gcf,'t_rpw_sc','epsc')
hold off
%%
subplot(2,2,1)
hold on
%t-r
plot(tick, ref_p,'-b' ,'LineWidth',1.2)
%t-p
plot(tick, ret_p,'--g','LineWidth',1.2)
%t-w
plot(tick, who_p,'-.r','LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
axis([0,12,120,180])
h=legend(...
    '$r$',...
    '$p$',...
    '$w$',...
    'Location','southeast');
set(h,'Interpreter','latex');
set(h,'FontSize',17);
box on
grid on
grid minor
hold off
%t-Q
subplot(2,2,2)
plot(tick, quantity,'LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
ylabel({'$Q$'},'Interpreter','latex','fontsize',17);
axis([0,12,-inf,inf])
box on
grid on
grid minor
subplot(2,2,3)
plot(tick, adv_l,'--g' ,'LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
ylabel({'$l$'},'Interpreter','latex','fontsize',17);
axis([0,12,-1,1])
box on
grid on
grid minor
subplot(2,2,4)
plot(tick, qual_l,'-.r','LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
ylabel({'$d$'},'Interpreter','latex','fontsize',17);
axis([0,12,-1,1])
box on
grid on
grid minor
saveas(gcf,'t_rpwQld_sc','epsc')
%%
figure%t-cost
plot(tick, cost,'LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
ylabel({'$c$'},'Interpreter','latex','fontsize',17);
box on
grid on
grid minor
saveas(gcf,'t_c','epsc')
%%
figure%t-demand
plot(tick, demand,'LineWidth',1.2)
xlabel({'$t$'},'Interpreter','latex','fontsize',17);
ylabel({'$D$'},'Interpreter','latex','fontsize',17);
box on
grid on
grid minor
saveas(gcf,'t_D','epsc')
%%