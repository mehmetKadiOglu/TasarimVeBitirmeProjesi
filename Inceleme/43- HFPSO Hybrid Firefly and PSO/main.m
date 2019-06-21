% new research cooperation are welcome with me :  berkanaydilek@harran.edu.tr

% please cite my article
% ibrahim Berkan Aydilek, 
% A hybrid firefly and particle swarm optimization algorithm for computationally expensive numerical problems,
% Applied Soft Computing, Volume 66, May 2018, Pages 232-249

% you need download for benchmark_func2017 http://web.mysites.ntu.edu.sg/epnsugan/PublicSite/Shared%20Documents/CEC-2017/Bound-Constrained/codes.rar and extract same folder

clear;
for func_no=1:30
   results(func_no,:) =hfpso_v2(50,30,1.49445,1.49445,-100,100,30,0.1,func_no,'benchmark_func2017');
end