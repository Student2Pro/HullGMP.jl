#MaxSens
using HullGMP
using LazySets
import HullGMP: ReLU

nnet = read_nnet("nnet/toy_nnet.nnet", last_layer_activation = ReLU())
solver = HullSearch1(0.001)
center = [1.0, 1.0]
radius = [1.0, 1.0]
in_hyper = Hyperrectangle(center, radius)
lower = [0.0, 0.0]
upper = [1.2, 1.7]
out_hyper = Hyperrectangle(low=lower, high=upper)
problem = Problem(nnet, in_hyper, out_hyper)
timed_result =@timed solve(solver, problem)
print("HullSearch1 - test")
print(" - Time: " * string(timed_result[2]) * " s")
print(" - Output: ")
print(timed_result[1].status)
print("\n")
