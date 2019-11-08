function [ cW_1, cW_2 ] = func_cW( t )
global B_1 R_1 S_1 mu_1 tmu_2 w_2 tS_2 P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cW_1 = w_2-tS_2*inv(R_1)*mu_1-(S_1+P_1_t*B_1)*inv(R_1)*tmu_2;
cW_2 = -B_1*inv(R_1)*tmu_2;
end
