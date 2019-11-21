function [ y ] = problems( x, number )

    % Tension / Compression spring design
    if(number == 1)
        y = x(1)^2 * x(2) * (x(3) + 2);
        y = y +  tensionCompressionSpring(x); 
    
    % Pressure-vessel design
    elseif(number == 2)
        y = 0.6224 * x(1) * x(3) * x(4) + 19.84 * x(1)^2 * x(3) + 1.7781 * x(2) * x(3)^2 + 3.1661 * x(1)^2 * x(4);
        y = y + pressureVessel(x);

    % Speed-reducer design
    elseif(number == 3)
        y = 0.7854 * x(1) * x(2)^2 * (3.3333 * x(3)^2 + 14.9334 * x(3) - 43.0934) - 1.508 * x(1) * (x(6)^2 + x(7)^2) + 7.4777 * (x(6)^3 + x(7)^3) + 0.7854 * (x(4) * x(6)^2 + x(5) * x(7)^2);
        y = y + speedReducer(x);

    % Welded beam design
    elseif(number == 4)
        y = 1.10471 * x(1)^2 * x(2) + 0.04811 * x(3) * x(4) * (14 + x(2));
        y = y +  weldedBeam(x);

    % Gear train design
    elseif(number == 5)
        x = round(x);
        y = ((1 / 6.931) - ((x(2) * x(3)) / (x(1) * x(4))))^2;
    
    % Three bar design
    elseif(number == 6)
        y = ( (2 * sqrt(2)*x(1)) + x(2) ) * 100;
        y = y + threeBar(x);
        
    elseif(number == 7)%constrainedChemistryP1
        y = (x(1) - 10)^2 + 5*(x(2) - 12)^2 + x(3)^4 + 3*(x(4) - 11)^2 + 10*x(5)^6 + 7*x(6)^2 + x(7)^4 - 4*x(6)*x(7) - 10*x(6) - 8*x(7);
        y = y + constrainedChemistryP1(x);
        
    elseif(number == 8)%constrainedChemistryP2
        y = 5.3578547*x(3)^2 + 0.8356891*x(1)*x(5) + 37.293239*x(1) - 40729.141;
        y = y + constrainedChemistryP2(x);
    
    elseif(number == 9)%constrainedChemistryP3
        y = 3*x(1) + 0.000001*x(1)^3 + 2*x(2) + (0.000002/3)*x(2)^3;
        y = y + constrainedChemistryP3(x);

    elseif(number == 10)%constrainedChemistryP4
        y = exp(x(1)*x(2)*x(3)*x(4)*x(5));
        y = y + constrainedChemistryP4(x);

    elseif(number == 11)%constrainedChemistryP5
        y = x(1) + x(2) + x(3);
        y = y + constrainedChemistryP5(x);

    elseif(number == 12)%constrainedChemistryP6
        y = x(1)^2 + x(2)^2 + x(1)*x(2) − 14*x(1) − 16*x(2) + (x(3) − 10)^2 + 4*(x(4) - 5)^2 + (x(5) - 3)^2 + 2*(x(6) - 1)^2 + 5*x(7)^2 + 7*(x(8) - 11)^2 + 2*(x(9) - 10)^2 + (x(10) - 7)^2 + 45;
        y = y + constrainedChemistryP6(x);

    elseif(number == 12)%constrainedChemistryP7
        y = (x(1) − 1)^2 + (x(2^) − 1)^2 + (x(3) − 3)^2 + (x(4) − 1)^2 + (x(5) − 1)^2 + (x(6) − 1)^2 − ln(x(7) + 1);
        y = y + constrainedChemistryP7(x);

    elseif(number == 13)%stageGearBox
        %1-4Xgi
        %5-8Xpi
        %9-12Ygi
        %13-16Ypi
        xYArray = [12.7, 25.4, 38.1, 50.8, 63.5, 76.2, 88.9, 101.6, 114.3];
        y = 0;
        for index = 1:4
            c = (xYArray() - xYArray())^2 + (xYArray() - xYArray())^2
        end
        y = (pi/1000)
        y = y + stageGearBox(x);

    elseif(number == 14)%cantileverBeam 41de
        y = 0.6224(x(1) + x(2) + x(3) + x(4) + x(5));
        y = y + cantileverBeam(x);

    elseif(number == 15)%multipleDiskClutchBrake yenisi'da
        x = round(x);
        % x1 R0
        % x2 Ri
        % x3 A
        % x4 S
        % x5 z
        A = [1, 1.5, 2, 2.5, 3];
        y = pi*( x(1)^2 - x(2)^2 ) * A(x(3)) * (x(5) + 1 ) * 7.8*(10^-6);
        y = y + multipleDiskClutchBrake(x);
        
    % Error
    else
        y = inf;
    end
    
end

 