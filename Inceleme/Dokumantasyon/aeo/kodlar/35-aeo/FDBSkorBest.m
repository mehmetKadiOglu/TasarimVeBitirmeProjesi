function skor = FDBSkorBest(population, fitness, arananIndex)
    [~, bestIndex] = min(fitness); 
    if (arananIndex == bestIndex)  || ( min(fitness) == max(fitness) )
        skor = 2.2;
    else
        best = population(bestIndex, :);
        [populationSize, dimension] = size(population);

        distances = zeros(1, populationSize); 
        normFitness = zeros(1, populationSize); 
        normDistances = zeros(1, populationSize); 
        divDistances = zeros(1, populationSize); 

        for i = 1 : populationSize
            value = 0;
            for j = 1 : dimension
                value = value + abs(best(j) - population(i, j));
            end
            distances(i) = value;
        end

        minFitness = min(fitness); maxMinFitness = max(fitness) - minFitness;
        minDistance = min(distances); maxMinDistance = max(distances) - minDistance;

        for i = 1 : populationSize
            normFitness(i) = 1 - ((fitness(i) - minFitness) / maxMinFitness);
            normDistances(i) = (distances(i) - minDistance) / maxMinDistance;
            divDistances(i) = normFitness(i) + normDistances(i);
        end

        skor = divDistances(arananIndex);
    end
    
end