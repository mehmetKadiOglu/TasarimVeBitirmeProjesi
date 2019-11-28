function p = bellevilleSpring(x)
    t = x(1);
    h = x(2);
    Di = x(3);
    De = x(4);
    E = 30*(10^6);
    S = 200000;
    Smax = 0.2;
    S1 = Fa(h / t) * (h / t);
    u = 0.3;
    K = De / Di;
    Pmax = 5400;
    Dmax = 12.01;
    H = 2;
    α = ((6) / (pi*log(K))) * ((K-1)/K)^2;
    B = ((6) / (pi*log(K))) * ( ((K-1)/log(K)) - 1 );
    γ = ((6) / (pi*log(K))) * ( (K-1)/2 );
    C12Q = (4*E*Smax) / (  (1-u^2) * α * (De^2)  );
    C12H = (h - (Smax / 2));
   
    
    c1 = ( S - C12 * ( B* C12H + γ * t )  )  * -1;
    c2 = (  ( C12Q * ( C12H * (h-Smax) * t + t^3 ) ) -Pmax  ) * -1
    c3 = (S1 - Smax) * -1;
    c4 = (H - h - t) * -1;
    c5 = (Dmax - De) * -1;
    c6 = (De - Di) * -1;
    c7 = (0.3 - (h/(De-Di))) * -1;
    p = get_penalty([c1, c2, c3, c4, c5, c6, c7]);
end

function a = Fa(x)
    if x <= 1.4 
        a = 1
    else
        switch x
            case 1.5
                a = 0.85;
            case 1.6
                a = 0.77
            case 1.7
                a = 0.71
            case 1.8
                a = 0.66
            case 1.9
                a = 0.63
            case 2
                a = 0.6
            case 2.1
                a = 0.58
            case 2.2
                a = 0.56
            case 2.3
                a = 0.55
            case 2.4
                a = 0.53
            case 2.5
                a = 0.52
            case 2.6
                a = 0.51
            case 2.7
                a = 0.51
            otherwise
                a = 0.5
        end
    end
end