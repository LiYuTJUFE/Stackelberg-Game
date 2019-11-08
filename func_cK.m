function [ cK ] = func_cK( t )
global R_1 mu_1 mu_2 tR_1 tR_2 tmu_2
cK = (mu_2-tR_2*inv(R_1)*mu_1-tR_1'*inv(R_1)*tmu_2);
end
