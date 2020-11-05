#Example
using HullGMP
using Test
using LazySets

nnet = read_nnet("nnet/test2.nnet") 
#test2.nnet, test4.nnet, test6.nnet, test8.nnet are DNNs used in the experiments of the paper
solver = MaxSens(5.0, false) #or SpeGuid(1.0), for example.
#verification algorithms used in the experiments of the paper, which are MaxSens, HullReach, SpeGuid and HullSearch.
#Note that SpeGuid2 and HullSearch2 will output the number of hyper-rectangles whose output reachable set calculated by verification algorithms,
#i.e., Num. in figures of the paper.

center = fill(5.0, 2) # a 2-dimensional vector filled by 5.0
radius = fill(5.0, 2)
inputSet = Hyperrectangle(center, radius)

output_center = fill(0.0, 2)
output_radius = fill(45.0, 2)
outputSet = Hyperrectangle(output_center, output_radius) #output constraint

problem = Problem(nnet, inputSet, outputSet)

timed_result =@timed solve(solver, problem)
print("MaxSens - test")
print(" - Time: " * string(timed_result[2]) * " s") #running time
print(" - Output: ")
print(timed_result[1].status) #robust or not
print("\n")

#Experiment Settings
#test2.nnet inputSet = Hyperrectangle(fill(5.0, 2), fill(5.0, 2))
#we use 4 \delta: 1.0, 0.1, 0.01, 0.001
#and 5 different output constraint:
#Hyperrectangle([0.0 7.0], fill(13.0, 2)) 4 \delta used in Figure 2 in the paper, \delta = 1.0 used in Figure 5, group 1 in the paper
#Hyperrectangle([0.0 7.0], fill(11.0, 2))
#Hyperrectangle([0.0 7.0], fill(9.0, 2))
#Hyperrectangle([0.0 7.0], fill(7.0, 2))
#Hyperrectangle([0.0 7.0], fill(5.0, 2))
#20 experiments total

#test4.nnet inputSet = Hyperrectangle(fill(5.0, 4), fill(5.0, 4))
#we use 3 \delta: 1.0, 0.5, 0.1
#and 5 different output constraint:
#Hyperrectangle(fill(0.0, 4), fill(2.0, 4))
#Hyperrectangle(fill(0.0, 4), fill(1.8, 4))
#Hyperrectangle(fill(0.0, 4), fill(1.6, 4)) 3 \delta used in Figure 3 in the paper, \delta = 1.0 used in Figure 5, group 2 in the paper
#Hyperrectangle(fill(0.0, 4), fill(1.4, 4))
#Hyperrectangle(fill(0.0, 4), fill(1.2, 4))
#15 experiments total

#test6.nnet inputSet = Hyperrectangle(fill(5.0, 6), fill(5.0, 6))
#we use 1 \delta: 1.0
#and 5 different output constraint:
#Hyperrectangle(fill(0.0, 6), fill(1.4, 6)) used in Figure 5, group 3 in the paper
#Hyperrectangle(fill(0.0, 6), fill(1.3, 6))
#Hyperrectangle(fill(0.0, 6), fill(1.2, 6))
#Hyperrectangle(fill(0.0, 6), fill(1.1, 6))
#Hyperrectangle(fill(0.0, 6), fill(1.0, 6))
#5 experiments total

#test8.nnet inputSet = Hyperrectangle(fill(5.0, 8), fill(5.0, 8))
#we use 1 \delta: 1.0
#and 5 different output constraint:
#Hyperrectangle(fill(0.0, 8), fill(2.4, 8)) used in Figure 5, group 4 in the paper
#Hyperrectangle(fill(0.0, 8), fill(2.3, 8))
#Hyperrectangle(fill(0.0, 8), fill(2.2, 8))
#Hyperrectangle(fill(0.0, 8), fill(2.1, 8))
#Hyperrectangle(fill(0.0, 8), fill(2.0, 8))
#5 experiments total
