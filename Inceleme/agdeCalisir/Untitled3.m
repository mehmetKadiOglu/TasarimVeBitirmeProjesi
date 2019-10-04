clear
clc
sosToplam = 0 ;
mustafaToplam = 0;
mustafa2Toplam = 0;
for i=13:13
    [bestSolution, bestFitness, iter]=agde(i);
    mustafaToplam = mustafaToplam + bestFitness;
    
    [bestOrganism bestFitness]=SOS(50,16);
    sosToplam = sosToplam + bestFitness;
    
    [bestSolution, bestFitness, iter]=aefa(i);
    mustafa2Toplam = mustafa2Toplam + bestFitness;
end
disp(mustafaToplam);
disp(mustafa2Toplam);
disp(sosToplam);
