function p = corrugatedBulkhead(x)
    c1 = (x(2)*x(4)*(0.4*x(1) + (1/6)*x(3)) - (8.94 * (x(1) + sqrt(x(3)^2 - x(2)^2)))) * -1;
    c2 = ( (x(2)^2)*x(4)*(0.2*x(1) + (1/12)*x(3)) - 2.2*( ( 8.94 * (x(1) + sqrt(x(3)^2 - x(2)^2)) )^2 ) ) * -1;
    c3 = ( x(4) - 0.0156*x(1)  - 0.15) * -1;
    c4 = (x(4) - 0.0156*x(3) - 0.15) * -1;
    c5 = (x(4) - 1.05) * -1;
    c6 = (x(3) - x(2)) * -1;
    p = get_penalty([c1, c2, c3, c4, c5, c6]);

    %6.84241
    %The variables x correspond to the following corrugation dimension: x1
    %width, x2 depth, x3 length, and x4 plate thickness.
    %350 pdf kendisinde 335
end