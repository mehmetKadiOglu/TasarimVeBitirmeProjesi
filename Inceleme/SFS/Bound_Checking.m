%This function is used for SFS problem bound chacking 
function p = Bound_Checking(p,lowB,upB)
    for i = 1 : size(p,1)
        upper = double(gt(p(i,:),upB));
        lower = double(lt(p(i,:),lowB));
        up = find(upper == 1);
        lo = find(lower == 1);
        if (size(up,2)+ size(lo,2) > 0 )
            for j = 1 : size(up,2)
                p(i, up(j)) = (upB(up(j)) - lowB(up(j)))*rand()...
                    + lowB(up(j));
            end
            for j = 1 : size(lo,2)
                p(i, lo(j)) = (upB(lo(j)) - lowB(lo(j)))*rand()...
                    + lowB(lo(j));
            end
        end
    end
end