%--------------------------------------------------------------------------
% SDO code v1.0.
% Developed in MATLAB R2011b
% The code is based on the following papers.
% W. Zhao, L. Wang and Z. Zhang, Supply-Demand-Based Optimization: A Novel
% Economics-Inspired Algorithm for Global Optimization,  Access IEEE, vol.
% 7, pp. 73182-73206, 2019.
% --------------------------------------------------------------------------

% Supply-demand-based optimization (SDO)
function [bestSolution, bestFitness, iter]=SDO(fhd, dimension, maxIteration, fNumber)
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

OneMarket.CommPrice=[]; % Commodity price
OneMarket.CommPriceFit=[]; % Fitness of commodity price
OneMarket.CommQuantity=[]; % Commodity quantity
OneMarket.CommQuantityFit=[]; % Fitness of commodity quantity

Market=repmat(OneMarket,MarketSize,1);
Matr=[1 Dim];
BestF=inf;
BestX=[];

for i=1:MarketSize
     Market(i).CommPrice=rand(1,Dim).*(Up-Low)+Low;
     Market(i).CommPriceFit= testFunction(Market(i).CommPrice', fhd, fNumber);
     Market(i).CommQuantity=rand(1,Dim).*(Up-Low)+Low; 
     Market(i).CommQuantityFit=testFunction(Market(i).CommQuantity', fhd, fNumber);   
     if Market(i).CommQuantityFit<=Market(i).CommPriceFit
        Market(i).CommPriceFit=Market(i).CommQuantityFit;
        Market(i).CommPrice=Market(i).CommQuantity;
     end    
end

for i=1:MarketSize
   if Market(i).CommPriceFit<=BestF
      BestX=Market(i).CommPrice;
      BestF=Market(i).CommPriceFit;
   end
end

for Iter=1:MaxIt   
            
    a=2*(MaxIt-Iter+1)/MaxIt;    
    F=zeros(MarketSize,1); 
    
    MeanQuantityFit = mean([Market.CommQuantityFit]);     
    for i=1:MarketSize       
        F(i) =(abs(Market(i).CommQuantityFit-MeanQuantityFit)+10^(-15)); % Equation (7)
    end    
    FQ=F/sum(F);  % Equation (8)
    
    MeanPriceFit=mean([Market.CommPriceFit]);  
    for i=1:MarketSize       
        F(i) =(abs(Market(i).CommPriceFit-MeanPriceFit)+10^(-15));%Equation (10)
    end 
    FP=F/sum(F);       % Equation (11)
    MeanPrice=(mean(reshape([Market.CommPrice],Dim,MarketSize),2))';  
          
    for i=1:MarketSize 
        Ind=round(rand)+1;
        k=find(rand<=cumsum(FQ),1,'first'); % Equation (9)
        CommQuantityEqu=Market(k).CommQuantity;
        
        Alpha=a*sin((2*pi)*rand(1,Matr(Ind))); % Equation (16)
        Beta=2*cos((2*pi)*rand(1,Matr(Ind))); % Equation (17)
            
         if rand>0.5               
            CommPriceEqu=rand*MeanPrice;% Equation (12)
          else
            k=find(rand<=cumsum(FP),1,'first');   
            CommPriceEqu=Market(k).CommPrice; % Equation (12)        
         end
          
          % Supply function (supply relation of producers)
         NewCommQuantity=CommQuantityEqu+Alpha.*(Market(i).CommPrice-CommPriceEqu); %Equation (13)       
         NewCommQuantity=SpaceBound(NewCommQuantity,Up,Low); 
          
         NewCommQuantityFit = testFunction(NewCommQuantity', fhd, fNumber);  
         
         if NewCommQuantityFit<=Market(i).CommQuantityFit
            Market(i).CommQuantityFit=NewCommQuantityFit;
            Market(i).CommQuantity=NewCommQuantity;
         end
         
         % Demand function (demand relation of consumers)
         NewCommPrice=CommPriceEqu-Beta.*(NewCommQuantity-CommQuantityEqu );% Equation (14)
         NewCommPrice=SpaceBound(NewCommPrice,Up,Low);
         %Buradaaa
         
         NewCommPriceFit = testFunction(NewCommPrice', fhd, fNumber);   
         
         if NewCommPriceFit<=Market(i).CommPriceFit
            Market(i).CommPriceFit=NewCommPriceFit;
            Market(i).CommPrice=NewCommPrice;
         end       
    end    
   
    % Replacement
    for i=1:MarketSize        
        if Market(i).CommQuantityFit<=Market(i).CommPriceFit
           Market(i).CommPriceFit=Market(i).CommQuantityFit;
           Market(i).CommPrice=Market(i).CommQuantity;
        end        
    end
     
    for i=1:MarketSize        
        if Market(i).CommPriceFit<=BestF
           BestX=Market(i).CommPrice;
           BestF=Market(i).CommPriceFit;
        end            
    end       
end
bestSolution = BestX;
bestFitness = BestF;
iter = Iter*(MarketSize*2);
 
