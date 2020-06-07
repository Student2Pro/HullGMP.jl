using HullGMP
using LazySets
import HullGMP: forward_network

nnet = read_nnet("nnet/test6.nnet")
center = fill(5.0, 6)
radius = fill(5.0, 6)
input = Hyperrectangle(center, radius)

solver = MaxSens(10.0, true)
reach = forward_network(solver, nnet, input)
println(reach)
