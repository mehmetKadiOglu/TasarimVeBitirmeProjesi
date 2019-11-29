function [ y ] = problems( x, number )

    % Tension / Compression spring design
    if(number == 1)
        y = x(1)^2 * x(2) * (x(3) + 2);
        y = y + 10 * tensionCompressionSpring(x); 
    
    % Pressure-vessel design
    elseif(number == 2)
        y = 0.6224 * x(1) * x(3) * x(4) + 19.84 * x(1)^2 * x(3) + 1.7781 * x(2) * x(3)^2 + 3.1661 * x(1)^2 * x(4);
        y = y + 1000000 * pressureVessel(x);

    % Speed-reducer design
    elseif(number == 3)
        y = 0.7854 * x(1) * x(2)^2 * (3.3333 * x(3)^2 + 14.9334 * x(3) - 43.0934) - 1.508 * x(1) * (x(6)^2 + x(7)^2) + 7.4777 * (x(6)^3 + x(7)^3) + 0.7854 * (x(4) * x(6)^2 + x(5) * x(7)^2);
        y = y + 100000 * speedReducer(x);

    % Welded beam design
    elseif(number == 4)
        y = 1.10471 * x(1)^2 * x(2) + 0.04811 * x(3) * x(4) * (14 + x(2));
        y = y + 1000 * weldedBeam(x);

    % Gear train design
    elseif(number == 5)
        x = round(x);
        y = ((1 / 6.931) - ((x(2) * x(3)) / (x(1) * x(4))))^2;
        
     % Three bar design
    elseif(number == 6)
        y = ( (2 * sqrt(2)*x(1)) + x(2) ) * 100;
        y = y + 1000*ceil(threeBar(x));
        
    elseif(number == 7)%constrainedChemistryP1
        y = (x(1) - 10)^2 + 5*(x(2) - 12)^2 + x(3)^4 + 3*(x(4) - 11)^2 + 10*x(5)^6 + 7*x(6)^2 + x(7)^4 - 4*x(6)*x(7) - 10*x(6) - 8*x(7);
        y = y + 1000*ceil(constrainedChemistryP1(x));
        
    elseif(number == 8)%constrainedChemistryP2
        y = 5.3578547*x(3)^2 + 0.8356891*x(1)*x(5) + 37.293239*x(1) - 40729.141;
        y = y + 1000*ceil(constrainedChemistryP2(x));
    
    elseif(number == 9)%constrainedChemistryP3
        y = 3*x(1) + 0.000001*(x(1)^3) + 2*x(2) + (0.000002/3)*x(2)^3;
        y = y + 10000*constrainedChemistryP3(x);

    elseif(number == 10)%constrainedChemistryP4
        y = exp(x(1)*x(2)*x(3)*x(4)*x(5));
        y = y + 100000*constrainedChemistryP4(x);

    elseif(number == 11)%constrainedChemistryP5
        y = x(1) + x(2) + x(3);
        y = y + 100000*ceil(constrainedChemistryP5(x));

    elseif(number == 12)%constrainedChemistryP6
        y = x(1)^2 + x(2)^2 + x(1)*x(2) - 14*x(1) - 16*x(2) + (x(3) - 10)^2 + 4*(x(4) - 5)^2 + (x(5) - 3)^2 + 2*(x(6) - 1)^2 + 5*x(7)^2 + 7*(x(8) - 11)^2 + 2*(x(9) - 10)^2 + (x(10) - 7)^2 + 45;
        y = y + 1000*ceil(constrainedChemistryP6(x));

    elseif(number == 13)%constrainedChemistryP7
        for index = 4:7
            x(index) = round(x(index));
        end
        y = (x(1) - 1)^2 + (x(2) - 1)^2 + (x(3) - 3)^2 + (x(4) - 1)^2 + (x(5) - 1)^2 + (x(6) - 1)^2 - log(x(7) + 1);
        y = y + 10000*ceil(constrainedChemistryP7(x));

    elseif(number == 14)%cantileverBeam
        
        y = 0.0624*(x(1) + x(2) + x(3) + x(4) + x(5));
        y = y + 1000000*ceilcantileverBeam(x);
 
    elseif(number == 15)%multipleDiskClutchBrake
        x = round(x);
        % x1 R0
        % x2 Ri
        % x3 T
        % x4 z
        % x5 F
        T = [1, 1.5, 2, 2.5, 3];
        R0 = x(1);
        Ri = x(2);
        t = T(x(3));
        Z = x(4);
        p = 7.8*(10^-6);
        y = pi*(R0^2 - Ri^2)*t*(Z+1)*p;
        y = y + 1000000*multipleDiskClutchBrake(x);    
        
    elseif(number == 16)%planetaryGear
        x = round(x);
        resultArray = zeros(1,3);
        N1 = x(1); N2 = x(2); N3 = x(3); N4 = x(4); N6 = x(6);
        resultArray(1) = (N6/ N4) - 3.11;
        resultArray(2) = ( (N6 * (N1*N3 + N2*N4)) / (N1*N3*(N6-N4)) ) - 1.84;
        resultArray(3) = -((N2*N6)/(N1*N3)) - 3.11;
        resultArray = abs(resultArray);
        y = max(resultArray);
        y = y + 1000000* planetaryGear(x); 
        
    elseif(number == 17)%truss10
        global D;
        D.A=x;
        w=size(D.Re);S=zeros(3*w(2));U=1-D.Re;f=find(U);
        y=0;
        for i=1:size(D.Con,2)
            H=D.Con(:,i);C=D.Coord(:,H(2))-D.Coord(:,H(1));Le=norm(C);
            T=C/Le;s=T*T';G=D.E(i)*D.A(i)/Le;Tj(:,i)=G*T;
            e=[3*H(1)-2:3*H(1),3*H(2)-2:3*H(2)];S(e,e)=S(e,e)+G*[s -s;-s s];
            y=y+Le*D.A(i)*D.RO;
        end
        U(f)=S(f,f)\D.Load(f);F=sum(Tj.*(U(:,D.Con(2,:))-U(:,D.Con(1,:))));
        R=reshape(S*U(:),w);R(f)=0;
        TS=(((abs(F'))./D.A)/D.TM)-1;%Tension
        US=abs(U')/D.DM-1;%Displacement
        PS=sum(TS.*(TS>0));
        PD=sum(sum(US.*(US>0)));
        penalty = (1+PS+PD).^2;
        y=y*penalty;% Penalty function
        if D.Penalty > min(penalty)
            D.Penalty = min(penalty);
        end
        
    elseif(number == 18) %l_beam
       
        b = x(1);
        h = x(2);
        tw = x(3);
        tf = x(4);
        y = 5000/( ( (tw*(h-2*tf)^3) / 12) + ((b*tf^3)/6) + (2*b*tf*((h-tf)/2)^2));
        y = y + 1000000*l_beam(x);
        
    elseif(number == 19) %benchmarkFunction1
        y1 = 0; y2 = 0; y3 = 0;
        for i=1:4
            y1 = x(1) + y1;
            y2 = x(1)^2 + y2;
        end
        for i=5:13
            y3 = x(i) + y3;
        end
        y = 5*y1 - 5*y2 - y3;
        y = y + 1000000*benchmarkFunction1(x);

    elseif(number == 20) %hydrodynamicThrustBearing
        Q = x(1);
        R = x(2);
        R0 = x(3);
        U = x(4);
        N = 750;
        n = -3.55;
        C = 0.5;
        C1 = 10.04;
        P = (log10( log10(8.122 * 10^6 * U + 0.8) ) - C1) / n;
        XT = 2*(10^p - 560);
        EF = 9336 * Q * 0.0307 * C * XT;
        h = ((2*pi*N) / 60 )^2 * ((2*pi*U)/ EF);
        P0 = ( (6*U*Q) / (pi*h^3)) * log(R/R0);
        y = ((Q*P0)/0.7) + EF;
        y = y + 1000000*hydrodynamicThrustBearing(x);  


    elseif(number == 21) % bellevilleSpring

        t = x(1);
        h = x(2);
        Di = x(3);
        De = x(4);

        y = 0.07075 * pi * (De^2 * Di^2) * t;
        y = y + 1000000*bellevilleSpring(x);  

    elseif(number == 22) % corrugatedBulkhead

        y = (5.885*x(4)*(x(1)+x(3))) / (x(1)+sqrt(x(3)^2 - x(2)^2));
        y = y + 1000000*corrugatedBulkhead(x); 

    elseif(number == 23) % optimizationOfAnAlkylationProcess

        y = 0.063*x(4)*x(7) - 5.04*x(1) - 0.035*x(2) - 10*x(3) - 3.36*x(5);
        y = y + 1000000*optimizationOfAnAlkylationProcess(x); 
    % Error
    else
        y = inf;
    end
    
end

 