function [ cB_1, cB_2 ] = func_cB( t )
global B_1 B_2 R_1 S_1 tR_1 tS_1 P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cB_1 = B_2-B_1*inv(R_1)*tR_1;
cB_2 = -(tS_1-(S_1+P_1_t*B_1)*inv(R_1)*tR_1+P_1_t*B_2);
end
