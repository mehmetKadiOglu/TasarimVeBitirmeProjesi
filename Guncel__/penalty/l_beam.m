function p = l_beam(x)
    tw = x(3);
    h = x(2);
    b = x(1);
    tf = x(4);
    c1 = 2*b*tw + tw*(h-2*tf);
    p = get_penalty(c1);
end