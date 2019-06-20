%_________________________________________________________________________%
%  GSA + chaotic gravitational constant                                   %
%                                                                         %
%  Developed in MATLAB R2016a                                             %
%                                                                         %
%  Author and programmer: Seyedali Mirjalili                              %
%                                                                         %
%         e-Mail: ali.mirjalili@gmail.com                                 %
%                 seyedali.mirjalili@griffithuni.edu.au                   %
%                                                                         %
%       Homepage: http://www.alimirjalili.com                             %
%                                                                         %
%  Main paper: S. Mirjalili, A. H. Gandomi                                %
%              Grasshopper Optimisation Algorithm: Theory and Application %
%               Applied Soft Computing , in press,                        %
%               DOI: http://dx.doi.org/10.1016/j.asoc.2017.01.008         %
%                                                                         %
%_________________________________________________________________________%
% Note that the bias for the test function is -80 in the paper but 80 here 
% in the code to be able to use semilogy

clear all

P_no=30;
Max_iteration=500;
Run_no=2;

ElitistCheck=1;

All_Convergence_curves=zeros(2,Max_iteration);

chValue=20;
F_index = 1;

for Algorithm_num=1:11
    for i=1:Run_no
        if Algorithm_num==1
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==2
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==3
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==4
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==5
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==6
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==7
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==8
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==9
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==10
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        if Algorithm_num==11
            cg_curve=GSA(F_index,P_no,Max_iteration,ElitistCheck,Algorithm_num,chValue);
        end
        
        temp(i,:)=cg_curve;
    end
    All_Convergence_curves(Algorithm_num,:)=mean(temp);
end

figure


for k = 1:size(All_Convergence_curves,1)
    
    semilogy(All_Convergence_curves(k,:))
    hold on
end

legend('GSA', 'CGSA1', 'CGSA2', 'CGSA3', 'CGSA4', 'CGSA5', 'CGSA6', 'CGSA7', 'CGSA8', 'CGSA9', 'CGSA10')

save resuls

