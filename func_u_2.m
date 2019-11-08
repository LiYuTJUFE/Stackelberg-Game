function [ u_2 ] = func_u_2( t, x0, T )
global Psi ppsi G_1
Psi_t = deval(Psi, T-t);
Psi_t = reshape(Psi_t, 2*size(G_1));
ppsi_t= deval(ppsi, T-t);
[bcB_1, bcB_2] = func_bcB( t );
bcR = func_bcR( t ); 
cK = func_cK(t);
u_2 = inv(bcR)*(bcB_2'-bcB_1'*Psi_t)*[zeros(size(x0));x0]+...
      +inv(bcR)*(-bcB_1'*ppsi_t-cK);
end
