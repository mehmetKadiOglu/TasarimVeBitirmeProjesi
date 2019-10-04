% ----------------------------------------------------------------------- %
% Symbiotic Organisms Search(SOS) for unconstrained benchmark problems
% a simplified version, last revised: 2014.08.27
% ----------------------------------------------------------------------- %
% Files of the Matlab code used in the artile:
%
% Min-Yuan Cheng, Doddy Prayogo,         
% Symbiotic Organisms Search: A new metaheuristic optimization algorithm, 
% Computers & Structures 139 (2014), 98-112   
% http://dx.doi.org/10.1016/j.compstruc.2014.03.007                          
%                                                          
% ----------------------------------------------------------------------- %
% Written by Doddy Prayogo at National Taiwan University of Science and 
% Technology (NTUST)
% Email: doddyprayogo@ymail.com
% ----------------------------------------------------------------------- %

%% --- MAIN OPTIMIZER ---
function [bestOrganism bestFitness]=SOS(ecosize,funnum)
tic;
% Outputs: best organism/solution and best fitness
% Inputs: ecosystem/population size and # of benchmark problems 
% Example: [A,B]=SOS (50,17), SOS will solve Sphere (F17) with 50 organisms
% (please see the "OBJECTIVE FUNCTIONS" and "SETUP" sub-functions)
%format compact
% fprintf('-------------------------------------------------------------------------\n');
% fprintf('  Symbiotic Organisms Search(SOS) for unconstrained benchmark problems\n');
% fprintf('-------------------------------------------------------------------------\n\n');

% --- Counters, Parameters & Matrix Initialization
[globalMin lb ub n maxFE]=terminate(funnum);
% fprintf(' Ecosystem Size: %d\t\tMaxFE: %d\t\tFunctionNumber: %d',ecosize,maxFE,funnum);
% fprintf('\n\n');
% fprintf('-------------------------------------------------------------------------\n\n');

FE=0;                           % Function of Evaluation Counter
eco=zeros(ecosize,n);           % Ecosystem Matrix
fitness =zeros(ecosize,1);      % Fitness Matrix

% --- Ecosystem Initialization
for i=1:ecosize
    % Initialize the organisms randomly in the ecosystem 
    eco(i,:)=rand(1,n).*(ub-lb)+lb;
    % Evaluate the fitness of the new solution
    fitness(i,:)=fobj(eco(i,:),funnum); 
    % Increase the number of function evaluation counter
    %FE=FE+1; 
end

% --- Main Looping
while FE<maxFE 
    
    for i=1:ecosize % Organisms' Looping
        
        % Update the best Organism
        [bestFitness,idx]=min(fitness); bestOrganism=eco(idx,:);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Mutualism Phase
            % Choose organism j randomly other than organism i           
            j=i;
            while i==j
                seed=randperm(ecosize); 
                j=seed(1);                  
            end
            
            % Determine Mutual Vector & Beneficial Factor
            mutualVector=mean([eco(i,:);eco(j,:)]);
            BF1=round(1+rand); BF2=round(1+rand);
            
            % Calculate new solution after Mutualism Phase
            ecoNew1=eco(i,:)+rand(1,n).*(bestOrganism-BF1.*mutualVector); 
            ecoNew2=eco(j,:)+rand(1,n).*(bestOrganism-BF2.*mutualVector);
            ecoNew1=bound(ecoNew1,ub,lb); 
            ecoNew2=bound(ecoNew2,ub,lb);
                
            % Evaluate the fitness of the new solution
            fitnessNew1=fobj(ecoNew1,funnum);
            fitnessNew2=fobj(ecoNew2,funnum);
            
            % Accept the new solution if the fitness is better
            if fitnessNew1<fitness(i)
                fitness(i)=fitnessNew1;
                eco(i,:)=ecoNew1;
            end
            if fitnessNew2<fitness(j)
               fitness(j)=fitnessNew2;
               eco(j,:)=ecoNew2;
            end
            
            % Increase the number of function evaluation counter
            FE=FE+2;
            
        % End of Mutualism Phase 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        % Commensialism Phase
            
            % Choose organism j randomly other than organism i
            j=i;
            while i==j
                seed=randperm(ecosize); 
                j=seed(1);                  
            end
            
            % Calculate new solution after Commensalism Phase    
            ecoNew1=eco(i,:)+(rand(1,n)*2-1).*(bestOrganism-eco(j,:));
            ecoNew1=bound(ecoNew1,ub,lb);

            % Evaluate the fitness of the new solution
            fitnessNew1=fobj(ecoNew1,funnum);

            % Accept the new solution if the fitness is better
            if fitnessNew1<fitness(i)
                fitness(i)=fitnessNew1;
                eco(i,:)=ecoNew1;
            end
            
            % Increase the number of function evaluation counter
            FE=FE+1;
            
        % End of Commensalism Phase
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Parasitism Phase

            % Choose organism j randomly other than organism i 
            j=i;
            while i==j
                seed=randperm(ecosize);
                j=seed(1);
            end
            
            % Determine Parasite Vector & Calculate the fitness
            parasiteVector=eco(i,:);
            seed=randperm(n);           
            pick=seed(1:ceil(rand*n));  % select random dimension
            parasiteVector(:,pick)=rand(1,length(pick)).*(ub(pick)-lb(pick))+lb(pick);
            fitnessParasite=fobj(parasiteVector,funnum);
        
            % Kill organism j and replace it with the parasite 
            % if the fitness is lower than the parasite
            if fitnessParasite < fitness(j)
                fitness(j)=fitnessParasite;
                eco(j,:)=parasiteVector;
            end
            
            % Increase the number of function evaluation counter
            FE=FE+1;
        
        % End of Parasitism Phase
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             
    end % End of Organisms' Looping
    
    % Checking the termination criteria
    if bestFitness<globalMin
        break
    end
   
end % End of Main Looping

% --- Update the best Organism
[bestFitness,idx]=min(fitness); bestOrganism=eco(idx,:);

% --- Display the result
%disp(['Funnum: ', num2str(funnum)])

% disp(['Best Fitness: ', num2str(bestFitness)])
% disp(['Best Organism: ', num2str(bestOrganism)])
toc;


%% --- Boundary Handling --- 
function a=bound(a,ub,lb)
a(a>ub)=ub(a>ub); a(a<lb)=lb(a<lb);

%% --- Objective Functions ---
function y=fobj(x,funnum)
% Benchmark function
%F1 = Beale [-4.5; 4.5]; 0
%F2 = Easom [-100,100]; -1
%F3 = Matyas [-10,10]; 0
%F4 = Bochachvesky 1 [-100,100]; 0
%F5 = Booth [-10, 10]; 0
%F6 = Michalewicz 2[0,pi]; -1.8013
%F7 = Schaffer [-100; 100]; 0
%F8 = Six Hump Camel Back [-5; 5]; -1.03163 
%F9 = Bochachvesky 2 [-100,100]; 0
%F10 = Bochachvesky 3 [-100,100]; 0
%F11 = Shubert [-10,10]; -186.73
%F12 = Colville [-10,10]; 0
%F13 = Michalewicz 5 [0,pi]; -4.6877
%F14 = Zakharov[-5,10]; 0
%F15 = Michalewicz 10 [0,pi]; -4.6877
%F16 = Step [-5.12; 5.12]; 0 
%F17 = Sphere [-100,100]; 0
%F18 = SumSquares [-10, 10]; 0
%F19 = Quartic [-1.28,1.28]; 0
%F20 = Schwefel 2.22 [-10,10]; 0
%F21 = Schwefel 1.2 [-10,10]; 0
%F22 = Rosenbrock [-30,30]; 0
%F23 = Dixon-Price [-10, 10]; 0
%F24 = Rastrigin [-5.12; 5.12]; 
%F25 = Griewank [-600,600]; 0
%F26 = Ackley [-600; 600]; 0
 
if funnum==1
    y=((1.5-x(1)+x(1)*x(2))^2+(2.25-x(1)+x(1)*x(2)^2)^2+(2.625-x(1)+x(1)*x(2)^3)^2);

elseif funnum==2
    y=-cos(x(1))*cos(x(2))*exp(-(x(1)-pi)^2-(x(2)-pi)^2); 

elseif funnum==3
    y=0.26*(x(1)^2+x(2)^2)-0.48*x(1)*x(2); 

elseif funnum==4
    y=x(1)^2+2*x(2)^2-0.3*cos(3*pi*x(1))-0.4*cos(4*pi*x(2))+0.7;

elseif funnum==5
    y=(x(1)^2*x(2)-7)^2+(2*x(1)+x(2)-5)^2;

elseif funnum==6
    n=size(x,2);
    m=10;
    sum1=0;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==7
    y=0.5+(sin((x(1)^2+x(2)^2)^0.5)^2-0.5)/(1+0.001*(x(1)^2+x(2)^2)^2);

elseif funnum==8
    y=4*x(1)^2-2.1*x(1)^4+1/3*x(1)^6+x(1)*x(2)-4*x(2)^2+4*x(2)^4;
    
elseif funnum==9
    y=x(1)^2+2*x(2)^2-0.3*cos((3*pi*x(1))*(4*pi*x(2)))+0.3;
    
elseif funnum==10
    y=x(1)^2+2*x(2)^2-0.3*cos((3*pi*x(1))+(4*pi*x(2)))+0.3;
    
elseif funnum==11
    sum1=0;
    sum2=0;
    for i=1:5
        sum1=sum1+i*cos((i+1)*x(1)+i);
        sum2=sum2+i*cos((i+1)*x(2)+i);
    end
    y=sum1*sum2;

elseif funnum==12
    sum1=100*((x(1))^2-x(2))^2+(x(1)-1)^2+(x(3)-1)^2+90*((x(3))^2-x(4))^2+10.1*((x(2)-1)^2+(x(4)-1)^2)+19.8*(x(2)-1)*(x(4)-1);
    y=sum1;

elseif funnum==13
    n=size(x,2);
    m=10;
    sum1=0;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==14
    n=size(x,2);
    sum1=0;
    sum2=0;
    sum3=0;
    for i=1:n
        sum1=sum1+x(i)^2;
        sum2=sum2+0.5*i*x(i);
        sum3=sum3+0.5*i*x(i);
    end
    y=sum1+(sum2)^2+(sum3)^4;

elseif funnum==15
    n=size(x,2);
    sum1=0;
    m=10;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==16
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+(x(i)+0.5)^2;
    end
    y=sum1;

elseif funnum==17
    y=sum((x).^2);
    
elseif funnum==18
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+i*x(i)^2;
    end
    y=sum1;

elseif funnum==19
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+i*x(i)^4;
    end
    y=sum1+rand();
    
elseif funnum==20
    n=size(x,2);
    sum1 = 0;
    sum2=1;
    for i=1:n
        sum1=sum1+(x(i)^2)^0.5;
        sum2=sum2*(x(i)^2)^0.5;
    end
    y=sum1+sum2;

elseif funnum==21
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        for j=1:i
            sum1=sum1+x(j)^2;
        end
    end
    y=sum1;

elseif funnum==22
    n=size(x,2);
    y = 0;
    for i=1:n-1
        y=y+100*(x(i+1)-x(i)^2)^2+(x(i)-1)^2;
    end

elseif funnum==23
    n=size(x,2);
    sum1=(x(1)-1)^2;
    sum2=0;
    for i=2:n
        sum2=sum2+i*(2*x(i)^2-x(i-1))^2;
    end
    y=sum1+sum2;
    
elseif funnum==24
    n=size(x,2);
    s = 0;
    for j = 1:n
        s = s+(x(j)^2-10*cos(2*pi*x(j))); 
    end
    y = 10*n+s;
    
elseif funnum==25
   n=size(x,2);
    fr = 4000;
    s = 0;
    p = 1;
    for j = 1:n; 
        s = s+x(j)^2; 
    end
    for j = 1:n; 
        p = p*cos(x(j)/sqrt(j)); 
    end
    y = s/fr-p+1;
    
elseif funnum==26
    n=size(x,2);
    a = 20; b = 0.2; c = 2*pi;
    s1 = 0; s2 = 0;
    for i=1:n;
        s1 = s1+x(i)^2;
        s2 = s2+cos(c*x(i));
    end
    y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);   
end

%% --- SETUP (boundary limit, variable numbers, stopping criterion) ---
function [globalMin Lb Ub nd maxFE]=terminate(funnum)
maxFE=500000; % maximum number of function evaluation
Tol = 1e-12;

if funnum==1
    Lb=-4.5;
    Ub=4.5;
    nd=2; % number of variables
    Lb = ones(1,nd)*Lb; % upper bound
    Ub = ones(1,nd)*Ub; % lower bound
    globalMin = 0;
    globalMin = globalMin+Tol;
elseif funnum==2
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = -1;
    globalMin = globalMin+Tol;  
elseif funnum==3
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==4
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==5
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==6
    Lb=-0;
    Ub=pi;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-1.8013;
    globalMin = globalMin+Tol;
elseif funnum==7
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==8
    Lb=-5;
    Ub=5;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-1.0316284534898;
    globalMin = globalMin+Tol;
elseif funnum==9
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==10
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;

elseif funnum==11
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = -186.73;
    globalMin = globalMin+Tol;
elseif funnum==12
    Lb=-10;
    Ub=10;
    nd=4;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;  
elseif funnum==13
    Lb=-0;
    Ub=pi;
    nd=5;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-4.687658;
    globalMin = globalMin+Tol;
elseif funnum==14
    Lb=-5;
    Ub=10;
    nd=10;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==15
    Lb=-0;
    Ub=pi;
    nd=10;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-9.660151715641349;
    globalMin = globalMin+Tol;
elseif funnum==16
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==17
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==18
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==19
    Lb=-1.28;
    Ub=1.28;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==20
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;

elseif funnum==21
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;
elseif funnum==22
    Lb=-30;
    Ub=30;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;  
elseif funnum==23
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==24
    Lb=-5.12;
    Ub=5.12;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==25
    Lb=-600;
    Ub=600;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==26
    Lb=-32;
    Ub=32;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
end
