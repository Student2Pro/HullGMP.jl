using Base.Threads

function f(x::Float64)
    c = Channel{Float64}(64)
    put!(c, x)
    remain = 1
    count = 0
    result = true
    while remain != 0
        #println("while loop begin")
        m = 0
        try
            m = take!(c)
        catch
            break
        end
        count += 1
        #println("$(count): $(remain) - $(m)")
        @async begin
            #println("Task start")
            n = m / 2
            if n < 0.5
                remain -= 1
            elseif n > 1
                put!(c, n)
                put!(c, n)
                remain += 1
            else
                close(c)
                result = false
                #println(result)
            end
            #println("Task end")
        end
        #println("while loop end")
    end
    return result
end

r = f(19.0)
