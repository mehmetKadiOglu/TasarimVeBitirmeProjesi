function Group=fun_checkpoisions(dim,Group,var_n_gases,var_n_types,var_down,var_up)
Lb=var_down.*ones(1,dim);
% Upper bounds
Ub=var_up.*ones(1,dim);
for j=1:var_n_types
    for i=1:var_n_gases/var_n_types
        isBelow1 = Group{j}.Position(i,:) < Lb;
        isAboveMax = (Group{j}.Position(i,:) > Ub);
        if isBelow1 == true
            Group{j}.Position(i,:) =Lb;
        elseif find(isAboveMax== true)
            Group{j}.Position(i,:) = Ub;
        end
    end
    
end
end
