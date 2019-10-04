
beta=3/2;
sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);

wMax = 100;
wMin = 1e-10;

sayilar = zeros(10,10);

for index = 1 : 10
    
    
    for iteration = 1 : 30
        
       chValue=wMax-iteration*((wMax-wMin)/30);
       kaos = chaos(index,iteration,30,chValue);
      
           
     if kaos <10
           sayilar(index, 1) = sayilar(index, 1) + 1;
     elseif kaos >= 10 && kaos < 20
           sayilar(index, 2) = sayilar(index, 2) + 1;
     elseif kaos >= 20 && kaos < 30
           sayilar(index, 3) = sayilar(index, 3) + 1;
     elseif kaos >= 30 && kaos < 40
           sayilar(index, 4) = sayilar(index, 4) + 1;
     elseif kaos >= 40 && kaos < 50
           sayilar(index, 5) = sayilar(index, 5) + 1;
     elseif kaos >= 50 && kaos < 60
           sayilar(index, 6) = sayilar(index, 6) + 1;
     elseif kaos >= 60 && kaos < 70
           sayilar(index, 7) = sayilar(index, 7) + 1;
     elseif kaos >= 70 && kaos < 80
           sayilar(index, 8) = sayilar(index, 8) + 1;
     elseif kaos >= 80 && kaos < 90
           sayilar(index, 9) = sayilar(index, 9) + 1;
     elseif kaos >= 90 && kaos < 100
           sayilar(index, 10) = sayilar(index, 10) + 1;


     end
       
       
    end
        
end

disp(sayilar);