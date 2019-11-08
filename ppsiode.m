function dppsidt = ppsiode(t, ppsi)
global rho Psi
[bcA_1, bcA_2] = func_bcA( t );
[bcB_1, bcB_2] = func_bcB( t );
[bcC_1, bcC_2] = func_bcC( t );
bcR = func_bcR( t );
cK = func_cK(t);
Psi_t = deval(Psi,t);
Psi_t = reshape(Psi_t, size(bcA_1));
dppsidt = -Psi_t*(bcA_2-bcB_1*inv(bcR)*bcB_1')*ppsi+...
    -(bcA_1'+bcB_2*inv(bcR)*bcB_1'-rho*eye(size(bcA_1)))*ppsi+...
    -Psi_t*(bcC_1-bcB_1*inv(bcR)*cK)+...
    +(bcC_2-bcB_2*inv(bcR)*cK);
% Psi from T to 0
dppsidt = -dppsidt(:);
end
