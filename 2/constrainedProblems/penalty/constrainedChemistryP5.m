function p = constrainedChemistryP5(x)

    c1 = 0.0025*(x(4) + x(6)) - 1;
    c2 = 0.0025*(x(5) + x(7) − x(4)) - 1;
    c3 = 0.01*(x(8) − x(5)) - 1;
    c4 = 833.33252*x(4) - x(1)*x(6) + 100*x(1) − 83333.333;
    c5 = 1250*x(5) + x(2)*x(4) − 1250*x(4) − x(2)*x(7);
    c6 = 1250000 + x(3)*x(5) − 2500*x(5) − x(3)*x(8);
    p = get_penalty([c1, c2, c3, c4, c5, c6]);
    if p>0
        p = inf;
    end
    
end