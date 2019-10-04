function [bestSolution, bestFitness, iter]=aefa(funnum)

%V:   Velocity.
%a:   Acceleration.
%Q:   Charge  
%D:   Dimension of the test function.
%N:   Number of charged particles.
%X:   Position of particles.
%R:   Distance between charged particle in search space.
%lb:  lower bound of the variables
%ub:  upper bound of the variables
%Rnorm: Euclidean Norm
[maxIteration lb ub D]=functionAyar(funnum);
N=50; 
max_it=ceil(maxIteration/N)+1;
FCheck=1; 
Rpower=1;
Rnorm=2; 
% Dimension and lower and upper bounds of the variables
%------------------------------------------------------------------------------------
%random initialization of charge population.
%X=initialization(D,N,ub,lb); 
X=rand(N,D).*(ub-lb)+lb;
V=zeros(N,D);
fitness=zeros(1, N);
E=zeros(N,D);
%-------------------------------------------------------------------------------------
for iteration=1:max_it
%Evaluation of fitness values of charged particles. 
 for i=1:N 
    %calculation of objective function for charged particle 'i'
    fitness(i)=testFunction(funnum, X(i,:)');
 end
  
[best, best_X]=min(fitness); %minimization.
if iteration==1
    Fbest=best;Lbest=X(best_X,:);
end
if best<Fbest  %minimization.
    Fbest=best;Lbest=X(best_X,:);
end
%-----------------------------------------------------------------------------------
% Charge 
Fmax=max(fitness); Fmin=min(fitness);

if Fmax==Fmin
   Q=ones(N,1);
else
    best=Fmin;worst=Fmax; 
    Q=exp((fitness-worst)./(best-worst)); 
end
Q=Q./sum(Q); 
%----------------------------------------------------------------------------------
fper=3; %In the last iteration, only 2-6 percent of charges apply force to the others.
%----------------------------------------------------------------------------------
 %%%%total electric force calculation
 if FCheck==1
     cbest=fper+(1-iteration/max_it)*(100-fper); 
     cbest=round(N*cbest/100);
 else
     cbest=N; 
 end
    [~, s]=sort(Q,'descend');
 for i=1:N
     E(i,:)=zeros(1,D);
     for ii=1:cbest
         j=s(ii);
         if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); %Euclidian distanse.
         for k=1:D 
             E(i,k)=E(i,k)+ rand*(Q(j))*((X(j,k)-X(i,k))/(R^Rpower+eps));
         end
         end
     end
 end
%---------------------------------------------------------------------------------- 
%Calculation of Coulomb constant
%----------------------------------------------------------------------------------
alfa=30;K0=500;
K=K0*exp(-alfa*iteration/max_it);
%---------------------------------------------------------------------------------- 
%%%Calculation of accelaration.
a=E*K; 
%----------------------------------------------------------------------------------
%Charge movement
%----------------------------------------------------------------------------------
V=rand(N,D).*V+a;
X=X+V;
X=max(X,lb);X=min(X,ub);   % Check the bounds of the variables

end 
bestSolution=Lbest;
bestFitness=Fbest;
iter=iteration;
end