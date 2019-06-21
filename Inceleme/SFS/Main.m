%*************************************************************************%
% Author: Hamid Salimi                                                    %
% Last Edited: 8/16/2014                                                  %
% Email:salimi.hamid86@gmail.com (or) h.salimi@ut.ac.ir                   %
% Reference: Stochastic Fractal Search: A Powerful Metaheuristic Algorithm%
% Published in Knowledge-Based Systems - Journal - Elsevier.              %
% Please refer to mentioned journal in term of citation.                  %
% The first online draft of journal paper can be found at below link:     %
% http://www.sciencedirect.com/science/article/pii/S0950705114002822      %
% You have to refer SFS code provided any use of SFS's part in your codes %
% If you encounter any problems or bugs in the SFS code, you are welcome  % 
% to contact me.                                                          %
%*************************************************************************%

    clear all
    close all
    clc

%Stochastic Fracral Search-------------------------------------------------
% The structure S contains all the parameters for the SFS algorithm
%--------------------------------------------------------------------------

%Initializing Stochastic Fractal Search Parameters*************************
    % SFS has three main parameters along with an optional parameter:
    % 1- Population size considered as Start_Point
    % 2- Maximum generation considered as Maximum_Generation
    % 3- Maximum Diffusion Number (MDN) considered as Maximum_Diffusion
    % Optional parameter: Choosing diffusion walk considered as Walk
    S.Start_Point = 50;            
    S.Maximum_Generation  = 400;     
    S.Maximum_Diffusion = 2;
    S.Walk = 1; % *Important
%--------------------------------------------------------------------------
    %*Please Note:

    %S.Walk = 1 ----> SFS uses the first Gaussian walk(usually SIMPLE Problems)
    %S.Walk = 0 ----> SFS uses the second Gaussian walk(usually HARD Problems)

    %You can also write:
    %S.Walk = 0.75 ---> SFS uses the first Gaussian walk, with probability 
    %of 75% which comes from uniform, and SFS uses the second Gaussian walk
    %distribution with probability of 25% .
    %Generally, to solve your problem, try to use both walks.
    %If you want to use the second Gaussian walk please increase the maximum
    %generation
%--------------------------------------------------------------------------

%**************************************************************************

%Initializing Problem******************************************************
    % To initialize your problem, you need to set three parameters:
    % 1- Set the name of your function in Function_Name
    % 2- Set the dimension of your problem in Ndim
    % 3- Set the lower and upper vector bounds in Lband and Uband respectively
    % Note: For easy implementation, your functions should take one vector
    % & get back one fitness value.
    S.Function_Name = 'DeJong';
    S.Ndim = 30;
    S.Lband = ones(1, S.Ndim)*(-100);
    S.Uband = ones(1, S.Ndim)*(100);
%**************************************************************************

%Plotting Part*************************************************************
%If you want to plot the problem in 3D, set it to 1. Your dimension problem 
%should be upper than 2, else an error will be occurred.
    S.plot = 1;
%Note: plotting the result consumes the time.
%**************************************************************************

%Printing Result***********************************************************
%if you want to see the best result in each iteration, set it to 1.
    S.ShowResult = 0; 
%Note: printing the result causes consuming time.                                  
%**************************************************************************

%Start Stochastic Fractal Search*******************************************
%compute the time of finding solution
    StartOptimiser = tic;           
    [pbest, fbest, F] = Stochastic_Fractal_Search(S);
    EndOptimiser = toc(StartOptimiser);
%**************************************************************************

%Print Final Results*******************************************************
    fprintf('The time of finding solution is: %f\n', EndOptimiser);

    display('The best solution is:');
    pbest

    display('The value of the best fitness function is:');
    fbest
%**************************************************************************