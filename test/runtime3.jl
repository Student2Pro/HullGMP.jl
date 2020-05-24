#SGSV, Specification-Guided Safety Verification
using HullReachNV
using Test
using LazySets
import HullReachNV: ReLU

nnet = read_nnet("nnet/test10.nnet")
solver = SpeGuid(1.0)

center = fill(5.0, 10)
radius = fill(5.0, 10)
inputSet = Hyperrectangle(center, radius)

output_center = fill(0.0, 10)
output_radius = fill(45.0, 10)
outputSet = Hyperrectangle(output_center, output_radius)

#[0.09, 0.63, -0.19, 0.32, -0.24, -0.16, 0.31, 0.13, -0.4, -0.14]
#[40.19, 35.24, 31.87, 30.54, 38.87, 46.94, 32.28, 29.03, 27.38, 32.45]

problem = Problem(nnet, inputSet, outputSet)

timed_result =@timed solve(solver, problem)

print("SpeGuid - test")
print(" - Time: " * string(timed_result[2]) * " s")
print(" - Output: ")
print(timed_result[1].status)
print("\n")
