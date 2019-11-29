function p = optimizationOfAnAlkylationProcess(x)
    p = 0;
    c1 = (x(4) / 100*x(1)) - 112 - 13.167*x(8) - 0.6667*x(8)^2;
    c2 = x(8) - ( (x(5)+x(2)) / x(1) );
    c3 = x(4) - x(1) - x(5) + 0.22*x(4);
    c4 = 10^3 * x(3) - x(4)* x(9)*(x(6) / (98-x(6)) );
    c5 = x(9) - 35.82 - 0.222*x(10);
    c6 = x(10) + 133 - 3*x(7);
    c7 = x(7) - 86.35 - 1.098*x(8) + 0.038*x(8)^2 + (1.3 / 4)*(x(6) - 89);

    if c1 > 0.0001
        p = p + 1; end
    if c2 > 0.0001
        p = p + 1; end
    if c3 > 0.0001
        p = p + 1; end

    if c4 > 0.0001
        p = p + 1; end
    if c5 > 0.0001
        p = p + 1; end
    if c6 > 0.0001
        p = p + 1; end

    if c7 > 0.0001
        p = p + 1; end


        %598 kendi içindeki sayfası bu
        % pdf 613
end