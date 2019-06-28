% "AEFA: Artificial electric field algorithm for global optimization." Swarm and Evolutionary Computation 48, pp. 93-108 (2019). 
% Anupam Yadav 14.04.2018, Department of Mathematics, NIT Jalandhar
% anupuam@gmail.com
clear all;
clc;
toplamMin = 0.0;

for k=1:60
            for i=11:11
            rng('default');
            rng(1);
             N=50; 
             max_it=500; 
             FCheck=1; R=1;
             tag=1; % 1: minimization, 0: maximization
             rand('seed', sum(100*clock));
             func_num=i
             [Fbest,Lbest,BestValues,MeanValues]=AEFA(func_num,N,max_it,FCheck,tag,R);
             toplamMin = Fbest + toplamMin;
            %  semilogy(BestValues,'--r');
            %  title(['\fontsize{12}\bf F',num2str(func_num)]);
            %  xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
            %  legend('\fontsize{10}\bf AEFA',1);
            end
end
toplamMin


%394.6010 karman corman
%104.2384 duz aynı ama bunla rand ceille yapıldı
% 6.0316 === 4 kaos index
%61.3878 == 5 kaos index
%63.5706 == 6 kaos
%0.4270 == 7 kaosss
% 60.0433 == 8 kaosss
% 77.2533 == 9 kaoss
%99.6706 == 10 kaoss

%60.7318 == 1 kaoosss
%63.7415 == 2 kaosss







%249.0702


