function [problemsName, dimention] = problemsInfo(problemsNumber)
    [~, problemsNameSize] = size(problemsNumber);
    for index=1:problemsNameSize
        % Tension / Compression spring design
        if(problemsNumber(index) == 1)
            problemsName(index) = "tensionCompressionSpring";
            dimention(index) = 3;
        % Pressure-vessel design
        elseif(problemsNumber(index) == 2)       
            problemsName(index) = "pressureVessel";
            dimention(index) = 4;
        % Speed-reducer design
        elseif(problemsNumber(index) == 3)
            problemsName(index) = "speedReducer";
            dimention(index) = 7;
        % Welded beam design
        elseif(problemsNumber(index) == 4)
            problemsName(index) = "weldedBeam";
            dimention(index) = 4;
        % Gear train design
        elseif(problemsNumber(index) == 5)
            problemsName(index) = "gearTrain";
            dimention(index) = 4;
        % Three bar design
        elseif(problemsNumber(index) == 6)
            problemsName(index) = "threeBar";
            dimention(index) = 2;

        elseif(problemsNumber(index) == 7)
            problemsName(index) = "constrainedChemistryP1";
            dimention(index) = 7; 

        elseif(problemsNumber(index) == 8)
            problemsName(index) = "constrainedChemistryP2";
            dimention(index) = 5;

        elseif(problemsNumber(index) == 9)
            problemsName(index) = "constrainedChemistryP3";
            dimention(index) = 4;  

        elseif(problemsNumber(index) == 10)
            problemsName(index) = "constrainedChemistryP4";
            dimention(index) = 5;  

        elseif(problemsNumber(index) == 11)
            problemsName(index) = "constrainedChemistryP5";
            dimention(index) = 8;  

        elseif(problemsNumber(index) == 12)
            problemsName(index) = "constrainedChemistryP6";
            dimention(index) = 10; 

        elseif(problemsNumber(index) == 13)
            problemsName(index) = "constrainedChemistryP7";
            dimention(index) = 7; 

        elseif(problemsNumber(index) == 14)
            problemsName(index) = "";
            dimention(index) = ;  

        elseif(problemsNumber(index) == 15)
            problemsName(index) = "cantileverBeam";
            dimention(index) = 5;   

        elseif(problemsNumber(index) == 16)
            problemsName(index) = "multipleDiskClutchBrake";
            dimention(index) = 6; 
       end
       
    end
end