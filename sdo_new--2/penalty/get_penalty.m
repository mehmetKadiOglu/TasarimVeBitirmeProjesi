function penalty = get_penalty(c)
    penalty = 0;
    [~, loop] = size(c);
    for i = 1 : loop
        if(c(i) > 0)
            penalty = penalty + c(i);
        end
    end
end