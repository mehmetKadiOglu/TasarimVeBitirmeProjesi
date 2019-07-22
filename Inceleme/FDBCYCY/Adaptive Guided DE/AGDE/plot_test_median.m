% Problem=[1 : 6 8 : 24]; % number of problems
Problem=[1:28]; % number of problems
% Problem=[7 25]; % number of problems
f=1; % number of figures for each problem == i in playMany file
decimation=50;
load analysis;
for i=1:length(Problem)
        figure;
        file_name=sprintf('Figures\\Figure_Problem#%s_Run#%s',int2str(Problem(i)),int2str(analysis(i,6)));% to run fig from folder figure so the figure

        load(file_name)

        dimx=dim1(1);
        dimx=[dimx dim1(2:decimation:end-1)];
        dimx=[dimx dim1(end)];

        dimy=dim2(1);
        dimy=[dimy dim2(2:decimation:end-1)];
        dimy=[dimy dim2(end)];

        plot(dimx,dimy)
        title(sprintf('Problem # %s Figure # %s',int2str(Problem(i)),int2str(analysis(i,6))))
end
