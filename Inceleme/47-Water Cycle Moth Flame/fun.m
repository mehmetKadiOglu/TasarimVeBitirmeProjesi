function FVAL=fun(x)
% Welded Beam
FVAL=1.10471*x(1)^2*x(2)+0.04811*x(3)*x(4)*(14+x(2));