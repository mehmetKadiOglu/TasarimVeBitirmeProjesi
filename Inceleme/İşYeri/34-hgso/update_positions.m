function [Group]=update_positions(Group,best_pos,vec_Xbest,S,var_n_gases,var_n_types,var_Gbest,alpha,beta,var_nvars)
vec_flag=[1,-1];
for i=1:var_n_types    
    for j=1:var_n_gases/var_n_types;
        gama=beta*exp(-(var_Gbest+.05)/(Group{i}.fitness(j)+.05));
        flag_index = floor(2*rand()+1);
        var_flag=vec_flag(flag_index);
        for k=1:var_nvars
            Group{i}.Position(j,k)=  Group{i}.Position(j,k)+var_flag*rand*gama*(best_pos{i}(k)-Group{i}.Position(j,k))+rand*alpha*var_flag*(S(i)*vec_Xbest(k)-Group{i}.Position(j,k));
        end
    end
end
end
