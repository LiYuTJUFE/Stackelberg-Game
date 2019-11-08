function dxdt = xode(t, x, T)
global A B_1 B_2 c
u_2 = func_u_2(t,x,T);
u_1 = func_u_1(t,x,u_2,T);
dxdt = A*x+B_1*u_1+B_2*u_2+c;
end

