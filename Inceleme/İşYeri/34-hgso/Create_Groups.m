function[Group]=Create_Groups(var_n_gases,var_n_types,X)
N=var_n_gases/var_n_types;
i=1;
for j=1:var_n_types
    Group{j}.Position=X(i:i+N,:);
    i=j*N+1;
    if i+N>var_n_gases
        i= j*N;
    end
end
end
