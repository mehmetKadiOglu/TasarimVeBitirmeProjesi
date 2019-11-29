function p = constrainedChemistryP4(x)
    p = 0;
    c1 = -10;
    for index = 1:5
        c1 = c1 + x(index)^2;
    end
    c2 = x(2)*x(3) - 5*x(4)*x(5);
    c3 = x(1)^3 + x(2)^3 + 1;
    if ( c1 > 0.00001)
        p = p + 1;  end
    if ( c2 > 0.00001)
        p = p + 1;  end
    if ( c3 > 0.00001)
        p = p + 1;  end
end