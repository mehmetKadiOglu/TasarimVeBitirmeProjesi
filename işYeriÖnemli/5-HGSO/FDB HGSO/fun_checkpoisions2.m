function Xnew=fun_checkpoisions2(Xnew,dim,var_n_gases,var_down,var_up)
    Lb=var_down.*ones(1,dim);
    % Upper bounds
    Ub=var_up.*ones(1,dim);

    for i=1:var_n_gases
        isBelow1 = Xnew(i,:) < Lb;
        isAboveMax = (Xnew(i,:) > Ub);
        if isBelow1 == true
            Xnew(i,:) =Lb;
        elseif find(isAboveMax== true)
            Xnew(i,:) = Ub;
        end
    end

end
