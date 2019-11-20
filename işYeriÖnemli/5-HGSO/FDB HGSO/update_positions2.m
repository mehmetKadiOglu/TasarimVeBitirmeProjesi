function [Xnew]=update_positions2(X,fitness,best_pos,vec_Xbest,S,var_n_gases,var_n_types,var_Gbest,alpha,beta,var_nvars)
Xnew = zeros(var_n_gases, var_nvars);
vec_flag=[1,-1];
for i=1:var_n_types    %5
    groupDownIndex = 1 + ((i-1)*10);
    groupUpIndex = i*10;
    fitnessGroup = fitness(groupDownIndex:groupUpIndex);
    positionGroup = X(groupDownIndex:groupUpIndex, :);
    for j=1:var_n_gases/var_n_types; % 50/5 10 adet
        gama=beta*exp(-(var_Gbest+.05)/(fitnessGroup(j)+.05));
        flag_index = floor(2*rand()+1);
        var_flag=vec_flag(flag_index);
        for k=1:var_nvars
            Xnew((j+(10*(i-1))),k)=  positionGroup(j,k)+var_flag*rand*gama*(best_pos(i,k)-positionGroup(j,k))+rand*alpha*var_flag*(S(i)*vec_Xbest(k)-positionGroup(j,k));
            
            
        end
    end
end
end
