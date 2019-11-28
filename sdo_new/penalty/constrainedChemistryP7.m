function p = constrainedChemistryP7(x)
    for index = 4:7
        x(index) = round(x(index));
    end
    c1 = -5;
    c2 = -5.5;
    for index = 1:6
        c1 = c1 + x(index);
        c2 = c2 + x(index)^2;
    end
    c2 = c2 - (x(4)^2 + x(5)^2);
    c3 = x(1) + x(4) - 1.2;
    c4 = x(2) + x(5) - 1.8;
    c5 = x(3) + x(6) - 2.5;
    c6 = x(1) + x(7) - 1.2;
    c7 = x(2)^2 + x(5)^2  - 1.64;
    c8 = x(3)^2 + x(6)^2 - 4.25;
    c9 = x(3)^2 + x(5)^2 - 4.64;
 
    p = get_penalty([c1, c2, c3, c4, c5, c6, c7, c8, c9]);
end
