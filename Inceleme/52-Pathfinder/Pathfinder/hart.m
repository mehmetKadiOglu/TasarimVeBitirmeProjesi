
function y = hart(x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = [1.0, 1.2, 3.0, 3.2]';
A = [3.0, 10, 30;
     0.1, 10, 35;
     3.0, 10, 30;
     0.1, 10, 35];
P = 10^(-4) * [3689, 1170, 2673;
               4699, 4387, 7470;
               1091, 8732, 5547;
               381, 5743, 8828];

outer = 0;
for ii = 1:4
	inner = 0;
	for jj = 1:3
		xj = x(jj);
		Aij = A(ii, jj);
		Pij = P(ii, jj);
		inner = inner + Aij*(xj-Pij)^2;
	end
	new = alpha(ii) * exp(-inner);
	outer = outer + new;
end

y = -outer;


