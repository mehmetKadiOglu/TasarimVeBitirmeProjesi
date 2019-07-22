
% figure;
clear all;

NP = 50; % size of population
D=30;


maxFS= 10000*D;
GEN = maxFS/NP; % number of generations
Success=[];
evls=0;
L = -100;%low boundary constraint
H = 100;%high boundary constraint
ConvDisp=1;
fhd=str2func('cec13_func');
runs=51;
problem=28;
fall=zeros(problem,runs);
results=zeros(problem,runs);
f_optimal=0;
analysis= zeros(problem,6);
for i=1:problem
    f_optimal = optimality (f_optimal,i);

    func_num=i;
    %     figure;
    for j=1 : runs
        tic
        [f,X,g] = DE_new(GEN,NP,func_num,L,H,j,func_num,D,ConvDisp,f_optimal);
%         if g~=GEN
%             Success=[Success,i];
%             evls=evls+g;
%         end
        tm=toc;
        tms(i)=tm;
        results(i, j)=f-f_optimal;
    end
    fprintf('%e\n',min(results(i,:)));
    fprintf('%e\n',median(results(i,:)));
    fprintf('%e\n',mean(results(i,:)));
    fprintf('%e\n',max(results(i,:)));
    fprintf('%e\n',std(results(i,:)));
end
for i=1:problem
    analysis(i,1)=min(results(i,:));
    analysis(i,2)=median(results(i,:));
    analysis(i,3)=mean(results(i,:));   
    analysis(i,4)=max(results(i,:));
    analysis(i,5)=std(results(i,:));
    median_figure=find(results(i,:)== median(results(i,:)));
    analysis(i,6)=median_figure(1);
end

save analysis analysis;





