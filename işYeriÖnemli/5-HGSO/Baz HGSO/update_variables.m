function [S]=update_variables(var_iter,var_niter,K,P,C,var_n_types,var_n_gases)
T=exp(-var_iter/var_niter);
T0= 298.15;
i=1;
N=var_n_gases/var_n_types;
for j=1:var_n_types
    K(j)=K(j)*exp(-C(j)*(1/T-1/T0));
    S(i:i+N,:)=P(i:i+N,:)*K(j);
    i=j*N+1;
    if i+N>var_n_gases
        i= j*N;
    end
end
end
