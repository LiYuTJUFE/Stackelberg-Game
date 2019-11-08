function [ bcR ] = func_bcR( t )
cR = func_cR( t );
bcR = 0.5*(cR+cR');
end
