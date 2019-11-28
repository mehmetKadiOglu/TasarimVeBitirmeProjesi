function p = multipleDiskClutchBrake(x)
    % x1 R0
    % x2 Ri
    % x3 T
    % x4 z
    % x5 F
    x = round(x);
    T = [1, 1.5, 2, 2.5, 3];
    R0 = x(1);
    Ri = x(2);
    t = T(x(3));
    Z = x(4);
    F = x(5);
    PRZ = (F) / ( pi*( R0^2 - Ri^2 ) );
    VSR = (2*pi*0.25*( R0^3 - Ri^3  )) / (90*( R0^2 - Ri^2 ));
    MH = (2/3)*0.5*F*Z*( ( R0^3 - Ri^3 ) / ( R0^2 - Ri^2 ));
    TH = (55*pi*0.25) / (30*( 3 + MH ));
    c1 = (R0 - Ri - 20) * -1;
    c2 = (30 - ( Z + 1 ) * ( t + 0.5 )) * -1;
    c3 = (1 - PRZ ) * -1;
    c4 = (1 * 10 - (PRZ * VSR)) * -1;
    c5 = (10 - VSR) * -1;
    c6 = (15*1.5 - TH) * -1;
    c7 = (MH - 1.5*40) * -1;
    c8 = TH * -1;
    p = get_penalty([c1, c2, c3, c4, c5]);
end