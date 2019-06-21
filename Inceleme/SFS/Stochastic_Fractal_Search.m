%**************************************************************************
% Stochastic Fractal Search Algorithm                                     %
% The output function is:                                                 %
% pbest: the best solution for problem                                    %
% fbest: the value of best fitness function                               %
% F: recording the value of best fitness function in each iteration       %
%**************************************************************************

function [pbest, fbest, F] = Stochastic_Fractal_Search(S)

%Creating random points in considered search space=========================
    point = repmat(S.Lband,S.Start_Point,1) + rand(S.Start_Point, S.Ndim).* ...
        (repmat(S.Uband - S.Lband,S.Start_Point,1));
%==========================================================================

%Calculating the fitness of first created points=========================== 
    FirstFit = [];
    for i = 1 : size(point,1)
        FirstFit(i,:) = feval(S.Function_Name, point(i,:));
    end
    [Sorted_FitVector, Indecis] = sort(FirstFit);
    point = point(Indecis,:);%sorting the points based on obtaind result
%==========================================================================

%Finding the Best point in the group=======================================
    BestPoint = point(1, :);
    F = Sorted_FitVector(1);%saving the first best fitness
%==========================================================================

%Starting Optimizer========================================================
for G = 1  : S.Maximum_Generation
    New_Point = [];%creating new point
    FitVector = [];%creating vector of fitness functions
    %diffusion process occurs for all points in the group
    for i = 1 : size(point,1)
        %creating new points based on diffusion process
        [NP, fit] = Diffusion_Process(point(i,:),S,G,BestPoint);
        New_Point = [New_Point;NP];
        FitVector = [FitVector,fit];
    end
    %======================================================================
    
    %updating best point obtained by diffusion process
    BestFit = min(FitVector);
    BestPoint = New_Point(find(FitVector == BestFit),:);
    S.Start_Point = size(New_Point,1);
    fit = FitVector';
    [sortVal, sortIndex] = sort(fit);
    
    %Starting The First Updating Process====================================
    for i=1:1:S.Start_Point     
        Pa(sortIndex(i)) = (S.Start_Point - i + 1) / S.Start_Point;
    end

    RandVec1 = randperm(S.Start_Point);
    RandVec2 = randperm(S.Start_Point);
    
    for i = 1 : S.Start_Point
        for j = 1 : size(New_Point,2)
            if rand > Pa(i)
                P(i,j) = New_Point(RandVec1(i),j) - rand*(New_Point(RandVec2(i),j) - ...
                    New_Point(i,j));
            else
                P(i,j)= New_Point(i,j);
            end
        end
    end
    P = Bound_Checking(P,S.Lband,S.Uband);%for checking bounds
    Fit_FirstProcess = [];
    for i = 1 : S.Start_Point
        Fit_FirstProcess = [Fit_FirstProcess;feval(S.Function_Name,P(i,:))];
    end
    for i=1:S.Start_Point
        if Fit_FirstProcess(i,:)<=fit(i,:)
            New_Point(i,:)=P(i,:);
            fit(i,:)=Fit_FirstProcess(i,:);
        end
    end

    FitVector = fit;
    %======================================================================    
       
	[SortedFit,SortedIndex] = sort(FitVector);
    New_Point = New_Point(SortedIndex,:);
    BestPoint = New_Point(1,:);%first point is the best
    F = [F;FitVector(1,1)];
    F = sort(F);
    if S.ShowResult == 1
        fprintf('Iteration: %i', G);
        fprintf(',    Best result: %e \n', F(1,1));
    end
    
    %Plotting All Points===================================================
    if eq(S.plot,1)
        PlotFunction(New_Point, min(S.Lband), max(S.Uband),F,G+1);
    end
    %======================================================================
    
    fbest = FitVector(1,:);
    if fbest <= F(1,:)
        pbest = New_Point(1,:);
        fbest = F(1,:);
    end
    point = New_Point;
    
    %Starting The Second Updating Process==================================
    Pa = sort(SortedIndex/S.Start_Point, 'descend');
    
    for i = 1 : S.Start_Point
       if rand > Pa(i)
           %selecting two different points in the group
           R1 = ceil(rand*size(point,1));
           R2 = ceil(rand*size(point,1));
            while R1 == R2
                R2 = ceil(rand*size(point,1));
            end
            
            if rand < .5
                ReplacePoint = point(i,:) - ...
                    rand * (point(R2,:) - BestPoint);
                ReplacePoint = Bound_Checking(ReplacePoint,S.Lband,S.Uband);
            else
                ReplacePoint = point(i,:) + ...
                    rand * (point(R2,:) - point(R1,:));
                ReplacePoint = Bound_Checking(ReplacePoint,S.Lband,S.Uband);
            end
            
            if feval(S.Function_Name, ReplacePoint) < ...
                    feval(S.Function_Name, point(i,:))
                point(i,:) = ReplacePoint;
            end
       end
    
    end
    %======================================================================
    fbest = min(F);
end