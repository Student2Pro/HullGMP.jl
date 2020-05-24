using HullGMP
using Test
using LazySets

@testset "HullGMP.jl" begin
    center = fill(5.0, 10)
    radius = fill(5.0, 10)
    nnet = read_nnet("nnet/test10.nnet")
    solver = MaxSens(1.0, false)
    inputSet = Hyperrectangle(center, radius)
    output_center = fill(0.0, 10)
    output_radius = fill(45.0, 10)
    outputSet = Hyperrectangle(output_center, output_radius)
    problem = Problem(nnet, inputSet, outputSet)
    result = solve(solver, problem)
    @test result.status == :holds
end
