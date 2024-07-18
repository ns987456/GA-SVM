function [X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = geneticoptimizationmod
close all
close all hidden
%%Fitness function
fitnessFunction = @geneticpatternmod;
%%Number of Variables
nvars =1069 ;
%Linear inequality constraints
Aineq = [];
Bineq = [];
%Linear equality constraints
Aeq = [];
Beq = [];
%Bounds
LB=zeros(1,1069);
UB =ones(1,1069);
%Nonlinear constraints:
nonlconFunction = [];
%Start with default options
options = gaoptimset;
%%Modify some parameters
%mat=[ 0     0     1     1     0     1     1     0     1     0     0     1     1     1     0     1     1     0     1     1     1     0     0     1     0    1     0     0     1     0     0     0     0     1     1     1     1     1     1];

options = gaoptimset(options,'PopulationType' ,'doubleVector');       

options = gaoptimset(options,'PopulationSize' ,5);  
% 
 options = gaoptimset(options,'EliteCount' ,1);   

options = gaoptimset(options,'CrossoverFraction' ,0.8000); 

options = gaoptimset(options,'TimeLimit' ,1000);

options = gaoptimset(options,'Generations',20);

options = gaoptimset(options,'FitnessLimit' , -Inf);      

options = gaoptimset(options,'StallGenLimit' , 5);  

options = gaoptimset(options,'StallTimeLimit' , 1000);  

options = gaoptimset(options,'TolFun' , 1.0000e-006);  

options = gaoptimset(options,'TolCon' , 1.0000e-006);    

%options = gaoptimset(options,'InitialPopulation' ,mat); 
                    
options = gaoptimset(options,'PlotInterval' , 1);  

options = gaoptimset(options,'CreationFcn' , @gacreationuniform); 

options = gaoptimset(options,'FitnessScalingFcn' , @fitscalingrank); 

options = gaoptimset(options,'SelectionFcn' , @selectionstochunif); 

options = gaoptimset(options,'CrossoverFcn' , @crossoverscattered); 

options = gaoptimset(options,'MutationFcn' ,@mutationadaptfeasible);
options = gaoptimset(options,'Display' ,'off'); 

options = gaoptimset(options,'PlotFcns' , { @gaplotbestf @gaplotbestindiv @gaplotscores  });


% run GA
[X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = ga(fitnessFunction,nvars,Aineq,Bineq,Aeq,Beq,LB,UB,nonlconFunction,options);
% Displaying results

disp ('Values of optimized parameters: ');
temp = approx_quantization(X); 
disp (temp);

