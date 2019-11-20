function [bestSolution, bestFitness, iteration]=tlabcCaseFDB(fhd, dimension, maxIteration, fNumber)

settings;

D = dimension;
lu = [lbArray; ubArray];
Xmin = lu(1,:);
Xmax = lu(2,:);
popsize = 50; 
trial=zeros(1,popsize);
limit = 200;
CR = 0.5;
X = repmat(Xmin, popsize, 1) + rand(popsize, D) .* (repmat(Xmax-Xmin, popsize, 1));
val_X = testFunction(X', fhd, fNumber);
[val_gBest, min_index] = min(val_X); 
gBest = X(min_index(1),:);
FES = 0;
maxFES=maxIteration;

while FES<maxFES 

    % == == == == == =  Teaching-based employed bee phase  == == == == == = 
    for i=1:popsize 
        [~,sortIndex] = sort(val_X);
        mean_result = mean(X);        % Calculate the mean
        Best = X(sortIndex(1),:);     % Identify the teacher   
        TF=round(1+rand*(1));
        Xi = X(i,:) + (Best -TF*mean_result).*rand(1,D); 
        % Diversity learning
        r = generateR(popsize, i);
        F = rand; 
        V = X(r(1),:) + F*(X(r(2),:) - X(r(3),:));
        flag = (rand(1,D)<=CR);
        Xi(flag) = V(flag);  
        Xi = boundary_repair(Xi,Xmin,Xmax,'reflect'); 
        % Accept or Reject 
        val_Xi = testFunction(Xi', fhd, fNumber);
        FES = FES+1;
        if val_Xi<val_X(i)
            val_X(i) = val_Xi; X(i,:) = Xi;
            trial(i) = 0;
        else
            trial(i) = trial(i)+1; 
        end 
    end
    
    % == == == == == =  Learning-based onlooker bee phase== == == == == =
    Fitness = calculateFitness(val_X); 
    for k=1:popsize  
        i = fitnessDistanceBalance( X, Fitness );
        j = randi(popsize);
        while j==i,j=randi(popsize); end
        if val_X(i)<val_X(j)
            Xi = X(i,:) + rand(1,D).*(X(i,:)-X(j,:));
        else
            Xi = X(i,:) + rand(1,D).*(X(j,:)-X(i,:));
        end  
        Xi = boundary_repair(Xi,Xmin,Xmax,'reflect'); 
        %  Accept or Reject
        val_Xi = testFunction(Xi', fhd, fNumber);
        FES = FES+1;
        if  val_Xi<val_X(i)
            val_X(i) = val_Xi; X(i,:) = Xi;
        end 
    end
    
    % == == == == == = Generalized oppositional scout bee phase  == == == == == =
    ind = find(trial==max(trial));
    ind = ind(1);
    if (trial(ind)>limit)
        trial(ind) = 0;
        sol = (Xmax-Xmin).*rand(1,D)+Xmin;
        solGOBL = (max(X)+min(X))*rand-X(ind,:);
        newSol = [sol;solGOBL];
        newSol = boundary_repair(newSol,Xmin,Xmax,'random');
        val_sol = testFunction(newSol', fhd, fNumber);
        FES = FES+2;
        [~,min_index] = min(val_sol);
        X(ind,:) = newSol(min_index(1),:);
        val_X(ind) = val_sol(min_index(1)); 
    end  
    
    % The best food source is memorized  
    if min(val_X)<val_gBest
    	[val_gBest, min_index] = min(val_X); 
        gBest = X(min_index(1),:);
    end 
    
end

bestSolution = gBest;
bestFitness = val_gBest;
iteration = FES;

end

function r = generateR(popsize, i) 
    %  Generate index 
    %  r = [r1 r2 r3 r4 r5]
    r1 = randi(popsize);
    while r1 == i
        r1 = randi(popsize); 
    end
    r2 = randi(popsize);
    while r2 == r1 || r2 == i
        r2 = randi(popsize); 
    end
    r3 = randi(popsize);
    while r3 == r2 || r3 == r1 || r3 == i
        r3 = randi(popsize); 
    end
    r4 = randi(popsize);
    while r4 == r3 || r4 == r2 || r4 == r1 || r4 == i
        r4 = randi(popsize); 
    end
    r5 = randi(popsize);
    while  r5 == r4 || r5 == r3 || r5 == r2 || r5 == r1 || r5 == i
        r5 = randi(popsize); 
    end
    r = [r1  r2  r3  r4  r5];
end

function u = boundary_repair(v,low,up,str)
    [NP, D] = size(v);   
    u = v; 
    if strcmp(str,'absorb')
        for i = 1:NP    
        for j = 1:D 
            if v(i,j) > up(j) 
                u(i,j) = up(j);
            elseif  v(i,j) < low(j)
                u(i,j) = low(j);
            else
                u(i,j) = v(i,j);
            end  
        end
        end   
    end
    if strcmp(str,'random')
        for i = 1:NP    
        for j = 1:D 
            if v(i,j) > up(j) || v(i,j) < low(j)
                u(i,j) = low(j) + rand*(up(j)-low(j));
            else
                u(i,j) = v(i,j);
            end  
        end
        end   
    end
    if strcmp(str,'reflect')
        for i = 1:NP
        for j = 1:D 
            if v(i,j) > up(j)
                u(i,j) = max( 2*up(j)-v(i,j), low(j) );
            elseif v(i,j) < low(j)
                u(i,j) = min( 2*low(j)-v(i,j), up(j) );
            else
                u(i,j) = v(i,j);
            end  
        end
        end   
    end
end

function fFitness = calculateFitness(fObjV)
    fFitness = zeros(size(fObjV));
    ind = find(fObjV>=0);
    fFitness(ind) = 1./(fObjV(ind)+1);
    ind = find(fObjV<0);
    fFitness(ind) = 1+abs(fObjV(ind));
end

