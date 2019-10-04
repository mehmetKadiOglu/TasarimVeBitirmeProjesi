function y = testFunction(funnum, x)

if funnum==1
    y=((1.5-x(1)+x(1)*x(2))^2+(2.25-x(1)+x(1)*x(2)^2)^2+(2.625-x(1)+x(1)*x(2)^3)^2);

elseif funnum==2
    y=-cos(x(1))*cos(x(2))*exp(-(x(1)-pi)^2-(x(2)-pi)^2); 

elseif funnum==3
    y=0.26*(x(1)^2+x(2)^2)-0.48*x(1)*x(2); 

elseif funnum==4
    y=x(1)^2+2*x(2)^2-0.3*cos(3*pi*x(1))-0.4*cos(4*pi*x(2))+0.7;

elseif funnum==5
    y=(x(1)^2*x(2)-7)^2+(2*x(1)+x(2)-5)^2;

elseif funnum==6
    n=size(x,2);
    m=10;
    sum1=0;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==7
    y=0.5+(sin((x(1)^2+x(2)^2)^0.5)^2-0.5)/(1+0.001*(x(1)^2+x(2)^2)^2);

elseif funnum==8
    y=4*x(1)^2-2.1*x(1)^4+1/3*x(1)^6+x(1)*x(2)-4*x(2)^2+4*x(2)^4;
    
elseif funnum==9
    y=x(1)^2+2*x(2)^2-0.3*cos((3*pi*x(1))*(4*pi*x(2)))+0.3;
    
elseif funnum==10
    y=x(1)^2+2*x(2)^2-0.3*cos((3*pi*x(1))+(4*pi*x(2)))+0.3;
    
elseif funnum==11
    sum1=0;
    sum2=0;
    for i=1:5
        sum1=sum1+i*cos((i+1)*x(1)+i);
        sum2=sum2+i*cos((i+1)*x(2)+i);
    end
    y=sum1*sum2;

elseif funnum==12
    sum1=100*((x(1))^2-x(2))^2+(x(1)-1)^2+(x(3)-1)^2+90*((x(3))^2-x(4))^2+10.1*((x(2)-1)^2+(x(4)-1)^2)+19.8*(x(2)-1)*(x(4)-1);
    y=sum1;

elseif funnum==13
    n=size(x,2);
    m=10;
    sum1=0;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==14
    n=size(x,2);
    sum1=0;
    sum2=0;
    sum3=0;
    for i=1:n
        sum1=sum1+x(i)^2;
        sum2=sum2+0.5*i*x(i);
        sum3=sum3+0.5*i*x(i);
    end
    y=sum1+(sum2)^2+(sum3)^4;

elseif funnum==15
    n=size(x,2);
    sum1=0;
    m=10;
    for i=1:n
        sum1=sum1+sin(x(i))*(sin((i*x(i)^2)/pi))^(2*m);
    end
    y=-sum1;

elseif funnum==16
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+(x(i)+0.5)^2;
    end
    y=sum1;

elseif funnum==17
    y=sum((x).^2);
    
elseif funnum==18
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+i*x(i)^2;
    end
    y=sum1;

elseif funnum==19
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        sum1=sum1+i*x(i)^4;
    end
    y=sum1+rand();
    
elseif funnum==20
    n=size(x,2);
    sum1 = 0;
    sum2=1;
    for i=1:n
        sum1=sum1+(x(i)^2)^0.5;
        sum2=sum2*(x(i)^2)^0.5;
    end
    y=sum1+sum2;

elseif funnum==21
    n=size(x,2);
    sum1 = 0;
    for i=1:n
        for j=1:i
            sum1=sum1+x(j)^2;
        end
    end
    y=sum1;

elseif funnum==22
    n=size(x,2);
    y = 0;
    for i=1:n-1
        y=y+100*(x(i+1)-x(i)^2)^2+(x(i)-1)^2;
    end

elseif funnum==23
    n=size(x,2);
    sum1=(x(1)-1)^2;
    sum2=0;
    for i=2:n
        sum2=sum2+i*(2*x(i)^2-x(i-1))^2;
    end
    y=sum1+sum2;
    
elseif funnum==24
    n=size(x,2);
    s = 0;
    for j = 1:n
        s = s+(x(j)^2-10*cos(2*pi*x(j))); 
    end
    y = 10*n+s;
    
elseif funnum==25
   n=size(x,2);
    fr = 4000;
    s = 0;
    p = 1;
    for j = 1:n; 
        s = s+x(j)^2; 
    end
    for j = 1:n; 
        p = p*cos(x(j)/sqrt(j)); 
    end
    y = s/fr-p+1;
    
elseif funnum==26
    n=size(x,2);
    a = 20; b = 0.2; c = 2*pi;
    s1 = 0; s2 = 0;
    for i=1:n;
        s1 = s1+x(i)^2;
        s2 = s2+cos(c*x(i));
    end
    y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);   
end

end