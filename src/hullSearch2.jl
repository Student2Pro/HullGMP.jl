#HullSearch2 count

@with_kw struct HullSearch2
    tolerance::Float64 = 1.0
end

# This is the main function
function solve(solver::HullSearch2, problem::Problem)
    input = problem.input
    stack = Vector{Hyperrectangle}(undef, 0)
    push!(stack, input)
    count = 1
    while !isempty(stack)
        interval = popfirst!(stack)
        reach = forward_network(solver, problem.network, interval)
        if issubset(reach, problem.output)
            continue
        else
            if get_largest_width(interval) > solver.tolerance
                sections = bisect(interval)
                for i in 1:2
                    if isborder(sections[i], problem.input)
                        push!(stack, sections[i])
                        count += 1
                    end
                end
            else
                println(count)
                return BasicResult(:unknown)
            end
        end
    end
    println(count)
    return BasicResult(:holds)
end

function forward_layer(solver::HullSearch2, L::Layer, input::Hyperrectangle)
    (W, b, act) = (L.weights, L.bias, L.activation)
    center = zeros(size(W, 1))
    gamma  = zeros(size(W, 1))
    for j in 1:size(W, 1)
        node = Node(W[j,:], b[j], act)
        center[j], gamma[j] = forward_node(solver, node, input)
    end
    return Hyperrectangle(center, gamma)
end

function forward_node(solver::HullSearch2, node::Node, input::Hyperrectangle)
    output    = node.w' * input.center + node.b
    deviation = sum(abs.(node.w) .* input.radius)
    βmax = node.act(output + deviation)
    βmin = node.act(output - deviation)
    return ((βmax + βmin)/2, (βmax - βmin)/2)
end
