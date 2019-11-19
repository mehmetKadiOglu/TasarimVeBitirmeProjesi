function y = FitnessFunc(x)
global Z D
Z=Z+1;
w=size(D.Re);S=zeros(3*w(2));U=1-D.Re;f=find(U);
WE=0;
for i=1:size(D.Con,2)
   H=D.Con(:,i);C=D.Coord(:,H(2))-D.Coord(:,H(1));Le=norm(C);
   WE=WE+Le*x(i)*D.RO;
end
y=WE;