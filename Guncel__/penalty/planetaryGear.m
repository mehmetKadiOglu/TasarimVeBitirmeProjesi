function p = planetaryGear(x)
    x = round(x);
    Dmax = 220;
    mArray = [1.75, 2.0, 2.25, 2.5, 2.75, 3.0];
    m1 = mArray(x(7));
    m2 = mArray(x(8));
    N1 = x(1); N2 = x(2); N3 = x(3); N4 = x(4);
    N5 = x(5); N6 = x(6);
    p = x(9);
    B = (cos((N6-N3)^2 + (N4+N5)^2 - (N3+N5)^2)^-1) / (2*(N6-N3)*(N4+N5));
    c1 = m2*(N6 + 2.5) - Dmax;
    c2 = m1*(N1 + N2) + m1*(N2 + 2) - Dmax;
    c3 = m2*(N4 + N5) + m2*(N5 + 2) - Dmax;
    c4 = abs((m1*(N1 + N2)) - (m2*(N6-N3))) - m1+m2;
    c5 = ((N1 + N2) * sin(pi/p) - N2 - 2 - 0.5) * -1;
    c6 = ((N6 - N3) * sin(pi/p) - N3 - 2 - 0.5) * -1;
    c7 = ((N4 + N5)* sin(pi/p) - N5 - 2 - 0.5) * -1;
    c8 = ( ((N6-N3)^2 + (N4+N5)^2 - 2*(N6-N3)*(N4+N5)*cos( (2*pi / p) - B )) - (N3+N5+2+0.5)^2 ) * -1;
    c9 = (N6 - 2*N3 - N4 - 4 - 2*0.5) * -1;
    c10 = (N6 - N4 - 2*N5 - 4 - 2*0.5) * -1;
    c11 = (N6-N4)/p;
    p = get_penalty([c1, c2, c3, c4, c5, c6, c7, c8, c9, c10]);
    if c11 ~= round(c11)
        p = p + 1;
    end
end
