function p = pressureVessel(x)
    
    c1 = 0.0193 * x(3) - x(1);
    c2 = 0.00954 * x(3) - x(2);
    c3 = 1296000 - (pi * x(3)^2 * x(4)) - ((4 * pi * x(3)^3) / 3);
    c4 = x(4) - 240;
    p = get_penalty([c1, c2, c3, c4]);
    if p>0
        p = inf;
    end
    
end