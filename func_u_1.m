function [ u_1 ] = func_u_1( t, x0, u_2, T)
global B_1 R_1 S_1 tR_1 mu_1 P_1 G_1 Psi ppsi
P_1_t = deval(P_1, T-t);
P_1_t = reshape(P_1_t, size(G_1));
Psi_t = deval(Psi, T-t);
Psi_t = reshape(Psi_t, 2*size(G_1));
ppsi_t= deval(ppsi, T-t);
u_1 = inv(R_1)*([zeros(size(B_1)); -S_1-P_1_t*B_1]'+[-B_1; zeros(size(B_1))]'*Psi_t)*[zeros(size(x0)); x0]+...
      -inv(R_1)*tR_1*u_2 + inv(R_1)*([-B_1; zeros(size(B_1))]'*ppsi_t-mu_1);
end
