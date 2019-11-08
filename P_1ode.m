function dP_1dt = P_1ode(t, P_1)
global A B_1 Q_1 R_1 S_1 rho
%P_1 = zeros(size(A)); P_1(1,1:2) = P(1:2); P_1(2,1:2)=P(3:4);
P_1 = reshape(P_1, size(A)); %Convert from "n^2"-by-1 to "n"-by-"n" by column
dP_1dt = -Q_1 - A'*P_1 - P_1*A + rho*P_1 +...
    + (S_1+P_1*B_1)*inv(R_1)*(S_1+P_1'*B_1)'; %Determine derivative
% P1 from T to 0
dP_1dt = -dP_1dt(:); %Convert from "n"-by-"n" to "n^2"-by-1 by column
end

