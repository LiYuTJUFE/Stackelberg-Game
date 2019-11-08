function [ bcC_1, bcC_2 ] = func_bcC( t )
global P_2 G_2
P_2_t = deval(P_2, t);
P_2_t = reshape(P_2_t, size(G_2));
[ cC_1, cC_2 ] = func_cC( t );
[ cW_1, cW_2 ] = func_cW( t );
bcC_1 = [cW_2; cC_1];
bcC_2 = [cC_2; -P_2_t*cC_1-cW_1]; 
end

