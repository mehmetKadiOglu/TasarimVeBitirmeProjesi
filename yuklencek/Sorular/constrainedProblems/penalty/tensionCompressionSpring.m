function p = tensionCompressionSpring(x) 

    c1 = 1 - (x(2)^3 * x(3)) / (71785 * x(1)^4);
    c2 = (4 * x(2)^2 - x(1) * x(2)) / (12566 * x(1)^3 * x(2) - x(1)^4) + (1 / (5108 * x(1))) - 1;
    c3 = 1 - ((140.45 * x(1)) / (x(2)^2 * x(3)));
    c4 = ((x(1) + x(2)) / 1.5) - 1;
    p = get_penalty([c1, c2, c3, c4]);
    if p>0
        p = inf;
    end
end