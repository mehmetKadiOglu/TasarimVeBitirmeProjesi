function [maxFE Lb Ub nd] = functionAyar(funnum, x)
maxFE=300000; % maximum number of function evaluation
Tol = 1e-12;

if funnum==1
    Lb=-4.5;
    Ub=4.5;
    nd=2; % number of variables
    Lb = ones(1,nd)*Lb; % upper bound
    Ub = ones(1,nd)*Ub; % lower bound
    globalMin = 0;
    globalMin = globalMin+Tol;
elseif funnum==2
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = -1;
    globalMin = globalMin+Tol;  
elseif funnum==3
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==4
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==5
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==6
    Lb=-0;
    Ub=pi;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-1.8013;
    globalMin = globalMin+Tol;
elseif funnum==7
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==8
    Lb=-5;
    Ub=5;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-1.0316284534898;
    globalMin = globalMin+Tol;
elseif funnum==9
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==10
    Lb=-100;
    Ub=100;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;

elseif funnum==11
    Lb=-10;
    Ub=10;
    nd=2;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = -186.73;
    globalMin = globalMin+Tol;
elseif funnum==12
    Lb=-10;
    Ub=10;
    nd=4;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;  
elseif funnum==13
    Lb=-0;
    Ub=pi;
    nd=5;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-4.687658;
    globalMin = globalMin+Tol;
elseif funnum==14
    Lb=-5;
    Ub=10;
    nd=10;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==15
    Lb=-0;
    Ub=pi;
    nd=10;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=-9.660151715641349;
    globalMin = globalMin+Tol;
elseif funnum==16
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==17
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==18
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==19
    Lb=-1.28;
    Ub=1.28;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==20
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;

elseif funnum==21
    Lb=-100;
    Ub=100;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;
elseif funnum==22
    Lb=-30;
    Ub=30;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin = 0;
    globalMin = globalMin+Tol;  
elseif funnum==23
    Lb=-10;
    Ub=10;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==24
    Lb=-5.12;
    Ub=5.12;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==25
    Lb=-600;
    Ub=600;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
elseif funnum==26
    Lb=-32;
    Ub=32;
    nd=30;
    Lb = ones(1,nd)*Lb;
    Ub = ones(1,nd)*Ub;
    globalMin=0;
    globalMin = globalMin+Tol;
end

end