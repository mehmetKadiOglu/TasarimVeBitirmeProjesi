function [Xmin,Fmin,average_obj,FF,SUM_Constraints,NFEs,Elapsed_Time]=WCMFO(objective_function,constraints,LB,UB,nvars,Npop,Nsr,dmax,max_it,flag)

format long g
if (nargin <6 || isempty(Npop)), Npop=50; end
if (nargin <7 || isempty(Nsr)), Nsr=4; end
if (nargin <8 || isempty(dmax)), dmax=1e-5; end    
if (nargin <9 || isempty(max_it)), max_it=1000; end
%% ------------------------------------------------------------------------
% Create initial population and form sea, rivers, and streams
tic
epss=0;
N_stream=Npop-Nsr;
ind=zeros(Npop,nvars);
obj_ind=zeros(Npop,1);
SUM_C=zeros(Npop,1);

for i=1:Npop
    ind(i,:)=LB+(UB-LB).*rand(1,nvars);
    obj_ind(i)=objective_function(ind(i,:));
    [c] = constraints(ind(i,:));
    SUM_C(i)=sum(c(c>epss));
end

%----------------Sort to selection of river and sea -----------------------
X_Minus=[];
COST_MINUS=obj_ind(SUM_C<=epss);
if ~isempty(COST_MINUS)
    X_Minus=ind(SUM_C<=epss,:);
    [COST_MINUS,INDEX]=sort(COST_MINUS);
    X_Minus=X_Minus(INDEX,:);
end

X_PLUS=[];
SUM_C_PLUS=SUM_C(SUM_C>epss);
COST_PLUS=obj_ind(SUM_C>epss);
if ~isempty(SUM_C_PLUS)
    X_PLUS=ind(SUM_C>epss,:);
    [~,INDEX]=sort(SUM_C_PLUS);
    X_PLUS=X_PLUS(INDEX,:);
    COST_PLUS=sort(COST_PLUS);
end

ind=[X_Minus;X_PLUS];
obj_ind=[COST_MINUS;COST_PLUS];
index=1:Npop;
%------------- Forming Sea ------------------------------------------------
sea=ind(index(1),:);
F_best=obj_ind(1);
c=constraints(sea);
Constraint_best=sum(c(c>epss));
%-------------Forming Rivers ----------------------------------------------
river=ind(index(2:Nsr),:);
obj_river=obj_ind(2:Nsr);
Constraint_river=zeros(Nsr-1,1);

for j=2:Nsr
    c=constraints(river(j-1,:));
    Constraint_river(j-1)=sum(c(c>epss));
end
%------------ Forming Streams----------------------------------------------
stream=zeros(N_stream,nvars);
obj_stream=zeros(N_stream,1);
for i=1:N_stream
    stream(i,:)=ind(index(Nsr+i),:);
    obj_stream(i)=obj_ind(Nsr+i);
end
%--------- Designate streams to rivers and sea ----------------------------
cs=[F_best;obj_river;obj_stream(1)];
CN=cs-max(cs);

NS=round(abs(CN/sum(CN))*N_stream);
NS(end)=[];

i=Nsr;
while sum(NS)>N_stream
    if NS(i)>1
        NS(i)=NS(i)-1;
    else
        i=i-1;
    end
end

i=1;
while sum(NS)<N_stream
    NS(i)=NS(i)+1;
end

if find(NS==0)
    index=find(NS==0);
    for i=1:size(index,1)
        while NS(index(i))==0
            NS(index(i))=NS(index(i))+round(NS(i)/6);
            NS(i)=NS(i)-round(NS(i)/6);
        end
    end
end

NS=sort(NS,'descend');
NB=NS(2:end);
%%
%----------- Main Loop of WCA ---------------------------------------------
disp('******************** Water Cycle Algorithm (WCA)********************');
disp('*Iterations  Function Values  Sum_Const ****************************');
disp('********************************************************************');
FF=zeros(max_it,1);
average_obj=zeros(max_it,1);
for i=1:max_it
        a=-1+i*((-1)/max_it);
    %---------- Moving stream to sea---------------------------------------
    for j=1:NS(1)
        for kk=1:nvars
            distance_to_flame=abs(stream(j,kk)-sea(kk));
            b=1;
            t=(a-1).*rand(1)+1;
            stream(j,kk)=distance_to_flame.*exp(b.*t).*cos(t.*2*pi)+sea(kk);
        end
        
        stream(j,:)=min(stream(j,:),UB);
        stream(j,:)=max(stream(j,:),LB);
        
        obj_stream(j)=objective_function(stream(j,:));
        c=constraints(stream(j,:));
        Constraint_stream =sum(c(c>epss));
        
        if (Constraint_best<=epss && Constraint_stream<=epss && obj_stream(j)<F_best)||(Constraint_best>epss && Constraint_stream<=epss)
            
            new_sea=stream(j,:);
            stream(j,:)=sea;
            sea=new_sea;
            
            F_obj=obj_stream(j);
            obj_stream(j)=F_best;
            F_best=F_obj;
            Constraint_best=Constraint_stream;
            
        elseif Constraint_best>epss && Constraint_stream>epss && Constraint_best>Constraint_stream
            
            new_sea=stream(j,:);
            stream(j,:)=sea;
            sea=new_sea;
            
            F_obj=obj_stream(j);
            obj_stream(j)=F_best;
            F_best=F_obj;
            Constraint_best=Constraint_stream;
            
        end
    end
    %---------- Moving Streams to rivers-----------------------------------
    for k=1:Nsr-1
        for j=1:NB(k)
             for kk=1:nvars
                  a=-1+i*((-1)/max_it);
                  distance_to_flame=abs(stream(j+sum(NS(1:k)),kk)-river(k,kk));
                  b=1;
                  t=(a-1).*rand(1)+1;
                  stream(j+sum(NS(1:k)),kk)=distance_to_flame.*exp(b.*t).*cos(t.*2*pi)+river(k,kk);
             end
            
            stream(j+sum(NS(1:k)),:)=min(stream(j+sum(NS(1:k)),:),UB);
            stream(j+sum(NS(1:k)),:)=max(stream(j+sum(NS(1:k)),:),LB);
            
            obj_stream(j+sum(NS(1:k)))=objective_function(stream(j+sum(NS(1:k)),:));
            c=constraints(stream(j+sum(NS(1:k)),:));
            Constraint_stream =sum(c(c>epss));
            
            YES=0;
            if (Constraint_river(k)<=epss && Constraint_stream<=epss && obj_stream(j+sum(NS(1:k)))<obj_river(k))||(Constraint_river(k)>epss && Constraint_stream<=epss)
                
                new_river=stream(j+sum(NS(1:k)),:);
                stream(j+sum(NS(1:k)),:)=river(k,:);
                river(k,:)=new_river;
                
                obj_riv=obj_stream(j+sum(NS(1:k)));
                obj_stream(j+sum(NS(1:k)))=obj_river(k);
                obj_river(k)=obj_riv;
                Constraint_river(k)=Constraint_stream;
                YES=1;
                
            elseif Constraint_river(k)>epss && Constraint_stream>epss && Constraint_river(k)>Constraint_stream
                
                new_river=stream(j+sum(NS(1:k)),:);
                stream(j+sum(NS(1:k)),:)=river(k,:);
                river(k,:)=new_river;
                
                obj_riv=obj_stream(j+sum(NS(1:k)));
                obj_stream(j+sum(NS(1:k)))=obj_river(k);
                obj_river(k)=obj_riv;
                Constraint_river(k)=Constraint_stream;
                YES=1;
                
            end
            
            if YES==1
                if  (Constraint_best<=epss && Constraint_river(k)<=epss && obj_river(k)<F_best)||(Constraint_best>epss && Constraint_river(k)<=epss)
                    
                    new_sea=river(k,:);
                    river(k,:)=sea;
                    sea=new_sea;
                    
                    F_obj=obj_river(k);
                    obj_river(k)=F_best;
                    F_best=F_obj;
                    
                    CC=Constraint_best;
                    Constraint_best=Constraint_river(k);
                    Constraint_river(k)=CC;
                    
                elseif Constraint_best>epss && Constraint_river(k)>epss && Constraint_best>Constraint_river(k)
                    
                    new_sea=river(k,:);
                    river(k,:)=sea;
                    sea=new_sea;
                    
                    F_obj=obj_river(k);
                    obj_river(k)=F_best;
                    F_best=F_obj;
                    
                    CC=Constraint_best;
                    Constraint_best=Constraint_river(k);
                    Constraint_river(k)=CC;
                    
                end
            end
        end
    end
    %---------- Moving rivers to Sea --------------------------------------
    for j=1:Nsr-1
        for kk=1:nvars
              a=-1+i*((-1)/max_it);
              distance_to_flame=abs(river(j,kk)-sea(kk));
              b=1;
              t=(a-1).*rand+1;
              river(j,kk)=distance_to_flame.*exp(b.*t).*cos(t.*2*pi)+sea(kk);
        end
        river(j,:)=min(river(j,:),UB);
        river(j,:)=max(river(j,:),LB);
        
        obj_river(j)=objective_function(river(j,:));
        c= constraints(river(j,:));
        Constraint_river(j) =sum(c(c>epss));
        
        if (Constraint_best<=epss && Constraint_river(j)<=epss && obj_river(j)<F_best)||(Constraint_best>epss && Constraint_river(j)<=epss)
            
            new_sea=river(j,:);
            river(j,:)=sea;
            sea=new_sea;
            
            F_obj=obj_river(j);
            obj_river(j)=F_best;
            F_best=F_obj;
            
            CC=Constraint_best;
            Constraint_best=Constraint_river(j);
            Constraint_river(j)=CC;
            
        elseif Constraint_best>epss && Constraint_river(j)>epss && Constraint_best>Constraint_river(j)
            
            new_sea=river(j,:);
            river(j,:)=sea;
            sea=new_sea;
            
            F_obj=obj_river(j);
            obj_river(j)=F_best;
            F_best=F_obj;
            
            CC=Constraint_best;
            Constraint_best=Constraint_river(j);
            Constraint_river(j)=CC;
            
        end
    end
    %--------------Levy Flight--------------
    for j=1:NS(1)
        stream(j,:)=stream(j,:)+Levy(nvars).*stream(j,:);
        stream(j,:)=min(stream(j,:),UB);
        stream(j,:)=max(stream(j,:),LB);
    end
    
    %-------------- Evaporation condition and raining process--------------
    % Check the evaporation condition for rivers   
    for k=1:Nsr-1
        if ((norm(river(k,:)-sea)<dmax) || rand<0.1)
            for j=1:NB(k)
                
                stream(j+sum(NS(1:k)),:)=LB+rand(1,nvars).*(UB-LB);
            end
        end
    end
    % Check the evaporation condition for streams
    for j=1:NS(1)
        if ((norm(stream(j,:)-sea)<dmax))
%              stream(j,:)=LB+rand(1,nvars).*(UB-LB);   % Just for unconstrained WCMFO
            stream(j,:)=sea+sqrt(0.1).*randn(1,nvars);
        end
    end
    %----------------------------------------------------------------------
    if Constraint_best==0
        detail='Feasible';
    else
        detail='Infeasible';
    end
    disp(['Iteration: ',num2str(i),'   Fmin= ',num2str(F_best),'  Sum_Const= ',num2str(Constraint_best) '  The solution is ' detail]);
    FF(i)=F_best;
    objectives=[obj_river; F_best; obj_stream];
    average_obj(i)=mean(objectives);
    if flag==1
        hold off
        plot(FF(1:i),'b','Markersize',15);
        hold on
        plot(average_obj(1:i),'r.','Markersize',15);
        legend('Best fitness (sea)','Average fitness (st+ri+sea)');
        drawnow
    end
end
Elapsed_Time=toc;
NFEs=Npop*max_it;
Xmin=sea;
Fmin=objective_function(Xmin);
SUM_Constraints=Constraint_best;
end
