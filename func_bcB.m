function [ bcB_1, bcB_2 ] = func_bcB( t )
global P_2 G_2
P_2_t = deval(P_2, t);
P_2_t = reshape(P_2_t, size(G_2));
[cB_1, cB_2] = func_cB( t );
[cS_1, cS_2] = func_cS( t );
bcB_1 = [cS_2; cB_1];
bcB_2 = [cB_2; -P_2_t*cB_1-cS_1];
end
