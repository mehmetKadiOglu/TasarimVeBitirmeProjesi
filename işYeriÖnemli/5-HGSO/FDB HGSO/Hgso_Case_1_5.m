
function [bestSolution, bestFitness, iter]=Hgso_Case_1_5()

[~, var_down, var_up, dim, maxIteration, var_n_gases] = terminate();      % The swarm size.
var_n_types = 5;       % The number of group.
var_niter = (maxIteration / var_n_gases);
Xnew = zeros(var_n_gases, dim);
%constants in eq (7)
l1=5E-03;
l2=100;
l3=1E-02;
%constants in eq (10)
alpha=1;
beta=1;
%constant in eq (11)
M1=0.1;
M2=0.2;
%paramters setting in eq. (7)
K=l1*rand(var_n_types,1);
P=l2*rand(var_n_gases,1);
C=l3*rand(var_n_types,1);
%randomly initializes the position of agents in the search space
X=var_down+rand(var_n_gases,dim).*(var_up-var_down);
fitness = zeros(var_n_gases,1);
best_fit = zeros(var_n_types,1);
best_pos = zeros(var_n_types,dim);

% Compute cost of each agent
for i = 1:var_n_types
     groupDownIndex = 1 + ((i-1)*10);
     groupUpIndex = i*10;
     fitness(groupDownIndex:groupUpIndex) = calculate(X(groupDownIndex:groupUpIndex,:));
     [~, minIndex] = min(fitness(groupDownIndex:groupUpIndex));
     best_pos(i,:) = X(minIndex + (i-1)*10,:);
     best_fit(i) = fitness(minIndex + (i-1)*10);
end
[var_Gbest, var_gbest] = min(best_fit);
vec_Xbest = best_pos(var_gbest,:);
for var_iter = 1:var_niter
    [S]=update_variables(var_iter,var_niter,K,P,C,var_n_types,var_n_gases);
    fdbIndex = fitnessDistanceBalance(X, fitness);
    vec_flag=[1,-1];
    for i=1:var_n_types    %5
        groupDownIndex = 1 + ((i-1)*10);
        groupUpIndex = i*10;
        fitnessGroup = fitness(groupDownIndex:groupUpIndex);
        positionGroup = X(groupDownIndex:groupUpIndex, :);
        for j=1:var_n_gases/var_n_types; % 50/5 10 adet
            gama=beta*exp(-(var_Gbest+.05)/(fitnessGroup(j)+.05));
            flag_index = floor(2*rand()+1);
            var_flag=vec_flag(flag_index);
            for k=1:dim
                if rand<0.5
                    Xnew((j+(10*(i-1))),k)=  positionGroup(j,k)+var_flag*rand*gama*(best_pos(i,k)-X(fdbIndex,k))+rand*alpha*var_flag*(S(i)*vec_Xbest(k)-positionGroup(j,k));
                else
                    Xnew((j+(10*(i-1))),k)=  positionGroup(j,k)+var_flag*rand*gama*(best_pos(i,k)-positionGroup(j,k))+rand*alpha*var_flag*(S(i)*vec_Xbest(k)-positionGroup(j,k));
                end
            end
        end
    end
    Xnew=fun_checkpoisions2(Xnew, dim,var_n_gases,var_down,var_up);
    for j=1:var_n_gases
        temp_fit = calculate(Xnew(j,:));        
        if temp_fit<fitness(j)
            fitness(j)=temp_fit;
            X(j,:)= Xnew(j,:);
        end
    end
    
    for i = 1:var_n_types
        groupDownIndex = 1 + ((i-1)*10);
        groupUpIndex = i*10;
        [~, minIndex] = min(fitness(groupDownIndex:groupUpIndex));
        best_pos(i,:) = X(minIndex + (i-1)*10,:);
        best_fit(i) = fitness(minIndex + (i-1)*10);
        X(groupDownIndex:groupUpIndex, :)=worst_agents2(X(groupDownIndex:groupUpIndex, :),fitness(groupDownIndex:groupUpIndex),M1,M2,dim,var_up,var_down,var_n_gases,var_n_types);
    end
    [var_Ybest, var_index] = min(best_fit);
    if var_Ybest<var_Gbest
        var_Gbest=var_Ybest;
        vec_Xbest = best_pos(var_index,:);
    end
    
end
bestSolution = vec_Xbest;
bestFitness = var_Gbest;
iter = var_iter * var_n_gases ;
end


