function LevyValue = Levy()


    beta=3/2;
    sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);

    step=( randn()*sigma ) / ( abs(randn())^(1/beta) );
    
    LevyValue = abs(step);


end