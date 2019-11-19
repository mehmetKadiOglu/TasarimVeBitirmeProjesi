function [c, ceq] = ConstraintsFunc(x)

% This function analysis the design and computes the violations
% It is worth mentioning that the truss analyser function is taken from the
% following link:  and is slightly modified to be used in this code
% http://www.mathworks.com/matlabcentral/fileexchange/14313-truss-analysis

global D
ceq = [];
w=size(D.Re);S=zeros(3*w(2));U=1-D.Re;f=find(U);
WE=0;
D.A=x';
for i=1:size(D.Con,2)
   H=D.Con(:,i);C=D.Coord(:,H(2))-D.Coord(:,H(1));Le=norm(C);
   T=C/Le;s=T*T';G=D.E(i)*D.A(i)/Le;Tj(:,i)=G*T;
   e=[3*H(1)-2:3*H(1),3*H(2)-2:3*H(2)];S(e,e)=S(e,e)+G*[s -s;-s s];
   WE=WE+Le*D.A(i)*D.RO;
end
U(f)=S(f,f)\D.Load(f);F=sum(Tj.*(U(:,D.Con(2,:))-U(:,D.Con(1,:))));
R=reshape(S*U(:),w);R(f)=0;
TS=(((abs(F'))./D.A)/D.TM)-1;abs(U');                                       %Tensions violations
US=abs(U')/D.DM-1;                                                          %Displacements violations
PS=sum(TS.*(TS>0));
PD=sum(US.*(US>0),2);
c=[PS;PD];