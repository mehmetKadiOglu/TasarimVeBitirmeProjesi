function  MFLA_parameterNew5
    
for para= 1.2       
       for parap2=5  
           num=30;
      
          m=parap2; 
          n=round(20/m);
          le=n;
          q=m*n;
           beta=para;
          M=30;
          MAX_FES=M*1e4;

for problemIndex =[4 18 28]
     
        onebest=zeros(1,num);%Ã¿¸öº¯Êý25¸ö×îÓÅ½â
        allbest=zeros(num,MAX_FES);%Ã¿¸öº¯ÊÚ25´ÎÔËÐÐµÄËùÓÐÓÅ½â
        
      switch problemIndex

        case 1% 
            % 1.This is sphere function
                       Dmin= -100;
                       Dmax =100;
                        func_num=1;%ÆÀ¹Àº¯Êý
                       bestvalue=-1400;
                          success_threshold=1e-5; 
        case 2%% Good   =JADE
            % 2.This Rastrigrin Function
                     Dmin= -100;
                       Dmax =100;
                      func_num=2;%ÆÀ¹Àº¯Êý = []; alpha = []; b = [];
                      bestvalue=-1300;
                      success_threshold=1e-1; 
                    
        case 3 % Good   =JADE
            % This is Ackley Function
                % x is a vector[-32,32],opt=0
                 Dmin= -100;
                   Dmax =100;
                  func_num=3;%ÆÀ¹Àº¯Êý
                   bestvalue=-1200;
                      success_threshold=1e-5; 
                  
        case 4 % Good   JADE
                 % This is Griewank Function
                  % x is a vector[-600,600],opt=0
                     Dmin= -100;
                       Dmax =100;
                     func_num=4;%ÆÀ¹Àº¯Êý
                     bestvalue=-1100;
                     success_threshold=1; 
                   
        case 5%% 
                  %5. Rosenbrock function
                      Dmin= -100;
                       Dmax =100;
                     func_num=5;%ÆÀ¹Àº¯Êý
                     bestvalue=-1000;
                       success_threshold=1; 
                    
        case 6% Good   JADE
                    %6.Schwefel¡¯s Problem 2.22 [-10,10],0
                    Dmin= -100;
                       Dmax =100;
                    func_num=6;%ÆÀ¹Àº¯Êý
                     bestvalue=-900;
                       success_threshold=1; 
                   
        case 7% Good   JADE
                   % Generalized Schwefel¡¯s Problem 2.26
                    %  [-500,500]
                    Dmin= -100;
                       Dmax =100;
                   func_num=7;%ÆÀ¹Àº¯Êý
                    bestvalue=-800;
                      success_threshold=1; 
                   
        case 8 % 
                    %Schwefel¡¯s Problem 1.2 ,[100,100],[0]
                  Dmin= -100;
                       Dmax =100;
                   func_num=8;%ÆÀ¹Àº¯Êý
                   bestvalue=-700;
                     success_threshold=1; 
                    
        case 9 % 
            %9.Schwefel¡¯s Problem 2.21 ,[100,100],[0]
                  Dmin= -100;
                 Dmax =100;
                 func_num=9;%ÆÀ¹Àº¯Êý
                  bestvalue=-600;
                    success_threshold=1; 
                 
        case 10 % 
                 %10.Step function  [100,100],[0]
                   Dmin= -100;
                   Dmax =100;
                    func_num=10;%ÆÀ¹Àº¯Êý
                    bestvalue=-500;
                      success_threshold=1; 
                     
        case 11
            %11.Quartic function  [-1.28,1.28],[0]
                   Dmin= -100;
                       Dmax =100;
                  func_num=11;%ÆÀ¹Àº¯Êý
                   bestvalue=-400;
                     success_threshold=1; 
                 
            
        case 12%Good   JADE
            %12.Penalized function [-50,50]  0
                  Dmin= -100;
                   Dmax =100;
                 func_num=12;%ÆÀ¹Àº¯Êý
                 bestvalue=-300;
                   success_threshold=1; 
               
        case 13 %Good   JADE
             %%13.Penalized function [-50,50]  0
                 Dmin= -100;
                  Dmax =100;
               func_num=13;%ÆÀ¹Àº¯Êý
                bestvalue=-200;
                  success_threshold=1; 
              
        case 14
            %14.Weierstrass¡¯s function[-0.5,0.5],0
                Dmin= -100;
                  Dmax =100;
                 func_num=14;%ÆÀ¹Àº¯Êý
                 bestvalue=-100;
                   success_threshold=1; 
                 
        case 15 %
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=15;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1; 
           case 16%
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=16;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;     
        case 17%
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=17;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1; 
                  
             case 18%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=18;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;     
                  
        case 19 %
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=19;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1; 
                  
            case 20%%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=20;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;    
              case 21%
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=21;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                  
                   case 22%
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=22;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                   case 23%%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=23;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                   case 24%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=24;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                   case 25%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=25;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
               case 26%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=26;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
               case 27%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=27;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;  
                case 28%Good JADE
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=28;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                  
                 case 29%  
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=29;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
                  
               case 30%  
              %15. Zakharov function [0000],0,[-5,10]
                Dmin= -100;
                 Dmax =100;
               func_num=30;%ÆÀ¹Àº¯Êý
                bestvalue=100;
                  success_threshold=1;   
   end


   
 for tdy=1:num
       
  FES=0;
  tic; t1=clock; 
  rand('seed', sum(100*clock));   
  frog=struct('fitness',{},'center',{});
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
for i=1:q   
data=Dmin+(Dmax-Dmin).*rand(1,M);    
fitness=cec14_func(data',func_num);
frog(i).fitness=fitness;
frog(i).center=data;
FES=FES+1;
 if i==1
       tempFrog=frog(1);
               
   end
           
           if frog(i).fitness< tempFrog.fitness
               tempFrog=frog(i);
             
           end
              allbest(tdy,FES)= tempFrog.fitness;
               
              fprintf('fitMQPSOg(%d) =%g\n',FES,allbest(tdy,FES));

end
 

%%%%%%%%%%%%%%%%%
 
while FES<=MAX_FES%»ìºÏÅÅÐò
        if  FES>MAX_FES
                break;
        end
  
for i=1:q-1
    for j=1:q-i
        if frog(j).fitness < frog(j+1).fitness
            temp=frog(j+1).fitness;
            temp2=frog(j+1).center;
            
             frog(j+1).fitness=frog(j).fitness;
             frog(j+1).center=frog(j).center;
             
             frog(j).center=temp2;
             frog(j).fitness=temp;
        end 
    end
end
  
  for ttt=1:m
        memory(ttt).center =zeros(size( frog(1).center,1),size( frog(1).center,2));
  end 
 
for k=1:le  
      
for i=1:m
    
     %%%%%%%%%%%%%
    Xw= frog(i);
     XwNo=i;
      locXwNO=1;
      
     Xb= frog(i);
     XbNo=i;
     locXbNO=1;
     
     Xwb=frog(i);
      locMean=[];
      fitMeans=zeros(1,n);
               
            for tt=1:n
                  if  frog(i+m*(tt-1)).fitness<Xb.fitness
                      Xb=frog(i+m*(tt-1));
                       XbNo=i+m*(tt-1) ;
                      locXbNO=tt ;
                  end
                  if  frog(i+m*(tt-1)).fitness>Xw.fitness
                      Xw=frog(i+m*(tt-1));
                     XwNo=i+m*(tt-1) ;
                     locXwNO=tt;
                  end
                fitMeans(tt)=frog(i+m*(tt-1)).fitness;  
                 locMean=[locMean;
                               frog(i+m*(tt-1)).center];
            end
            
            w11=rand ;
             v11=rand ;
             Xwb.center=(w11/(w11+v11)).*Xb.center+(v11/(w11+v11)).*Xw.center;       
           
             for tt2=1:n     
                 dis(tt2)= norm(frog((i+m*(tt2-1))).center-frog(XbNo).center,2)^2 +eps;  
             end         
              
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               temploc=locXbNO;
              temploc=locXwNO;
 
             [Mass]=massCalculation(fitMeans,1);
             
              tempDis= dis;
              tempDis([ temploc  ])=[];
              
              tempMass= Mass;
              tempMass([ temploc  ])=[];
                
              Gm= tempMass./tempDis;
              totalGm=sum(Gm);
              Gm=Gm./totalGm;
         
               tempLocalMeans= locMean;
               tempLocalMeans([ temploc  ],:)=[];
               
              mbest1=  sum(tempLocalMeans,1)/n ;
              mbest2=  sum(Gm'*ones(1,M).*tempLocalMeans,1) ;
                 
               sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
               u=randn(size(frog(1).center))*sigma;
              vw=randn(size(frog(1).center));
               step=u./abs(vw).^(1/beta)   ;
              stepsize=  rand  .*(randn) .*step; %levy ·ÉÐÐ²½³¤
               
              
                if rand<0.5 
                   mbest=  mbest1;
          
                else
                    mbest= mbest2;
                    
                end
                
                  temp=Xw.center;
              
                 temp= Xwb.center+rand* (stepsize.*mbest -frog((XwNo)).center)  ;
 
                temp(temp>Dmax)=Dmax;
                temp(temp<Dmin)=Dmin;
                           
                             
                 fitness =cec14_func(temp',func_num);
                 FES=FES+1;
                             
                  if  fitness <frog((XwNo)).fitness
                                 frog((XwNo)).center  = temp ;
                                 frog((XwNo)).fitness=fitness;
                 end
             %¼ÇÂ¼Ã¿¸öFES×î¼ÑÊÊÓ¦¶ÈÖµ
                   if  fitness< tempFrog.fitness    
                             tempFrog.center=temp;
                             tempFrog.fitness=fitness;
                   end                               
                 if  FES>MAX_FES
                            break;
                 end
                 allbest(tdy,FES)= tempFrog.fitness;
                              
                if mod(FES,2113)==0
                               fprintf('fitLSFLAg(%d) =%g\n',FES,allbest(tdy,FES));
                end
                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
    end%m
 
end%le
%%
   %%
  for iii=1:q         
          frogA(iii,:)=frog(iii).center;    
      end
     map=zeros(q,M); % see Algorithm-2 in [1]         
  
  for i=1:q 
       u=randperm(M); 
       map(i,u(1:ceil(rand*M)))=1;
  end
      
   K=rand(size(frogA))>0 ;
   stepsize=  rand.*map.*  (frogA(randperm(q),:)-frogA(randperm(q),:));
  
  new_frogA=frogA+stepsize.* K;
  
      for jjj=1:q
           data=new_frogA(jjj,:);
           data(data>Dmax)=Dmax;
           data(data<Dmin)=Dmin;
           fitness=cec14_func(data',func_num);
            
           if fitness<frog(jjj).fitness
               frog(jjj).center=data;
               frog(jjj).fitness=fitness;   
           end  
             FES= FES+1;
             %¼ÇÂ¼Ã¿¸öFES×î¼ÑÊÊÓ¦¶ÈÖµ
                           
          if  fitness< tempFrog.fitness    
                  tempFrog.center=data;
                 tempFrog.fitness=fitness;
          end
                           
           if  FES>MAX_FES
                            break;
              end
              allbest(tdy,FES)= tempFrog.fitness;
                                %³É¹¦ÂÊ
                              
                if mod(FES,2113)==0
                               fprintf('fitLSFLAg(%d) =%g\n',FES,allbest(tdy,FES));
               end
                             
                 %¼ÇÂ¼Ã¿¸öFES×î¼ÑÊÊÓ¦¶ÈÖµ
            
      end
%          
%        %È«¾ÖËÑË÷



end%while
  
 toc;etime(clock,t1) ;
  onebest(tdy)=allbest (tdy,MAX_FES);

 end%tdy
%     c01='D:\matlabCode\LSFLAg\data\30M\LSFLAg\CEC2014\para\onebest';
%        d01=[c01  num2str(problemIndex)];
%        
%        d01=[d01   '_'];
%         
%        e01=[d01  num2str(10*para)];
%         f01=[e01  '_'];
%        g01=[f01  num2str(parap2)];
%         save(g01, 'onebest');
% %          
%         c02='D:\matlabCode\LSFLAg\data\30M\LSFLAg\CEC2014\para\allbest';
%        d02=[c02  num2str(problemIndex)];
%        
%        d02=[d02   '_'];
%        
%        e02=[d02  num2str(10*para)];
%        f02=[e02  '_'];
%        g02=[f02  num2str(parap2)];  
%        save( g02, 'allbest');
 
        end%21function
        
      end%parap2
      
end% para





% sbest(tdy)
function [M]=massCalculation(fit,min_flag)
%%%%here, make your own function of 'mass calculation'

Fmax=max(fit); Fmin=min(fit); Fmean=mean(fit); 
[i N]=size(fit);

if Fmax==Fmin
   M=ones(1,N);
else
    
   if min_flag==1 %for minimization
      best=Fmin;worst=Fmax; %eq.17-18.
   else %for maximization
      best=Fmax;worst=Fmin; %eq.19-20.
   end
  
   M=1*(fit-worst)./(best-worst)+0  ; %eq.15,

end

M=M./sum(M); %eq. 16.

 
 