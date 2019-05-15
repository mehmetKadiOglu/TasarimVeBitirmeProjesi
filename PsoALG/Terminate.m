function [] = Terminate()
clc
ValueArray = zeros(3,2); 
IndexArray = zeros(3,2); 
str = ["Rastrigin","Griewank","Michalewicz10"];
%{
for i=1:3
    
    
    [index value] = LevyPSO(i);
    [index2 value2] = PSO(i);
  
    fprintf("Problem = %s \nPSOSonuc = %g      LevyPSOSonuc = %g \n",str(i),value2, value);
    fprintf("PSOIterasyon = %g    LevyPSOIterasyon = %g",index2, index);
    fprintf("\n  -------------------------------------------------- \n");
    IndexArray(i,1) = index;
    IndexArray(i,2) = index2;
    ValueArray(i,1) = value;
    ValueArray(i,2) = value2;
end

%disp(IndexArray);
%disp(ValueArray);
347549>> -1
345904>> 
346328>> 
344970>> 
-255.434>>
-259.379>>
-255.597>> 
-264.218>> 


346104>> 
346115>>
345455>> 
347070>> 
-276.725>> 
-258.356>> 
-256.168>> 
-251.451>> 
%}
toplam  = 0;
for i=1:30
    for index232=1:3
        [index value] = LevyPSO(index232);
        toplam = toplam + value;
    end
end
            fprintf("%g",toplam);
end