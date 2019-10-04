function [] = Terminate()
clc
ValueArray = zeros(3,2); 
IndexArray = zeros(3,2); 
str = ["Rastrigin","Griewank","Michalewicz10"];

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

end