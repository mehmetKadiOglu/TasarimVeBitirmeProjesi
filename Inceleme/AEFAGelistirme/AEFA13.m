%[bestSolution, bestFitness, iteration]=AEFA(fhd, dimension, maxIteration, fNumber)


function [bestSolution,bestFitness,iteration]=AEFA13(fhd, dimension, maxIteration, fNumber)
settings;


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
FCheck = 1;
Rpower = 1;
tag=1; % 1: minimization, 0: maximization
N = 50;
wMax=500;
wMin=1e-10;
Rnorm=2; 
max_it = ceil(maxIteration/N);
D = dimension;
lb = lbArray;
ub = ubArray;
% Dimension and lower and upper bounds of the variables 

%------------------------------------------------------------------------------------
%random initialization of charge population.
%X=initialization(D,N,ub,lb); 
X=rand(N,D).*(ub-lb)+lb;


V=zeros(N,D);

%-------------------------------------------------------------------------------------
for iteration=1:max_it
    chValue=wMax-iteration*((wMax-wMin)/max_it);
%Evaluation of fitness values of charged particles.

    %calculation of objective function for charged particle 'i'
    fitness = testFunction(X', fhd, fNumber);

 
 %fitness =benchmark(X,func_num,D);
 
    if tag==1
    [best, best_X]=min(fitness); %minimization.
    else
    [best, best_X]=max(fitness); %maximization.
    end        
    if iteration==1
       bestFitness=best;bestSolution=X(best_X,:);
    end
    if tag==1
      if best<bestFitness  %minimization.
       bestFitness=best;bestSolution=X(best_X,:);
      end
    else 
      if best>bestFitness  %maximization
       bestFitness=best;bestSolution=X(best_X,:);
      end
    end
    

%-----------------------------------------------------------------------------------
% Charge 
Fmax=max(fitness); Fmin=min(fitness);

if Fmax==Fmin
   M=ones(N,1);
   Q=ones(N,1);
else
    
   if tag==1 %for minimization
      best=Fmin;worst=Fmax; 
      
   else %for maximization
       
      best=Fmax;worst=Fmin; 
   end
  
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
    [Qs s]=sort(Q,'descend');
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

K=chaos(7,iteration,max_it,chValue);
%---------------------------------------------------------------------------------- 
%%%Calculation of accelaration.
a=E*K; 
%----------------------------------------------------------------------------------

%Charge movement
%----------------------------------------------------------------------------------
V=rand(N,D).*V+a;
X=X+V;
X=max(X,lb);X=min(X,ub);   % Check the bounds of the variables
%----------------------------------------------------------------------------------
%plot charged particles 
%mask it if you do not need to plot them
%----------------------------------------------------------------------------------
end 
end