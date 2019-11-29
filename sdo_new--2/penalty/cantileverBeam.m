function p = cantileverBeam(x)
    c1 = 61/x(1)^3 + 27/x(2)^3 + 19/x(3)^3 + 7/x(4)^3 + 1/x(5)^3 -1;
    p = get_penalty(c1);
end