function [ cQ_11, cQ_12 ] = func_cQ( t )
global B_1 R_1 S_1 Q_2 tS_2 P_1 G_1
P_1_t = deval(P_1, t);
P_1_t = reshape(P_1_t, size(G_1));
cQ_11 = Q_2-2*tS_2*inv(R_1)*(S_1'+B_1'*P_1_t); 
cQ_12 = -tS_2*inv(R_1)*B_1';
end
