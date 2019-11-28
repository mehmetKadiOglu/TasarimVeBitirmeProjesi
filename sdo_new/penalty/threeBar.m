function p = threeBar(x)
    Q = 2;
    P = 2;
    c1 = ( (sqrt(2) * x(1) + x(2)) / (sqrt(2)* (x(1)^2) + 2*x(1)*x(2)) ) * P - Q;
    c2 = ( (x(2)) / (sqrt(2)* (x(1)^2) + 2*x(1)*x(2)) ) * P - Q;
    c3 = ( 1 / (sqrt(2) * x(2) + x(1)) )* P - Q;
    p = get_penalty([c1, c2, c3]);
end
