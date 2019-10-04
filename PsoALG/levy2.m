function [ L ] = levy2( D )
    
    D = 10;
    beta=3/2;
    sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
    u=randn(1,D)*sigma;
    v=randn(1);
    step=u./abs(v).^(1/beta);
    L=100*abs(0.01*step);
    
   
    for ii=1:10
        if L(ii)>1 
            L(ii)=1;
        end
    end
     
end