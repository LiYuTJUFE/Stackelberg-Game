function [ cA_11, cA_12, cA_22 ] = func_cA( t )
global A B_1 R_1 S_1 rho P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cA_11 = A-B_1*inv(R_1)*(S_1'+B_1'*P_1_t);
cA_12 = -B_1*inv(R_1)*B_1';
cA_22 = -(A-B_1*inv(R_1)*(S_1'+B_1'*P_1_t')-rho*eye(size(A)))';
end
