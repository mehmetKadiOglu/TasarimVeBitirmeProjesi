function [ lb, ub ] = terminate_problem( number )

    if(number == 1)
        lb = [0.05, 0.25, 2.0];
        ub = [2.0, 1.3, 15.0];

    elseif(number == 2)
        lb = [0.0625, 0.0625, 10, 10];
        ub = [6.1875, 6.1875, 200, 200];   

    elseif(number == 3)
        lb = [2.6, 0.7, 17, 7.3, 7.8, 2.9, 5.0];
        ub = [3.6, 0.8, 28, 8.3, 8.3, 3.9, 5.5];
    
    elseif(number == 4)
        lb = [0.1, 0.1, 0.1, 0.1];
        ub = [2, 10, 10, 2];
    
    elseif(number == 5)
        lb = [12, 12, 12, 12];
        ub = [60, 60, 60, 60];

    elseif(number == 6) 
        lb = [0, 0];
        ub = [1, 1];

    elseif(number == 7) 
        lb = [-10, -10, -10, -10, -10, -10, -10];
        ub = [10, 10, 10, 10, 10, 10, 10];

    elseif(number == 8)
        lb = [78, 33, 27, 27, 27];
        ub = [102, 45, 45, 45, 45];

    elseif(number == 9)
        lb = [0, 0, -0.55, -0.55];
        ub = [1200, 1200, 0.55, 0.55];

    elseif(number == 10)
        lb = [-2.3, -2.3, -3.2, -3.2, -3.2];
        ub = [2.3, 2.3, 3.2, 3.2, 3.2];

    elseif(number == 11)
        lb = [100, 10^3, 10^3, 10, 10, 10, 10, 10];
        ub = [100^4, 10^4, 10^4, 10^3, 10^3, 10^3, 10^3, 10^3];

    elseif(number == 12)
        lb = [-10, -10, -10, -10, -10, -10, -10, -10, -10, -10];
        ub = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10];

    elseif(number == 13)
        lb = [0, 0, 0, 0, 0, 0, 0];
        ub = [10, 10, 10, 1, 1, 1, 1];

    elseif(number == 14)
        lb;
        ub ;

    elseif(number == 15)
        lb = [0.01, 0.01, 0.01, 0.01, 0.01];
        ub = [100, 100, 100, 100, 100];
        
    elseif(number == 16)
        lb = [90, 60, 1, 600, 2, 600];
        ub = [110, 80, 5, 1000, 9, 1000];

    else
        lb = [];
        ub = [];
    end
end