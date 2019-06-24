%This function is considered for plotting points movement and fitness values
function [] = PlotFunction(New_Point, Lband, Uband,F,G)
    fplot(1:G,1) = sort(F,'descend');
    figure(1)
    clf
    hold on
    %Plotting points Movement
    view(10,10)
    set(gca,'XLim',[Lband, Uband],'YLim',[Lband, Uband], 'ZLim',[Lband Uband])
    subplot(2,1,1)
    plot3(New_Point(:,1),New_Point(:,2), New_Point(:,3),'oblack','MarkerFaceColor','g');
    title('Points Movement')
    grid on;

    %Plotting the value of fitness function
    set(gca,'XLim',[Lband Uband],'YLim',[Lband Uband])
    subplot(2,1,2)
    semilogy(fplot(1:G,1),'--.black')
    title('Fitness Value')

    refreshdata
    drawnow
end