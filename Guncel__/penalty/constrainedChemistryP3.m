function p = constrainedChemistryP3(x)
    p = 0;
    c1 = x(4) - x(3) + 0.55;
    c2 = -x(4) + x(3) + 0.55;
    c3 = (10^3) * sin(-x(3) - 0.25) + (10^3) * sin(-x(4) - 0.25) + 894.8 - x(1);
    c4 = (10^3) * sin(x(3) - 0.25) + (10^3) * sin( x(3) - x(4) - 0.25) + 894.8 - x(2);
    c5 = (10^3) * sin(x(4) - 0.25) + (10^3) * sin(x(4) - x(3) - 0.25) + 1294.8;
    if  c1<0
        p = p + 1; end
    if c2<0
        p = p + 1; end
    if c3 > 0.0001
        p = p + 1; end
    if c4 > 0.0001
        p = p + 1; end
    if c5 > 0.0001
        p = p + 1; end
end

