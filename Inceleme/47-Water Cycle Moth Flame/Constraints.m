function c=Constraints(x)
% constraints in form of g(x)<B and h(x)<C should be written in the form of c=[g(x)-B; h(x)-C]

% Welded beam problem
R=sqrt((x(2)^2)/4+((x(1)+x(3))/2)^2);
P=6000;
L=14;
E=30e6;
G=12e6;
Px=((4.013*E*sqrt((x(3)^2*x(4)^6)/36))/(L^2))*(1-(x(3)/(2*L))*sqrt(E/(4*G)));
tap=P/(sqrt(2)*x(1)*x(2));
Q=P*(L+(x(2)/2));
J=2*(sqrt(2)*x(1)*x(2)*((x(2)^2/12)+((x(1)+x(3))/2)^2));
tapp=(Q*R)/J;
ta=sqrt(tap^2+((2*tap*tapp*x(2))/(2*R))+tapp^2);
sigma=(6*P*L)/(x(4)*(x(3)^2));
delta=(4*P*(L^3))/(E*(x(3)^3)*x(4));
c=[ta-13600;
    sigma-30000;
    x(1)-x(4);
    0.10471*x(1)^2+0.04811*x(3)*x(4)*(14+x(2))-5;
    0.125-x(1);
    delta-0.25;
    P-Px];