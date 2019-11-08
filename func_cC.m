function [ cC_1, cC_2 ] = func_cC( t )
global B_1 c R_1 S_1 mu_1 w_1 P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cC_1 = c-B_1*inv(R_1)*mu_1;
cC_2 = -w_1+S_1*inv(R_1)*mu_1-P_1_t*(c-B_1*inv(R_1)*mu_1);
end

