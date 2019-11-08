function [ cR ] = func_cR( t )
global R_2 tR_2 R_1 tR_1
cR = (R_2-2*tR_2*inv(R_1)*tR_1);
end