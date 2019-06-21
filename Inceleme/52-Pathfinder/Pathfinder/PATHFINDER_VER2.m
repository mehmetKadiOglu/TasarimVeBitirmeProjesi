
%%-----------------------------------------------%%
%  PATHFINDER algorithm (PFA) V2                 %
%                                                %
%  Developer                                     %
%  H. YAPICI                                     %
  
% This is a simple codes of PFA inspired by      %
% collective movements and leadership behaviours %
% of animals. The parameters can be adjusted for %
% better working.                                %
% This version is for benchmark functions.       %
%                                                %
%                                                %
%   paper: Yapici H, Cetinkaya N.                %
%               A new meta-heuristic optimizer:  % 
%               Pathfinder algorithm.            %
%               Applied Soft Computing. 2019.    %

%%-----------------------------------------------%%

clc;
clear all;
format short;
func = 'Sphere'; % Objective Function
% adjust population, dimension and maximum number of iterations  
pop_size = 100; 
problem_size = 30; 
max_nfes = 1000;
% adjust the lower and upper bound
Lb=-100;
Ub=100;

% initial population and fitness
pop=Lb+(Ub-Lb).*rand(pop_size,problem_size);

for ik=1:pop_size,
    fitness(ik)=feval(func,pop(ik,:));
end
fit_old=fitness;
[fit_global, index]=min(fitness);
pop_old=pop;
global_pop=pop(index,:); 
path_=global_pop; %initial pathfinder
path__old=path_;
minc(1)=fit_global;
meanc(1)=mean(fitness);

nfes=0;
% main iterative process
while nfes < max_nfes
            
            nfes = nfes+1;
            % the updating of parameters
            u1=(-1)+(1-(-1)).*rand(1,problem_size);
            u2=(-1)+(1-(-1)).*rand(pop_size,problem_size);
            alpha=(1)+(2-1).*rand;
            beta=(1)+(2-1).*rand;
            
            r3=rand(1,problem_size);
            r1=rand(pop_size,problem_size);
            r2=rand(pop_size,problem_size);

            A=u1.*exp(-2*nfes/max_nfes);
            eps=(1 - nfes/(max_nfes+1)).*u2;
            
            pop=pop_old; 
            

            % the moving of pathfinder
            path_(1,:) = path_(1,:) + ...
                ((2).*r3(1,:)).*(path__old(1,:) - path_(1,:)) + A(1,:);
            %check the lower bound for pathfinder
            if path_(1,:)<Lb
                path_(1,:)=Lb;
            end
            %check the upper bound for pathfinder
            if path_(1,:)>Ub
                path_(1,:)=Ub;
            end
            path__old=path_; 
            % updating of the pathfinder
            fitx=feval(func, path_(1,:));
            
            [a, index] = sort(fitness);
            pop=pop(index,:);
            if fitx < a(1)
                fitness(1)=fitx;
                pop(1,:)=path_(1,:);
            else
                fitness(1)=fitness(1);
                pop(1,:)=pop(1,:);
            end
    
    
%             [fit,ixi]=sort(fitness);
            
            % the followers movements
            for j=2:pop_size
%                 
                    
                    d=sqrt(((pop(j,:)).^2 + (pop(j-1,:)).^2));
                    
%                     if fitx < fit(j)
                        pop(j,:) = pop(j,:) ...
                            + ((alpha).*r1(j,:)).*(global_pop(1,:)-pop(j,:)) ...
                            + ((beta).*r2(j,:)).*(pop_old(j-1,:)-pop(j,:)) + .1.*(eps(j,:).*d./2);
%                     end
%                 
            end
            %check the lower and upper bound for pathfinder
            I=pop<Lb;
            pop(I)=Lb;
            J=pop>Ub;
            pop(J)=Ub;
            
            for i=1:pop_size
                fitness(i) = feval(func, pop(i,:));
            end
            
            % the updating of whole population
            for i = 1 : pop_size
                
                
                if fitness(i) < fit_old(i)
                    fit_old(i) = fitness(i);
                    pop_old(i,:) = pop(i, :);
                    bsf_index = i;
                else
                    fit_old(i) = fit_old(i);
                    pop_old(i,:) = pop_old(i, :);
                end
                
                
            end
            % this section is for displaying
            [fit_global, index] = min(fit_old);
            global_pop = pop_old(index,:);
            path_=global_pop;
            
            minc(nfes+1)=fit_global;
             disp(['numevals:' num2str(nfes) ...
                ' - best:' num2str(fit_global) ]);
end

x=global_pop;
y=fit_global
meanc=mean(minc)





