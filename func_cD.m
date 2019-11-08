function [ cD ] = func_cD( t )
global beta_2 mu_1 tmu_2 R_1
cD = beta_2-tmu_2'*inv(R_1)*mu_1;
end
