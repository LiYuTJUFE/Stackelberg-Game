function [tick,ref_p,quantity,ret_p,adv_l,who_p,qual_l,demand,cost] = app(parameters,x_init,num)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global rho
T     = parameters(1); 
rho   = parameters(2);
mu1   = parameters(3); 
mu2   = parameters(4); 
mu3   = parameters(5);
alpha = parameters(6); 
beta  = parameters(7); 
gamma = parameters(8); 
theta = parameters(9);
c0    = parameters(10); 
lambda= parameters(11); 
eta   = parameters(12); 
k1    = parameters(13); 
k2    = parameters(14);
g1    = parameters(15); 
g2    = parameters(16);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global A B_1 B_2 c 
global Q_1 R_1 S_1 w_1 mu_1 tR_1 tS_1 tmu_1 beta_1 G_1 alpha_1
global Q_2 R_2 S_2 w_2 mu_2 tR_2 tS_2 tmu_2 beta_2 G_2 alpha_2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = [-mu1,0;beta,0];
B_1 = [mu1,mu3;-(alpha+beta),gamma];
B_2 = [0,mu2;0,0];
c = [0;theta];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q_1 = -[0,0;0,0];
R_1 = -[-2*(alpha+beta),gamma;gamma,-k1];
S_1 = -[beta,0;0,0];
w_1 = -[0;0];
mu_1 = -[theta;0]; 
tR_1 = -[alpha+beta,0;-gamma,0];
tS_1 = -[-beta,0;0,0];
tmu_1 = -[-theta;0]; 
beta_1  = -(0);
G_1  = -[0,0;0,0];
alpha_1 = -[0;0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q_2 = -[0,lambda*beta;lambda*beta,0];
R_2 = -[0,0;0,-k2];
S_2 = -[beta,-beta*eta;0,0];
w_2 = -[-c0*beta;lambda*theta];
mu_2 = -[theta;-eta*theta]; 
tR_2 = -[-(alpha+beta),gamma;eta*(alpha+beta),-eta*gamma];
tS_2 = -[0,0;-lambda*(alpha+beta),lambda*gamma];
tmu_2 = -[c0*(alpha+beta);-c0*gamma]; 
beta_2 = -(-c0*theta);
G_2  = -[g1,0;0,g2];
alpha_2 = -[0;0];
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% P_1 P_2 Psi ppsi存储都是从T到0, 
%% 每个func_...(...,t)中都是为求P_1 P_2 Psi三个矩阵在t点值
global P_1
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
% P_1ode from T to 0
P_1 = ode45(@P_1ode, [0,T], G_1(:), options);
%%
global P_2
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
% P_1ode from T to 0
P_2 = ode45(@P_2ode, [0,T], G_2(:), options);
%%
global Psi
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
% Psiode from T to 0
Psi = ode45(@Psiode, [0,T], zeros(4*numel(A),1), options);
%%
global ppsi
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
% ppsiode from T to 0
ppsi = ode45(@ppsiode, [0,T], [alpha_1; alpha_2], options);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tick=0:0.01:T;
n = length(tick);
u_1   = zeros(2,n)  ; u_2      = zeros(2,n);
ref_p = zeros(num,n); quantity = zeros(num,n);
ret_p = zeros(num,n); adv_l    = zeros(num,n);
who_p = zeros(num,n); qual_l   = zeros(num,n);
demand= zeros(num,n); cost     = zeros(num,n);
%%
for idx=1:num
    options = odeset('RelTol',1e-8,'AbsTol',1e-8);
    [~,x] = ode45(@(t,x)xode(t,x,T), tick, x_init(:,idx), options);
    for i = 1:n
        u_2(:,i) = func_u_2(tick(i), x(i,:)', T);
        u_1(:,i) = func_u_1(tick(i), x(i,:)', u_2(:,i), T);
    end
    ref_p(idx,:)    = x(:,1)';
    quantity(idx,:) = x(:,2)';
    ret_p(idx,:)    = u_1(1,:);
    adv_l(idx,:)    = u_1(2,:);
    who_p(idx,:)    = u_2(1,:);
    qual_l(idx,:)   = u_2(2,:);
    for i = 1:n
        demand(idx,i) = theta-alpha*ret_p(idx,i)+...
            +beta*(ref_p(idx,i)-ret_p(idx,i))+gamma*adv_l(idx,i);
        cost(idx,i) = c0-lambda*quantity(idx,i)+eta*qual_l(idx,i);
    end
    
end
