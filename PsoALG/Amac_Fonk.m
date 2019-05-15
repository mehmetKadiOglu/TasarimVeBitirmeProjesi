function [uygunlukDeger]=Amac_Fonk(X, fnum)
    if fnum == 1 %Rastrigin
        n=size(X,2);
        s = 0;
        for j = 1:n
            s = s+(X(j)^2-10*cos(2*pi*X(j))); 
        end
        uygunlukDeger = 10*n+s;
    elseif fnum == 2 %Griewank
        n=size(X,2);
        fr = 4000;
        s = 0;
        p = 1;
        for j = 1:n 
            s = s+X(j)^2; 
        end
        for j = 1:n
            p = p*cos(X(j)/sqrt(j)); 
        end
        uygunlukDeger = s/fr-p+1;
        
    elseif fnum == 3 %Michalewicz10
        n=size(X,2);
        sum1=0;
        m=10;
        for i=1:n
            sum1=sum1+sin(X(i))*(sin((i*X(i)^2)/pi))^(2*m);
        end
        uygunlukDeger=-sum1;
    end


    
    %uygunlukDeger = (5-X(1))^2 + (6-X(2))^2; 
    
end
