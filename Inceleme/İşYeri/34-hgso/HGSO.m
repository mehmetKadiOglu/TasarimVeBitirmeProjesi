
function [bestSolution, bestFitness, iter]=HGSO(fhd, dimension, maxIteration, fNumber)

settings;
dim = dimension;
var_down = lbArray;
var_up = ubArray;
var_n_gases = 50;       % The swarm size.
var_n_types = 5;       % The number of group.
var_niter = (maxIteration / (var_n_gases*var_n_types));

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

%The population agents are divided into equal clusters with the same Henryç—´ constant value
Group=Create_Groups(var_n_gases,var_n_types,X);
% Compute cost of each agent
for i = 1:var_n_types
    [Group{i},best_fit(i),  best_pos{i}] = Evaluate(fhd, fNumber, var_n_types, var_n_gases, Group{i}, 0, 1);
end
[var_Gbest, var_gbest] = min(best_fit);
vec_Xbest = best_pos{var_gbest};
for var_iter = 1:var_niter
    [S]=update_variables(var_iter,var_niter,K,P,C,var_n_types,var_n_gases);
    Groupnew=update_positions(Group,best_pos,vec_Xbest,S,var_n_gases,var_n_types,var_Gbest,alpha,beta,dim);
    Groupnew=fun_checkpoisions(dim,Groupnew,var_n_gases,var_n_types,var_down,var_up);
    for i = 1:var_n_types
        %alttaa hesaplýyorr
        [Group{i},best_fit(i),  best_pos{i}] = Evaluate(fhd, fNumber,var_n_types,var_n_gases, Group{i},Groupnew{i},0);
        Group{i}=worst_agents(Group{i},M1,M2,dim,var_up,var_down,var_n_gases,var_n_types);
    end
    [var_Ybest, var_index] = min(best_fit);
    vec_Gbest_iter(var_iter)=var_Ybest;
    if var_Ybest<var_Gbest
        var_Gbest=var_Ybest;
        vec_Xbest = best_pos{var_index};
    end
    
end
bestSolution = vec_Xbest;
bestFitness = var_Gbest;
iter = var_iter * var_n_gases * var_n_types;
end


