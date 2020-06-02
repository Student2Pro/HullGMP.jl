using SharedArrays, Distributed

function f(x::Int64)
    while nprocs() < 4
        addprocs()
    end
    @everywhere
    println(nprocs())
    s = RemoteChannel(()->Channel{Int}(64))
    put!(s, x)
    r = SharedArray{Int64}(3)
    r = [1, 1, 0] #remain, count, result
    wp = WorkerPool(workers())
    println(wp)
    while r[1] != 0
        println("while loop start")
        if r[3] == 1
            return false
        else
            if isready(s)
                println("calling g:")
                @spawn g(r, s)
                #remote_do(g, wp, r, s)
            end
        end
        println("while loop end")
    end
    return true
end

@everywhere function g(r::SharedArray, s::RemoteChannel)
    print("function g start:")
    n = take!(s)
    r[2] += 1
    if n == 1
        r[1] -= 1
    elseif n > 2
        m = ceil(Int, n/2)
        put!(s, m)
        put!(s, n-m)
        r[1] += 1
    else
        r[1] -= 1
        r[3] = 1
    end
    print("$(myid()) - $(r)\n")
end

@everywhere function g2(r::SharedArray, s::RemoteChannel)
    print("function g start:")
    n = take!(s)
    r[2] += 1
    if n == 1
        r[1] -= 1
    elseif n > 2
        m = ceil(Int, n/2)
        put!(s, m)
        put!(s, n-m)
        r[1] += 1
    else
        r[1] -= 1
        r[3] = 1
    end
    print("$(myid()) - $(r)\n")
end

f(12)
