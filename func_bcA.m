function [ bcA_1, bcA_2 ] = func_bcA( t )
global rho P_2 G_2
P_2_t = deval(P_2, t);
P_2_t = reshape(P_2_t, size(G_2));
[cA_11, cA_12, cA_22] = func_cA( t );
[cQ_11, cQ_12] = func_cQ( t );
bcA_3 = [cA_22 zeros(size(cA_11)); -P_2_t*cA_12-cQ_12 -cA_11'+rho*eye(size(cA_11))];
bcA_2 = [zeros(size(cA_12)) cA_12'; cA_12 zeros(size(cA_12))];
bcA_1 = -bcA_3' + rho*eye(size(bcA_3));
end
