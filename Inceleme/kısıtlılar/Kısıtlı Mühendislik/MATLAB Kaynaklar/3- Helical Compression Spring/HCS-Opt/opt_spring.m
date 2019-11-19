function optoutput = opt_spring()
% Use with hcs.m to solve the following design optimization problem:
% minimize mass, subject to spring constraints, wrt d, D, p, Na
%
% Author: James T. Allison, University of Illinois at Urbana-Champaign
% Date: 10-5-2017
% Created for use in SE 410 and SE 413 at UIUC

% Construct starting point, upper, and lower bounds for full design vector:
x0f =  [0.012 0.1  0.075 6];
xlbf = [0.003 0.05 0.050 3];
xubf = [0.020 0.25 0.400 15];

% Optional: create a vector other than 1:4 to select a subset of variables
% to use as optimization variables. Variables not selected will be set to
% their default values as specified in hcs.m. 
xsub = 1:4;       
x0 = x0f(xsub);         % Updated starting point vector
xlb = xlbf(xsub);       % Updated lower bound vector
xub = xubf(xsub);       % Updated upper bound vector

% Initialize struct used to eliminate redundant objective and constraint
% function evaluations. This is particularly useful for simulation-based
% design optimization where a single simulation outputs both objective
% function and one or more constraint function values. 
system_state.obj = 0;
system_state.con = zeros(1,6);
system_state.econ = zeros(1,1);
system_state.x = x0+1;

% Set optimization function options. 
%   Note: this code was developed originally before optimoptions was
%   available. For newer versions of MATLAB, optimoptions is preferred over
%   optimset for setting optimization function options. 
options=optimset('Display','iter','Algorithm','sqp');

% Set display level for analysis function during optimization:
display_level = 0;

% Solve the optimization problem using fmincon:
[xopt, fopt, flag, out, lambda]= ... 
    fmincon(@f_obj,x0,[],[],[],[],xlb,xub,@f_con,options);

% Display results of final design:
hcs(xopt,3);

% Collect all optimization outputs into a single struct to return:
optoutput.xopt = xopt;              
optoutput.fopt = fopt;
optoutput.flag = flag;
optoutput.out = out;
optoutput.susp_out = system_state.output;
optoutput.lambda = lambda;

% Subfunctions used for preventing redundant function evaluations: 

    function obj = f_obj(x)
        % Evaluate objective function when called by fmincon. Only run
        % analysis function and update obj value if x has changed. 
        update_obj(x);
        obj = system_state.obj;        
    end
    function [g,h] = f_con(x)
        % Evaluate constraint functions when called by fmincon. Only run
        % analysis function and update constraint values if x has changed.
        update_obj(x); g = system_state.con; 
        h = system_state.econ;
    end
    function   update_obj(x)
        % Check if design vector x has changed.
        if isequal(system_state.x,x) 
            % If x has not changed, do nothing (do note perform system
            % analysis).
        else
            % If x has changed, perform system analysis to update objective
            % and constraint function values sotred in system_state. 
            system_state.x = x; system_analysis();
        end
    end
    function system_analysis()
        % Perform system analysis, update system_state  
        x_temp = system_state.x;
        checkxsub(xsub,x_temp)
        output = hcs(x_temp,display_level,xsub);
        system_state.obj = output.obj;
        system_state.con = output.g;
        system_state.econ = output.h;
        system_state.output = output;
    end
    function checkxsub(xsub,xp)
        if any(~diff(sort(xsub)))
            error('Repeated elements in variable subset specification')
        end
        if length(xsub)~=length(xp)
            error('Variable subset specification and variable subset arrays must be the same length')
        end
    end
end
