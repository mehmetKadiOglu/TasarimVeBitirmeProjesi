function run_image_clustering_demo

imj=imread('ImageTest.jpg');
[A,B,bandnumber]=size(imj);
imjdata=double(reshape(imj,A*B,bandnumber));
data.image=imj;

data.clusternumber=6; % you can change clusternumber
dim=data.clusternumber*bandnumber;
 
gg=SE('imageclustering',data,dim,zeros(1,dim),255*ones(1,dim));

u=reshape(gg,data.clusternumber,bandnumber);
s=dist(imjdata,u');
[a,imb]=min(s,[],2);
format short g
report=tabulate(imb(:))

imb=reshape(imb,A,B);
assignin('base','cimj',imb);
imshow(imj);shg
figure,imshow(imb,[]);colormap jet, shg

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%5
function out=imageclustering(population,data)
[n,d]=size(population); % d=clusternumber*bandnumber
clusternumber=data.clusternumber; 
imj=double(data.image);
[a,b,bandnumber]=size(imj);   
imjdata=reshape(imj,a*b,bandnumber);

out=rand(n,1); % pre-memory for matlab

for i=1:n
    centers=reshape(population(i,:),clusternumber,bandnumber);
    s=dist(imjdata,centers');
    [svalue,notused]=min(s,[],2);
    out(i)=sum(svalue(:));        
end

%%%%%%%%%

function Global_solution=SE(fnc,mydata,dim,low,up)
 
M=dim ;
q=20;

MAX_FES=1500;

Dmin=low;
Dmax=up;

 allbest=zeros(MAX_FES);% 
    
  type=4;
 
  FES=0;% 
     
individual=struct('fitness',{},'position',{});
rand('seed', sum(100*clock)); 
 
for i=1:q 
        dataE=Dmin+(Dmax-Dmin).*rand(1,M);     
        fitness= feval(fnc,dataE,mydata);
        individual(i).position=dataE;
        individual(i).fitness=fitness;
        FES=FES+1;
           
           if i==1
               tempindividual=individual(1);
               
           end
           
           if individual(i).fitness< tempindividual.fitness
               tempindividual=individual(i);
             
           end
              allbest(FES)= tempindividual.fitness;
               
              fprintf('SE(%d) =%g\n',FES,allbest(FES));
end
  
 
while FES<=MAX_FES%»ìºÏÅÅÐò
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
                  temp(temp>Dmax)=Dmax(temp>Dmax);
                  temp(temp<Dmin)=Dmin(temp<Dmin) ;
               
                
                  fitness= feval(fnc, temp,mydata);
                  if  fitness <individual(j).fitness
                    individual(j).position  =temp ;
                    individual(j).fitness=fitness;   
                  end
                  FES= FES+1;
          % 
                           
                if  fitness< tempindividual.fitness    
                  tempindividual.position=temp;
                  tempindividual.fitness=fitness;
                end
                           
                if  FES>MAX_FES
                            break;
                end
                
               allbest(FES)= tempindividual.fitness;
                              
                if mod(FES,1)==0
                      fprintf('SE(%d) =%g\n',FES,allbest(FES));
                end
                 
             end%For j 
   
end
Global_solution=tempindividual.position;
 return;
  
     
  function ss=HyperSphereTransform(c,d,pp)
              D=length(pp); 
               A=c(pp)-d(pp);
               R=norm(A,2);
               
                O(D-1)=  2*pi*rand ; 
            
               
              for i=1:D-2 
                 O(i)=  rand*pi  ;
              end
 
            % ×ª»»Ö±½Ç×ø±ê
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
            

