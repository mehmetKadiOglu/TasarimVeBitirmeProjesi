function [X,best_fit,best_pos] = Evaluate(fhd, fNumber, var_n_types, var_n_gases, X, Xnew, init_flag)
if init_flag==1
    for j=1:var_n_gases/var_n_types
        X.fitness(j) = testFunction(X.Position(j,:)', fhd, fNumber);
    end    
else
    for j=1:var_n_gases/var_n_types
        temp_fit = testFunction(Xnew.Position(j,:)', fhd, fNumber);        
        if temp_fit<X.fitness(j)
            X.fitness(j)=temp_fit;
            X.Position(j,:)= Xnew.Position(j,:);
        end
    end
end
[best_fit,index_best]=min(X.fitness(:));
best_pos=X.Position(index_best,:);
end
