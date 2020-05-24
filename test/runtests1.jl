using HullGMP
using Test
using LazySets
import HullGMP: ReLU

@testset "HullGMP.jl" begin
    nnet = read_nnet("nnet/toy_nnet.nnet", last_layer_activation = ReLU())

    solver = MaxSens(0.0005, true)

    center = [1.0, 1.0]
    radius = [1.0, 1.0]

    in_hyper = Hyperrectangle(center, radius)

    lower = [0.0, 0.0]
    upper = [1.6, 2.1]

    out_hyper = Hyperrectangle(low=lower, high=upper)

    problem = Problem(nnet, in_hyper, out_hyper)

    result = solve(solver, problem)

    @test result.status == :holds
end
