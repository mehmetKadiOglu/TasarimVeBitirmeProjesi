
Moth Search (MS) Algorithm

Gai-Ge Wang
September 5, 2016

Email:  gaigewang@gmail.com 
            gaigewang@163.com

The files in this zip archive are MATLAB m-files that can be used to study Moth Search (MS) algorithm.

MS is the method that we invented and wrote about in the following paper:
Gai-Ge Wang, Moth search algorithm: a bio-inspired metaheuristic algorithm for global optimization problems.
Memetic Computing
DOI: 10.1007/s12293-016-0212-3
http://rd.springer.com/article/10.1007%2Fs12293-016-0212-3 

Note: 
1) I do not make any effort to rewrite some general codes, while I reuse some codes according to Prof. Dan Simon. We should stand the shoulder of giant, therefore I have more time to focus on our method-MS. In the following, I will provide the detailed description about all the codes. 
2) The MATLB R2015a is used when implementing our method. 
3) The C++ code of Moth Search (MS) can be found in the web soon.
4) As discussed in the paper, the MS like any other metaheuristic algorithms cannot find the best solution for each run. However, our research team will improve it and distribute the codes in our future research. 

The MATLAB files can be used to reproduce the results in the paper, or to do your own experiments. The paper and the software are available at web soon. The software is freely available for any purposes (it is on the Internet, after all) although I would of course appreciate an acknowledgement if you use it as part of a paper or presentation.

The MATLAB files and their descriptions are as follows:

Ackley.m: 
This is the benchmark functions discussed in the paper. You can use it as template to write your own function if you are interested in testing or optimizing some other functions. This code is modified according to Dan Simon. The original one is available at http://academic.csuohio.edu/simond/bbo.

MS_Generation_V2.m, MS_FEs_V2.m:
Elephant Herding Optimization (MS) algorithm. The fixed generations (iterations) and fixed Function Evaluations (FEs) are considered as termination condition for MS_Generation_V1.m and MS_FEs_V1.m, respectively. It can be used to optimize some function by typing, for example, the following at the MATLAB prompt:
>> MS_Generation_V2(@Ackley);
This command would run MS_Generation_V1 on the Ackley function (which is codified in Ackley). 
>> MS_FEs_V2(@Ackley);
This command would run MS_FEs_V1 on the Ackley function (which is codified in Ackley). 

Init.m: 
This contains various initialization settings for the optimization methods. You can edit this file to change the population size, the generation count limit, the problem dimension, the maximum Function Evaluations (FEs), and the percentage of population of any of the optimization methods that you want to run. This code is modified according to Dan Simon. The original one is available at http://academic.csuohio.edu/simond/bbo.

ClearDups.m: 
This is used by each optimization method to get rid of duplicate population members and replace them with randomly generated individuals. This code is modified according to Dan Simon. The original one is available at http://academic.csuohio.edu/simond/bbo.

ComputeAveCost.m: 
This is used by each optimization method to compute the average cost of the population and to count the number of legal (feasible) individuals. This code is the same as Dan Simon. The original one are available at http://academic.csuohio.edu/simond/bbo.

PopSort.m: 
This is used by each optimization method to sort population members from most fit to least fit. This code is the same with Dan Simon. The original one is available at http://academic.csuohio.edu/simond/bbo. 

Conclude1.m, Conclude2.m: 
They conclude the processing of each optimization method. It does common processing like outputting results. Conclude1.m and Conclude2.m are used in MS_Generation_V1.m and MS_FEs_V1.m, respectively. They are modified according to Dan Simon. The original one is available at http://academic.csuohio.edu/simond/bbo.

I hope that this software is as interesting and useful to you as is to me. Feel free to contact me with any comments or questions.


