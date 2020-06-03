using HullGMP
using LazySets
import HullGMP: ReLU, Layer

nnet = read_nnet("nnet/test10.nnet")

function forward_network(nnet::Network, input::Vector)
    reach = input
    for layer in nnet.layers
        reach = forward_layer(layer, reach)
    end
    return reach
end

function forward_layer(L::Layer, input::Vector)
    (W, b, act) = (L.weights, L.bias, L.activation)
    return act.(W * input .+ b)
end

input = fill(5.0, 10)
output = forward_network(nnet, input)
println(output)
