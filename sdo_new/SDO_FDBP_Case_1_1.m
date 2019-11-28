%--------------------------------------------------------------------------
% SDO code v1.0.
% Developed in MATLAB R2011b
% The code is based on the following papers.
% W. Zhao, L. Wang and Z. Zhang, Supply-Demand-Based Optimization: A Novel
% Economics-Inspired Algorithm for Global Optimization,  Access IEEE, vol.
% 7, pp. 73182-73206, 2019.
% --------------------------------------------------------------------------

% Supply-demand-based optimization (SDO)
function [bestSolution, bestFitness, iter]=SDO_FDBP_Case_1_1(fhd, dimension, maxIteration, fNumber)
    % FunIndex: Index of function.
    % MaxIt: The maximum number of iterations.
    % MarketSize: The size of markets.
    % Dim: The size of commodities in each market.
    % Alpha: The supply weight.
    % Beta: The demand weight.
    % BestX: The best solution found so far. 
    % BestF: The best fitness corresponding to BestX. 
    % HisBestFit: History best fitness over iterations. 
    % Market: The population of markets.
    % Low: The low bound of search space.
    % Up: The up bound of search space.
    % Initialize n markets each of which has a commodity. 
    settings;
    Low = lbArray;
    Up = ubArray;
    Dim = dimension;
    MarketSize = 50;
    MaxIt = ceil((maxIteration / (MarketSize*2)));

    CommPrice = zeros(MarketSize,Dim);
    CommPriceFit = zeros(MarketSize,1);

    CommQuantity = zeros(MarketSize,Dim);
    CommQuantityFit = zeros(MarketSize,1);
    
    Matr=[1 Dim];
    
    for i=1:MarketSize
         CommPrice(i,:)=rand(1,Dim).*(Up-Low)+Low;
         CommPriceFit(i)= testFunction(CommPrice(i,:)', fhd, fNumber);

         CommQuantity(i,:)==rand(1,Dim).*(Up-Low)+Low; 
         CommQuantityFit(i)=testFunction(CommQuantity(i,:)', fhd, fNumber);   

         if  CommQuantityFit(i)<= CommPriceFit(i)
             CommPriceFit(i)= CommQuantityFit(i);
             CommPrice(i,:)= CommQuantity(i,:);
         end    
    end
    
    for Iter=1:MaxIt   
        Net=15*(  (MaxIt-Iter) /MaxIt)-9.9;
        sigmoid = sigmf(Net, [1 0]);  

        a=2*(MaxIt-Iter+1)/MaxIt;    
        F=zeros(MarketSize,1); 
        
        MeanQuantityFit = mean(CommQuantityFit);     
        for i=1:MarketSize       
            F(i) =(abs( CommQuantityFit(i)-MeanQuantityFit)+10^(-15)); % Equation (7)
        end    
        FQ=F/sum(F);  % Equation (8)
        
        MeanPriceFit=mean(CommPriceFit);  
        for i=1:MarketSize       
            F(i) =(abs( CommPriceFit(i)-MeanPriceFit)+10^(-15));%Equation (10)
        end 
        FP=F/sum(F);       % Equation (11)
        MeanPrice=(mean(CommPrice, 2));
              
        for i=1:MarketSize 
            Ind=round(rand)+1;
            k=find(rand<=cumsum(FQ),1,'first'); % Equation (9)
            CommQuantityEqu=CommQuantity(k,:);
            
            Alpha=a*sin((2*pi)*rand(1,Matr(Ind))); % Equation (16)
            Beta=2*cos((2*pi)*rand(1,Matr(Ind))); % Equation (17)
                
             if rand>0.5               
                CommPriceEqu=rand*MeanPrice;% Equation (12)
              else
                k=find(rand<=cumsum(FP),1,'first');   
                CommPriceEqu=CommPrice(k,:); % Equation (12)        
             end
              
              % Supply function (supply relation of producers)
             NewCommQuantity=CommQuantityEqu+Alpha.*( CommPrice(i,:)-CommPriceEqu); %Equation (13)       
             NewCommQuantity=SpaceBound(NewCommQuantity,Up,Low); 
              
             NewCommQuantityFit = testFunction(NewCommQuantity', fhd, fNumber);  
             
             if rand()<sigmoid
                [~, worstIndex] = max(CommQuantityFit);
                [~, bestIndex] = min(CommQuantityFit);
                if CommQuantityFit(worstIndex) > NewCommQuantityFit
                    Populasyon(1).Fitness = CommQuantityFit(i);
                    Populasyon(1).Dimension = CommQuantity(i,:);

                    Populasyon(2).Fitness = NewCommQuantityFit;
                    Populasyon(2).Dimension = NewCommQuantity;

                    Populasyon(3).Fitness = CommQuantityFit(worstIndex);
                    Populasyon(3).Dimension = CommQuantity(worstIndex,:);

                    Populasyon(4).Fitness = CommQuantityFit(bestIndex);
                    Populasyon(4).Dimension = CommQuantity(bestIndex,:);

                    if FDBPopulasyonGuncelle(Populasyon)
                        CommQuantityFit(i)=NewCommQuantityFit;
                        CommQuantity(i,:)=NewCommQuantity;
                    end
                end
            else                              
                if NewCommQuantityFit< CommQuantityFit(i)
                    CommQuantityFit(i)=NewCommQuantityFit;
                    CommQuantity(i,:)=NewCommQuantity;
                end
            end


             
             % Demand function (demand relation of consumers)
             NewCommPrice=CommPriceEqu-Beta.*(NewCommQuantity-CommQuantityEqu );% Equation (14)
             NewCommPrice=SpaceBound(NewCommPrice,Up,Low);
             NewCommPriceFit = testFunction(NewCommPrice', fhd, fNumber);   
             
             if NewCommPriceFit<= CommPriceFit(i)
                 CommPriceFit(i)=NewCommPriceFit;
                 CommPrice(i,:)=NewCommPrice;
             end       
        end    
       
        % Replacement
        for i=1:MarketSize        
            if  CommQuantityFit(i)<= CommPriceFit(i)
                CommPriceFit(i)= CommQuantityFit(i);
                CommPrice(i,:)= CommQuantity(i,:);
            end        
        end
    
    end
    [index, bestFitness] = min(CommPriceFit);
    bestSolution = CommPrice(index, :);
    iter = Iter*(MarketSize*2);
     
    