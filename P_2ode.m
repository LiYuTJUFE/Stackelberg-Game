function dP_2dt = P_2ode(t, P_2)
global rho
[cA_11, cA_12, cA_22] = func_cA( t ); 
[cQ_11, cQ_12] = func_cQ( t );
P_2 = reshape(P_2, size(cA_11));
dP_2dt = -0.5*(cQ_11+cQ_11') - cA_11'*P_2 - P_2*cA_11 + rho*P_2;
% P_2 from T to 0
dP_2dt = -dP_2dt(:);
end
