%This function is used to mimic diffusion process, and creates some
%new points based on Gaussian Walks.

%**************************************************************************
%The input function is:                                                   %
%Point: the input point which is going to be diffused                     %
%S: structure of problem information                                      %
%g: generation number                                                     %
%BestPoint: the best point in group                                       %                               %
%==========================================================================
%The output function is:                                                  %
%createPoint: the new points created by Diffusion process                 %
%fitness: the value of fitness function                                   %
%**************************************************************************

function [createPoint, fitness] = Diffusion_Process(Point,S,g,BestPoint)
    %calculating the maximum diffusion for each point
    NumDiffiusion = S.Maximum_Diffusion;
    New_Point = Point;
    
    %Diffiusing Part*******************************************************
    for i = 1 : NumDiffiusion
        %consider which walks should be selected.
        if rand < S.Walk 
            GeneratePoint = normrnd(BestPoint, (log(g)/g)*(abs((Point - BestPoint))), [1 size(Point,2)]) + ...
                (randn*BestPoint - randn*Point);
        else
            GeneratePoint = normrnd(Point, (log(g)/g)*(abs((Point - BestPoint))),...
                [1 size(Point,2)]);
        end

        New_Point = [New_Point;GeneratePoint];

    end
    %check bounds of New Point
    New_Point = Bound_Checking(New_Point,S.Lband,S.Uband);
    %sorting fitness
    fitness = [];
    for i = 1 : size(New_Point,1)
        fitness = [fitness;feval(S.Function_Name,New_Point(i,:))];
    end

    [fit_value,fit_index] = sort(fitness);
    fitness = fit_value(1,1);
    New_Point = New_Point(fit_index,:);
    createPoint = New_Point(1,:);
    %======================================================================
end