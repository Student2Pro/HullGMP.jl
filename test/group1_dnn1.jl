using HullGMP
using Test
using LazySets

nnet = read_nnet("nnet/dnn1.nnet")

delta1 = 0.1
delta2 = 0.05
delta3 = 0.025
delta4 = 0.0125
delta5 = 0.00625

solver11 = MaxSens(delta1, true)
solver12 = MaxSens(delta2, true)
solver13 = MaxSens(delta3, true)
solver14 = MaxSens(delta4, true)
solver15 = MaxSens(delta5, true)

solver21 = HullReach(delta1, true)
solver22 = HullReach(delta2, true)
solver23 = HullReach(delta3, true)
solver24 = HullReach(delta4, true)
solver25 = HullReach(delta5, true)



center = fill(0.5, 2) # a 2-dimensional vector filled by 5.0
radius = fill(0.5, 2)
inputSet = Hyperrectangle(center, radius)

output_center = fill(0.0, 2)
output_radius = fill(0.15, 2)
outputSet = Hyperrectangle(output_center, output_radius) #output constraint

problem = Problem(nnet, inputSet, outputSet)

file = open("group1_dnn1.txt", "a")
print(file, "Test Result of group1_dnn1:\n\n")

#solver11
time11 = 0
solve(solver11, problem)
for i = 1:10
    timed_result =@timed solve(solver11, problem)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time11 += timed_result.time
end
print(file, "delta = $(delta1). Average time: " * string(time11/10) * " s\n\n")

#solver12
time12 = 0
solve(solver12, problem)
for i = 1:10
    timed_result =@timed solve(solver12, problem)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time12 += timed_result.time
end
print(file, "delta = $(delta2). Average time: " * string(time12/10) * " s\n\n")

#solver13
time13 = 0
solve(solver13, problem)
for i = 1:10
    timed_result =@timed solve(solver13, problem)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time13 += timed_result.time
end
print(file, "delta = $(delta3). Average time: " * string(time13/10) * " s\n\n")

#solver14
time14 = 0
solve(solver14, problem)
for i = 1:10
    timed_result =@timed solve(solver14, problem)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time14 += timed_result.time
end
print(file, "delta = $(delta4). Average time: " * string(time14/10) * " s\n\n")

#solver15
time15 = 0
solve(solver15, problem)
for i = 1:10
    timed_result =@timed solve(solver15, problem)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time15 += timed_result.time
end
print(file, "delta = $(delta5). Average time: " * string(time15/10) * " s\n\n")

#solver21
time21 = 0
solve(solver21, problem)
for i = 1:10
    timed_result =@timed solve(solver21, problem)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time21 += timed_result.time
end
print(file, "delta = $(delta1). Average time: " * string(time21/10) * " s\n\n")

#solver22
time22 = 0
solve(solver22, problem)
for i = 1:10
    timed_result =@timed solve(solver22, problem)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time22 += timed_result.time
end
print(file, "delta = $(delta2). Average time: " * string(time22/10) * " s\n\n")

#solver23
time23 = 0
solve(solver23, problem)
for i = 1:10
    timed_result =@timed solve(solver23, problem)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time23 += timed_result.time
end
print(file, "delta = $(delta3). Average time: " * string(time23/10) * " s\n\n")

#solver24
time24 = 0
solve(solver24, problem)
for i = 1:10
    timed_result =@timed solve(solver24, problem)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time24 += timed_result.time
end
print(file, "delta = $(delta4). Average time: " * string(time24/10) * " s\n\n")

#solver25
time25 = 0
solve(solver25, problem)
for i = 1:10
    timed_result =@timed solve(solver25, problem)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time25 += timed_result.time
end
print(file, "delta = $(delta5). Average time: " * string(time25/10) * " s\n\n")

close(file)
