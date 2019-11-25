function [globalMin, lowerBand, upperBand, numberDimension, maximumEpoc, population] = terminate()

    population = 50;
    tolerance = 0;
    globalMin = -90;
    lowerBand = [-15, -15, -15];
    upperBand =[15, 15, 15];
    numberDimension = 3;
    maximumEpoc = ceil(300000 / population); % bölme kaldýrýla bilir.
    globalMin = globalMin + tolerance;
    
end
