function GATruss

%% This function implements the MATLAB Genetic Algorithm (GA) for truss optimization
% GA is used for optimization of the benchmark 10-bar truss problem with
% continuous design varialbes. More details about this problem and a
% comparison between results of different algorithms is available in the
% following papers:
% 1: Multi-class teaching–learning-based optimization for truss design with
% frequency constraints  (http://www.sciencedirect.com/science/article/pii/S0141029615006732)
% 2: Design of space trusses using modified teaching learning based
% optimization (http://www.sciencedirect.com/science/article/pii/S0141029614000236)
% Programmer: Mohammad Farshchin, Ph.D candidate at the University of Memphis
% Email: Mohammad.Farshchin@gmail.com

clc
global Z D
Z=0;
D=Data;
nvars = 10;                                                                 % Number of design variables
LB = 0.1*ones(1,10);                                                        % Lower bound
UB = 35*ones(1,10);                                                         % Upper bound
ObjectiveFunction = @FitnessFunc;
ConstraintFunction = @ConstraintsFunc;
options = gaoptimset('StallGenLimit',4,'PopulationSize',100);
disp('Optimization in progress, please wait...')
% Run GA
[x,fval,exitFlag,output,population,scores] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB, ...
    ConstraintFunction,options);

% Display optimization results
disp('Optimization results:')
fprintf('Weight of best solution is: %6.8g\n',fval)
fprintf('Number of function evaluations: %d\n',Z)
disp('Best solution:')
disp(x')