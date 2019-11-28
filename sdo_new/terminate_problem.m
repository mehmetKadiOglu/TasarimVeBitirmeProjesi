function [ lb, ub ] = terminate_problem( number )
%UNT�TLED3 Summary of this function goes here
%   Detailed explanation goes here

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
        lb = [0.01, 0.01, 0.01, 0.01, 0.01];
        ub = [100, 100, 100, 100, 100];
        
    elseif(number == 15)
        lb = [90, 60, 1, 2, 600];
        ub = [110, 80, 5, 9, 1000];
        
    elseif(number == 16)
        lb = [17, 14, 14, 17, 14, 48, 1, 1, 3];
        ub = [96, 54, 51, 46, 51, 124, 6, 6, 5];
        
    elseif(number == 17)
        global D;
        % Design parameters for the benchmark 10-bar truss problem
        Coord=360*[2 1 0;2 0 0;1 1 0;1 0 0;0 1 0;0 0 0]; 
        Con=[5 3;1 3;6 4;4 2;3 4;1 2;6 3;5 4;4 1;3 2];
        Re=[0 0 1;0 0 1;0 0 1;0 0 1;1 1 1;1 1 1];
        Load=zeros(size(Coord));Load(2,:)=[0 -1e5 0];Load(4,:)=[0 -1e5 0];
        E=ones(1,size(Con,1))*1e7;
        A=ones(1,10);
        % Available sections
        AV=[1.62, 1.8, 1.99, 2.13, 2.38, 2.62, 2.88, 2.93, 3.09, 3.13, 3.38, 3.47, 3.55, 3.63, 3.84,...
            3.87, 3.88, 4.18, 4.22, 4.49, 4.59, 4.80, 4.97, 5.12, 5.94, 7.22, 7.97, 11.5, 13.50,...
            13.90, 14.2, 15.5, 16.0, 16.9, 18.8, 19.9, 22.0, 22.9, 28.5, 30.0, 33.5];%in^2
        %Allowable Stress
        TM=25000;%psi
        %Allowable Displacement
        DM=2;%inch
        %Density
        RO=.1;%lb/in^3
        Penalty = 0;
        D=struct('Penalty',Penalty,'Coord',Coord','Con',Con','Re',Re','Load',Load','E',E','A',A','AV',AV','TM',TM','DM',DM','RO',RO');
        lb = ones(1,10)*0.1;
        ub = ones(1,10)*33.5;
        
    elseif(number == 18)
        lb = [10, 10, 0.9, 0.9];
        ub = [50, 80, 5, 5];
        
    elseif(number == 19)
        lb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
        ub = [1, 1, 1, 1, 1, 1, 1, 1, 1, 100, 100, 100, 1];

    elseif(number == 20)
        lb = [1, 1, 1, 1*e-6];
        ub = [16, 16, 16, 16*e-6];

    elseif(number == 21)
        lb = [1, 1, 1, 1*e-6];
        ub = [16, 16, 16, 16*e-6];
        
    else
        lb = [0.01, 0.05, 5, 5];
        ub = [6, 0.5, 15, 15];
    end
end
