function [X]=worst_agents2(X,fitness,M1,M2,dim,G_max,G_min,var_n_gases,var_n_types)
%Rank and select number of worst agents eq.(11)
  [~, X_index]=sort(fitness,'descend');
        M1N =M1*var_n_gases/var_n_types;
        M2N = M2*var_n_gases/var_n_types;
        Nw = round((M2N-M1N).*rand(1,1) + M1N);
        for k=1:Nw
            X(X_index(k),:)=G_min+rand(1,dim).*(G_max-G_min);
        end
        
end