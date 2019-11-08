function dPsidt = Psiode(t, Psi)
global rho
[bcA_1, bcA_2] = func_bcA( t ); 
[bcB_1, bcB_2] = func_bcB( t );
bcR = func_bcR( t ); 
Psi = reshape(Psi, size(bcA_1));
tmp = bcA_1+bcB_1*inv(bcR)*bcB_2';
dPsidt = -Psi*tmp - tmp'*Psi + rho*Psi +...
	-Psi*(bcA_2-bcB_1*inv(bcR)*bcB_1')*Psi +...
    +bcB_2*inv(bcR)*bcB_2';
% Psi from T to 0
dPsidt = -dPsidt(:);
end
