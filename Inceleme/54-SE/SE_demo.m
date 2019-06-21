function SE_demo


num= 1;
M=10 ;
q=20;
MAX_FES=M*1e4;
 
%   for problemIndex =[1 5 8 9 26 27]
%       
    for problemIndex =6 
         
        onebest=zeros(1,num);%每个函数25个最优解
        allbest=zeros(num,MAX_FES);%每个函授25次运行的所有优解
    
 for tdy=1:num
     
    
   
  type=4;
 
  FES=0;%适应度值数目初始化
     switch problemIndex

        case 1
            % 1.This is sphere function
                       Dmin= -100;
                       Dmax =100;
                        func_num=1;%评估函数
                       bestvalue=0;
                          success_threshold=1e-5; 
                          
        case 2
                     %Schwefel’s Problem 2.22 [-10,10],0
                      Dmin= -10;
                       Dmax =10;
                        func_num=7;%评估函数
                       bestvalue=0;
                          success_threshold=1e-5; 
                         
      case 3
                     %Schwefel’s Problem 1.2 ,[100,100],[0]
                      Dmin= -100;
                      Dmax =100;
                      func_num=11;%评估函数
                     bestvalue=0;
                      success_threshold=1e-5; 
                      
     case 4
                     %Quartic function  [-1.28,1.28],[0]
                      Dmin= -1.28;
                      Dmax =1.28;
                      func_num=14;%评估函数
                     bestvalue=0;
                      success_threshold=1e-5; 
                       
        case 5
            % 2.This Rastrigrin Function
                      Dmin= -5.12;
                      Dmax =5.12;
                      func_num=2;%评估函数 = []; alpha = []; b = [];
                      bestvalue=0;
                      success_threshold=1e-1; 
                    
        case 6 
            % This is Ackley Function
                % x is a vector[-32,32],opt=0
                   Dmin= -32;
                   Dmax =32;
                  func_num=3;%评估函数
                   bestvalue=0;
                      success_threshold=1e-5; 
           
         end
  
individual=struct('fitness',{},'position',{});
rand('seed', sum(100*clock)); 


  
  
  
for i=1:q 
        data=Dmin+(Dmax-Dmin).*rand(1,M);     
        fitness= benchmark_func(data,func_num);
        individual(i).position=data;
        individual(i).fitness=fitness;
        FES=FES+1;
           
           if i==1
               tempindividual=individual(1);
               
           end
           
           if individual(i).fitness< tempindividual.fitness
               tempindividual=individual(i);
             
           end
              allbest(tdy,FES)= tempindividual.fitness;
               
              fprintf('HE01(%d) =%g\n',FES,allbest(tdy,FES));
end
  
 
while FES<=MAX_FES%混合排序
          if  FES>MAX_FES
                break;
          end
 
              fitall=zeros(1,q);        
    for i=1:q 
       fitall(i)=individual(i).fitness;
    end
     [x,y]=sort(fitall);
      
     F=zeros(1,q);
     CR=zeros(1,q);
     for j=1:q
             F(y(j))=j/q+0.1*randn;
              if F(y(j))>1
                  F(y(j))=1;
              elseif F(y(j))<0
                  F(y(j))=j/q;
              end
            if M>=10
              cc= randperm(5);
             paraDim(j)=5+cc(1);
            else
                paraDim(j)=3;
            end
             
%          
     end
     %
          
           global_sss=  tempindividual;
           
           for j=1:q                
                   
                 
                  kk=randperm(q);
              
                    b=individual(kk(1)).position;
                    f=individual(kk(2)).position; 
                    
                    m=individual(kk(3)).position;
                    n=individual(kk(4)).position; 
                    g=individual(kk(5)).position;  
                    
                    a=global_sss.position;
                    h=individual(j).position ;
                   
                    pp2=randperm(M);
                    pp4=randperm( paraDim(j));
%                     
                    mm=pp4(1);
                    pp3= sort(pp2(1:mm))  ;
%               
                   
                      if length(pp3)==1
                      
                        s1= F(j)*HyperSphereTransform_1D(b,f,pp3);  
                        s2= F(j)*HyperSphereTransform_1D(m,n,pp3)  ;
                        s3= F(j)*HyperSphereTransform_1D(h,a,pp3)  ;
                      elseif length(pp3)==2
                            
                        s1=  F(j)*HyperSphereTransform_2D(b,f,pp3);  
                        s2= F(j)*HyperSphereTransform_2D(m,n,pp3)  ;
                        s3= F(j)*HyperSphereTransform_2D(h,a,pp3)  ;
                      else
                    
                  
                        s1=  F(j)*HyperSphereTransform(b,f,pp3)  ;
                        s2= F(j)*HyperSphereTransform(m,n,pp3)  ;
                        s3= F(j)*HyperSphereTransform(h,a,pp3)  ;
                      end
                   
                  
                    switch type
                        case 1%SE/current-to-best/1
                              h(pp3)=h(pp3) + s3  +s2 ; 
                        case 2%SE/best/1
                             h(pp3)=global_sss.position(pp3) +   s1  ;
                        case 3%SE/best/2
                             h(pp3)=global_sss.position(pp3) +   s1  +s2;   
                        case 4%SE/rand/1
                            
                             h(pp3)=g(pp3) +   s1  ;
                        case 5%SE/rand/2
                                h(pp3)=g(pp3) + s1  +s2 ; 
                        case 6 %SE/current/1
                              h(pp3)=h(pp3) + s1    ; 
                        case 7 %SE/current/2
                              h(pp3)=h(pp3) + s1  +s2 ; 
                    end
                
                 
                  temp=h ;               
                  temp(temp>Dmax)=Dmax;
                  temp(temp<Dmin)=Dmin ;
               
                
                  fitness= benchmark_func(temp,func_num);
                  if  fitness <individual(j).fitness
                    individual(j).position  =temp ;
                    individual(j).fitness=fitness;   
                  end
                  FES= FES+1;
          %记录每个FES最佳适应度值
                           
                if  fitness< tempindividual.fitness    
                  tempindividual.position=temp;
                  tempindividual.fitness=fitness;
                end
                           
                if  FES>MAX_FES
                            break;
                end
                
               allbest(tdy,FES)= tempindividual.fitness;
                              
                if mod(FES,1113)==0
                      fprintf('SE01(%d) =%g\n',FES,allbest(tdy,FES));
                end
                 
             end%j 
 
   end%while
   onebest(tdy)=allbest (tdy,MAX_FES);
  
 end%tdy
 
   
 
end% function

  
               
       function ss=HyperSphereTransform(c,d,pp)
              D=length(pp); 
               A=c(pp)-d(pp);
               R=norm(A,2);
               
                O(D-1)=  2*pi*rand ; 
            
               
              for i=1:D-2 
                 O(i)=  rand*pi  ;
              end
 
            % 转换直角坐标
              C(1)=R*prod(sin(O));
              for i=2:D-1
                C(i)= R*cos(O(i-1)) *prod(sin(O(i:D-1)));
              end
              C(D)=R*cos(O(D-1));
               ss=C;
         
            
      function ss=HyperSphereTransform_1D(c,d,pp)
              R=  abs(c(pp)-d(pp));
              C = R*cos(2*pi*rand);
               ss=C;
            
               
      function ss=HyperSphereTransform_2D(c,d,pp)
                A=c(pp)-d(pp);
                R=norm(A,2);
                o1=2*pi*rand;
                C=zeros(1,2);
                C(1) =R*sin(o1);
                C(2) =R*cos(o1);
               ss=C;
            
            
     
function f=benchmark_func(data,func_num)

switch func_num

        case 1
             
            f=f1(data);
            
        case 2

           f=f2(data);
           
        case 3
            
            f=f3(data);
            
        case 4
            
            f=f4(data);
            
        case 5
            
            f=f5(data);
            
        case 6
            
               f=f6(data);
          
end
 

   function y=f1(x)
% This is sphere function
% x is a vector[-100,100],opt=0
d=length(x);
y=0;
for k=1:d
    y=y+x(k)^2;
end

function y=f2(x)
% This Rastrigrin Function
% x is a vector[-5.12,5.12],opt=0
d=length(x);
y=0;
for k=1:d
    y=y+(x(k)^2-10*cos(2*pi*x(k))+10);
end

function result=f3(x)
% This is Ackley Function
% x is a vector[-32,32],opt=0
%Ackley 函数  
%输入x,给出相应的y值,在x=(0,0,…,0) 处有全局极小点0,为得到最大值，返回值取相反数  
%编制人：  
%编制日期：  
[row,col]=size(x);  
if row>1  
    error('输入的参数错误');  
end  
result=-20*exp(-0.2*sqrt((1/col)*(sum(x.^2))))-exp((1/col)*sum(cos(2*pi.*x)))+exp(1)+20;  
   
% d=length(x);
% y1=20*exp((-0.2)*sqrt(sum(x.^2)/d));
% y2=exp(sum(cos(2*pi*x))/d);
% y=20+exp(1)-y1-y2;
        
function y=f4(x)
% This is Griewank Function
% x is a vector[-600,600],opt=0
d=length(x);
y1=0;
y2=1.0;
for k=1:d
    %y1=y1+(x(k)-100)^2;
      y1=y1+(x(k))^2;
    % y2=y2*cos((x(k)-100)/sqrt(k));
    y2=y2*cos((x(k))/sqrt(k));
end
y=y1/4000-y2+1;

function y=f5(data)
  %Shaffer  function
    f1=0;
    f1=0.5+(  sin(  sqrt( data(1)^2+data(2)^2 ) ).^2-0.5    )/(  1+0.001*(  data(1)^2+data(2)^2 )  ).^2  ; 
    y=f1;
    
      function y=f6(x)
% f1 is Rosenbrock function
% The variabe x is a vector
%
d=length(x);
z=0;
for k=1:d-1
  z=z+(100*(x(k+1)-x(k)^2)^2+(x(k)-1)^2);
end
y=z;
 
            
            
     
            