function [ y ] = problems( x, number )

    % Tension / Compression spring design
    if(number == 1)
        y = x(1)^2 * x(2) * (x(3) + 2);
        y = y + Inf * tensionCompressionSpring(x); 
    
    % Pressure-vessel design
    elseif(number == 2)
        y = 0.6224 * x(1) * x(3) * x(4) + 19.84 * x(1)^2 * x(3) + 1.7781 * x(2) * x(3)^2 + 3.1661 * x(1)^2 * x(4);
        y = y + Inf * pressureVessel(x);

    % Speed-reducer design
    elseif(number == 3)
        y = 0.7854 * x(1) * x(2)^2 * (3.3333 * x(3)^2 + 14.9334 * x(3) - 43.0934) - 1.508 * x(1) * (x(6)^2 + x(7)^2) + 7.4777 * (x(6)^3 + x(7)^3) + 0.7854 * (x(4) * x(6)^2 + x(5) * x(7)^2);
        y = y + 100000 * speedReducer(x);

    % Welded beam design
    elseif(number == 4)
        y = 1.10471 * x(1)^2 * x(2) + 0.04811 * x(3) * x(4) * (14 + x(2));
        y = y + Inf * weldedBeam(x);

    % Gear train design
    elseif(number == 5)
        x = round(x);
        y = ((1 / 6.931) - ((x(2) * x(3)) / (x(1) * x(4))))^2;
        
    % Three bar design
    elseif(number == 6)
        y = ( (2 * sqrt(2)*x(1)) + x(2) ) * 100;
        y = y + (Inf * threeBar(x));
        
    elseif(number == 7)%constrainedChemistryP1
        
        y = (x(1) - 10)^2 + 5*(x(2) - 12)^2 + x(3)^4 + 3*(x(4) - 11)^2 + 10*x(5)^6 + 7*x(6)^2 ...
            + x(7)^4 - 4*x(6)*x(7) - 10*x(6) - 8*x(7);
        y = y + (Inf * constrainedChemistryP1(x));
        
    elseif(number == 8)%constrainedChemistryP2
        
        y = 5.3578547*x(3)^2 + 0.8356891*x(1)*x(5) + 37.293239*x(1) - 40729.141;
        y = y + (Inf * constrainedChemistryP2(x));
    % Error
    else
        y = inf;
    end
    
end

 