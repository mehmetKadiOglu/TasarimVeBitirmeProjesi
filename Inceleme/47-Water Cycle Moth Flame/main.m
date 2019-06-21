clear;
close all;
clc;
% Information
% Author and Programmer: Soheyl Khalilpourazari
% Revision 1.0 (2017)

% Hybrid Water Cycle Moth Flame Optimization (WCMFO) algorithm

% The algorithm is proposed for single objective minimization or maximization type constrained and unconstrained problems with continous solution space.
% Note that in order to obey the copy-right rules, please cite our published paper properly. Thank you.



%----------------Base Paper----------------------------------------------
% Khalilpourazari, S., & Khalilpourazary, S. (2017). An efficient hybrid algorithm based on Water Cycle and Moth-Flame
% Optimization algorithms for solving numerical and constrained engineering optimization problems. Soft Computing, 1-24.



% The method used in this code is direct method (based on 4 simple rules)(Deb, 2000). Users are encouraged to use their own constraint handling approaches.
% Reference: K. Deb, An efficient constraint handling method for genetic algorithms, Comput. Method. Appl. M. 186 (2000) 311-338.

% It is acknowledged that this code has been written using a large portion of the following codes:
% “Water cycle algorithm - a novel metaheuristic optimization method for solving constrained engineering optimization problems”, Computers & Structures, 110-111 (2012) 151-166.
% Sadollah, A., Eskandar, H., Lee, H. M., Yoo, D. G., & Kim, J. H. (2016). Water cycle algorithm: A detailed standard code. SoftwareX, 5, 37-43.
% Mirjalili, S. (2015). Moth-flame optimization algorithm: A novel nature-inspired heuristic paradigm. Knowledge-Based Systems, 89, 228-249.

%----------------INPUTS----------------------------------------------
% objective_function:           Objective function which you wish to minimize or maximize
% LB:                           Lower bound vector
% UB:                           Upper bound vector
% nvars:                        Number of design variables
% Npop                          Population size
% Nsr                           Number of rivers + sea
% dmax                          Evaporation condition constant (For unconstrained problems dmax=1e-16 and for constrained problems dmax=1e-05)
% max_it:                       Maximum number of iterations
% flag=                         1 (draw) or 0 (do not draw) Drawing best sol over the course of iterations

%----------------OUTPUTS---------------------------------------------

% Xmin:                         Optimum solution
% Fmin:                         Cost/fitness of optimum solution
% SUM_Constraints               Summation of constraint violations
% NFEs:                         Number of function evaluations
% Elapsed_Time                  Elapsed time for optimization process

% --------------Input parameters for Welded Beam problem-------------
objective_function=@fun;
constraints=@Constraints;
LB=[0.1 0.1 0.1 0.1];
UB=[2 10 10 2];
nvars=4;	
Npop=50;
Nsr=5;
dmax=1e-5;
max_it=20;
flag=0;                        % 0 or 1 (convergence plot over the course of iterations); flag=0 significantly improves computation speed

% Run WCMFO
[Xmin,Fmin,av_obj,FF,SUM_Constraints,NFEs,Elapsed_Time]=WCMFO(objective_function,constraints,LB,UB,nvars,Npop,Nsr,dmax,max_it,flag);

% plot the results
plotdata(Xmin,Fmin,av_obj,FF,SUM_Constraints,NFEs,Elapsed_Time);




