function p = multipleDiskClutchBrake(x)
    aArray =  [1, 1.5, 2, 2.5, 3];
    R0 = x(1);
    Ri = x(2);
    A = aArray(x(3));
    Z = x(5);
    F = x(6);
    S = x(4);
    modS = mod(S,10);
    if modS > 0 || modS < 5
        S = S - modS;
    elseif modS > 5 || modS <= 9
        S = S +  ( 10 - modS);
    end
    PRZ = (F) / ( pi*( R0^2 - Ri^2 ) );
    VSR = (2*pi*250*( R0^3 - Ri^3  )) / (90*( R0^2 - Ri^2 ));
    MH = (2/3)*0.5*F*Z*( ( R0^3 - Ri^3 ) / ( R0^2 - Ri^2 ));
    TH = (55*pi*250) / (30*( 3 + MH ));
    
    p = 0;
    c1 = (R0 + Ri - 20) * -1;
    c2 = (30 - ( Z + 1 ) * ( A + S )) * -1;
    c3 = (1 - PRZ ) * -1;
    c4 = (1 * 10 - (PRZ * VSR)) * -1;
    c5 = (10 - VSR) * -1;
    c6 = (15 - TH) * -1;
    c7 = (MH - 1.5*40*VSR) * -1;
    c8 = TH * -1;

    p = get_penalty([c1, c2, c3, c4, c5, c6, c7, c8]);
    if p>0
        p = inf;
    end
end