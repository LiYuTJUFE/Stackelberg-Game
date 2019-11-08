function [ cS_1, cS_2 ] = func_cS( t )
global B_1 R_1 S_1 S_2 tS_2 tR_1 tR_2 P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cS_1 = S_2-tS_2*inv(R_1)*tR_1-(S_1+P_1_t*B_1)*inv(R_1)*tR_2';
cS_2 = -B_1*inv(R_1)*tR_2';
end
