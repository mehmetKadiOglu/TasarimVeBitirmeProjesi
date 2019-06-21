function plotdata(Xmin,Fmin,av_obj,FF,SUM_Constraints,NFEs,Elapsed_Time)

% Plot results
figure()
plot(FF,'b','LineWidth',1.5);
xlabel('Number of Iterations');
ylabel('Function Values');
legend('Best fitness');

figure()
plot(av_obj,'r.');
xlabel('Number of Iterations');
ylabel('Function Values');
legend('Average objective value');
disp(' ');
disp(['Best objective function is : ' num2str(Fmin)]);
disp(' ');
disp(['Best solution is : ' num2str(Xmin)]);
disp(' ');
disp(['CPU-Time is : ' num2str(Elapsed_Time)]);
disp(' ');


end