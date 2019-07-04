paths;
% algorithms = {'sos','bsa','dsa','gsa','ckgsa','cgsa','tlabc','hss','gwo','ssa','coa','woa','sca','mfo','lsa','yypo','efo','ms','boa','mfla','aso','abc','pso','de','csa'};
% algorithms = {'sosCaseDOO', 'gsa','bsa','hss','gwo','mfo','lsa','sca','csa','cgsa','ssa','ms','boa'};
% algorithms = {'coa', 'rw_coa', 'fdb_coa', 'l_coa', 'l_rw_coa', 'l_fdb_coa'};
%algorithms = {'pso','psoLevy', 'psoLevy4','psoLevy11', 'psoLevy41','psoLevy111', 'psoLevy112'}; 
algorithms = {'AEFA','AEFA2','AEFA3', 'AEFA4', 'AEFA5', 'AEFA6', 'AEFA7', 'AEFA8', 'AEFA9', 'AEFA10', 'AEFA11','AEFA12','AEFA13', 'AEFA14','AEFA15','AEFA16','AEFA17','AEFA18','AEFA21','AEFA22','AEFA3454','AEFA221'}; 
%'psoLevy112_1', 'psoLevy112_2', 'psoLevy112_3', 
algorithmsNumber = length(algorithms); functionsNumber = 30; experimentNumber = 3;
filename = 'AEFACalismasi.xlsx'; run = 25; %51de ayarlýydý
solution = zeros(algorithmsNumber * experimentNumber, functionsNumber, run);
solutionR = zeros(algorithmsNumber, functionsNumber * experimentNumber, run);
result = zeros(functionsNumber  * algorithmsNumber, 6 * experimentNumber);
firstWilcon = zeros(1, run);
secondWilcon = zeros(1, run);
sumWilcon = zeros(algorithmsNumber*experimentNumber, 3);

for i = 1 : algorithmsNumber
    solutionR(i,:,:) = xlsread(filename, char(algorithms(i)));
end

for i = 1 : functionsNumber
    for j = 1 : run
        for k = 1 : algorithmsNumber * experimentNumber
            m = mod(k, algorithmsNumber); if(m == 0), m = algorithmsNumber; end
            n = (i - 1) * experimentNumber + ceil(k / algorithmsNumber);
            solution(k, i, j) = solutionR(m, n, j);
        end
    end
end

for i = 1 : functionsNumber
    for k=1:experimentNumber
        for m=1:algorithmsNumber
            result(algorithmsNumber*(i-1)+m,6*k-5) = min(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-4) = mean(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-3) = std(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-2) = median(solution(algorithmsNumber*(k-1)+m,i,:));
            result(algorithmsNumber*(i-1)+m,6*k-1) = max(solution(algorithmsNumber*(k-1)+m,i,:));
        end
        for m=1:algorithmsNumber-1
            for n=1:run
                firstWilcon(n) = solution(algorithmsNumber*(k-1)+1,i,n);
                secondWilcon(n) = solution(algorithmsNumber*(k-1)+m+1,i,n);
            end
            [p,h, stats] = ranksum(firstWilcon, secondWilcon);
            wilcon = 0;
            if(h)
                if(p < 0.05)
                    if(stats.zval < 0)
                        wilcon = 2; % SOS daha iyi
                    else
                        wilcon = 1; % CASE daha iyi
                    end  
                end
            end
            result(algorithmsNumber*(i-1)+m+1,6*k) = wilcon;
        end
    end
end

for i=1:experimentNumber
    for j=1:algorithmsNumber
        pW = 0; eW = 0; nW = 0;
        for k=1:functionsNumber
            vW = result(algorithmsNumber * (k - 1) + j, 6 * i);
            if(vW == 0)
                eW = eW + 1;
            elseif(vW == 1)
                pW = pW + 1;
            else
                nW = nW + 1;
            end         
        end
        sumWilcon(algorithmsNumber * (i - 1) + j, 1) = pW;
        sumWilcon(algorithmsNumber * (i - 1) + j, 2) = eW;
        sumWilcon(algorithmsNumber * (i - 1) + j, 3) = nW;
    end
end

xlswrite(filename, result, 'Wilcon');
xlswrite(filename, sumWilcon, 'Result');
disp('Bitti :)');