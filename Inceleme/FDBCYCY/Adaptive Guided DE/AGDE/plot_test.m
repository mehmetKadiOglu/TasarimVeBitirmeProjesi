% Problem=[1 : 6 8 : 24]; % number of problems
Problem=[1:28]; % number of problems
% Problem=[7 25]; % number of problems
f=1; % number of figures for each problem == i in playMany file
decimation=50;
for i=1:length(Problem)
    for k=1:f
        figure;
        %file_name=sprintf('Figures\\F1-F6&F8-F24\\Figure_Problem#%s_Gen#%s',int2str(Problem(i)),int2str(k));% to run figures f1-f6 && f8-f24 from folder (F1-F6&F8-F24)
        %file_name=sprintf('Figures\\F7&F25\\Figure_Problem#%s_Gen#%s',int2
        %str(Problem(i)),int2str(k));%to run fig f7 && f25 from folder (F7&F25)
        file_name=sprintf('Figures\\Figure_Problem#%s_Run#%s',int2str(Problem(i)),int2str(k));% to run fig from folder figure so the figure
        %must be copied and paste from file figures and put in the same
        %position besides plot gig file
       
        load(file_name)

        dimx=dim1(1);
        dimx=[dimx dim1(2:decimation:end-1)];
        dimx=[dimx dim1(end)];

        dimy=dim2(1);
        dimy=[dimy dim2(2:decimation:end-1)];
        dimy=[dimy dim2(end)];

        plot(dimx,dimy)
        title(sprintf('Problem # %s Figure # %s',int2str(Problem(i)),int2str(k)))
    end
end
