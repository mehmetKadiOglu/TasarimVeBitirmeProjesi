function [bestSolution, bestFitness, iteration]=...
    efoCase2(fhd, dimension, maxFe, lowerBand, upperBand, varargin)

if strcmp(func2str(fhd), 'benchmarks')
    [lowerBand, upperBand] = terminate(varargin{:});
end
%----------------------------------------------------------------------------------
% Deðer Atamasý
N_var = dimension;
minval = lowerBand;
maxval = upperBand;
Max_gen = maxFe;
N_emp = 50;
R_rate=0.3;
Ps_rate=0.2;
P_field=0.1;
N_field=0.45;
%----------------------------------------------------------------------------------

phi = (1 + sqrt(5))/2;%golden ratio
%initializatin
em_pop = minval + (maxval - minval) .* rand(N_emp, N_var);
%fit= cec14_func(em_pop(1:N_emp,1:N_var)',problemIndex);
fit = testFunction(em_pop(1:N_emp,1:N_var)', fhd, varargin{:} );
em_pop = [em_pop(:,1:N_var) fit'];
em_pop = sortpop(em_pop,N_var+1);
%random vectors (this is to increase the calculation speed instead of
%determining the random values in each iteration we allocate them in the
%beginning before algorithm start
r_index1 = randi([1 (round(N_emp.* P_field))],[N_var Max_gen]); %random particles from positive field
r_index2 = randi([(round(N_emp.*(1-N_field))) N_emp],[N_var Max_gen]); %random particles from negative field
r_index3 = randi([(round(N_emp.* P_field)+1) (round(N_emp.*(1-N_field))-1)],[N_var Max_gen]);%random particles from neutral field
ps= rand(N_var,Max_gen);%= probability of selecting electromagnets of generated particle from the positive field
r_force = rand(1,Max_gen);%random force in each generation
rp = rand(1,Max_gen);%some random numbers for checking randomness probability in each generation
randomization = rand(1,Max_gen);%coefficient of randomization when generated electro magnet is out of boundary
RI=1;%index of the electromagnet (variable) which is going to be initialized by random number
generation=N_emp;
new_emp = zeros(1,N_var+1); %temporary array to store generated particle 
while (generation <= Max_gen)
    % Senaryo 1
    % row_index = divDistIndex(em_pop, fit);
    
    % Senaryo 3, Senaryo 1 ile alakalý.
    % row_index = divDistIndex( em_pop(1:round(N_emp.* P_field), :), fit(1, 1:round(N_emp .* P_field)));
    row_index = divDistIndex( em_pop(round(N_emp.*(1-N_field)):N_emp, :), fit(1, round(N_emp.*(1-N_field)):N_emp));
    % row_index = divDistIndex( em_pop(round(N_emp.* P_field)+1:round(N_emp.*(1-N_field))-1, :), fit(1, round(N_emp.* P_field)+1:round(N_emp.*(1-N_field))-1));
    % Senaryo 3
    
    r = r_force(1,generation);
    for i=1:N_var
        
        % --------------------- Senaryo 1 --------------------- %
        if (rand() > 0.8)
           % r_index1(i, generation) = row_index;
           r_index2(i, generation) = row_index;
           % r_index3(i, generation) = row_index;
        end
        % --------------------- Senaryo 1 --------------------- %
        
        if (ps(i,generation) > Ps_rate)
            new_emp(i) = em_pop(r_index3(i,generation), i) + phi * r * (em_pop(r_index1(i,generation), i) - em_pop(r_index3(i,generation), i)) + r * (em_pop(r_index3(i,generation), i) - em_pop(r_index2(i,generation), i));
        else
            new_emp(i) = em_pop (r_index1(i,generation), i);
        end
        
        %checking whether the generated number is inside boundary or not
        if ( new_emp(i) >= maxval || new_emp(i) <= minval )
            new_emp(i) = minval + (maxval - minval) .* randomization(1, generation);
        end
    end
    %replacement of one electromagnet of generated particle with a random number (only for
    %some generated particles) to bring diversity to the population
    if ( rp(1,generation) < R_rate)
        new_emp(RI) = minval + (maxval - minval) .* randomization(1, generation);

        RI=RI+1;
        if (RI > N_var)
            RI=1;
        end
    end
    
    new_emp(N_var+1) = testFunction(new_emp(1:N_var)', fhd, varargin{:});
    %updating the population if the fitness of the generated particle is better than worst fitness in
    %the population (because the population is sorted by fitness, the last particle is the worst)
    if ( new_emp(N_var+1) < em_pop(N_emp , N_var+1) )
        position=find(em_pop(:,N_var+1) > new_emp(N_var+1));
        em_pop=insert_in_pop(em_pop,new_emp,position(1));
    end
    generation=generation+1;
end
%besterr=em_pop(1,N_var+1)-(problemIndex.*100);
bestSolution = em_pop(1,:);
bestFitness = em_pop(1, N_var+1);
iteration = generation;
end