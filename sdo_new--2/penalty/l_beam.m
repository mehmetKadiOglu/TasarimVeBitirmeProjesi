function p = l_beam(x)
    b = x(1);
    h = x(2);
    tw = x(3);
    tf = x(4);
    htf = h-(2*tf);
    c1 = 2*b*tw + tw*htf - 300 ;
    c2 = (  (18 * h * 10^4 ) / (tw*(htf^3) + 2*b*tw(4*(tf^2) + 3*h*htf))  ) + (  (15*b + 10^3) / (htf*(tw^3) + 2*tw*(b^3))  ) - 56;
    p = get_penalty([c1, c2]);
end