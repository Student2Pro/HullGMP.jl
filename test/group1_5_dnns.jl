using HullGMP
using Test
using LazySets

dnn1 = read_nnet("nnet/dnn1.nnet")
dnn2 = read_nnet("nnet/dnn2.nnet")
dnn3 = read_nnet("nnet/dnn3.nnet")
dnn4 = read_nnet("nnet/dnn4.nnet")
dnn5 = read_nnet("nnet/dnn5.nnet")

delta = 0.1

solver1 = MaxSens(delta, true)

solver2 = HullReach(delta, true)

inputSet1 = Hyperrectangle(fill(0.5, 2), fill(0.5, 2))
inputSet2 = Hyperrectangle(fill(0.5, 3), fill(0.5, 3))
inputSet3 = Hyperrectangle(fill(0.5, 4), fill(0.5, 4))
inputSet4 = Hyperrectangle(fill(0.5, 5), fill(0.5, 5))
inputSet5 = Hyperrectangle(fill(0.5, 6), fill(0.5, 6))

output_center = fill(0.0, 2)
output_radius = fill(3.0, 2)
outputSet = Hyperrectangle(output_center, output_radius) #output constraint

problem1 = Problem(dnn1, inputSet1, outputSet)
problem2 = Problem(dnn2, inputSet2, outputSet)
problem3 = Problem(dnn3, inputSet3, outputSet)
problem4 = Problem(dnn4, inputSet4, outputSet)
problem5 = Problem(dnn5, inputSet5, outputSet)

file = open("group1_5_dnns.txt", "a")
print(file, "Test Result of group1_5_dnns:\n\n")

#solver11
time11 = 0
solve(solver1, problem1)
for i = 1:10
    timed_result =@timed solve(solver1, problem1)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time11 += timed_result.time
end
print(file, "dnn1 Average time: " * string(time11/10) * " s\n\n")

#solver12
time12 = 0
solve(solver1, problem2)
for i = 1:10
    timed_result =@timed solve(solver1, problem2)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time12 += timed_result.time
end
print(file, "dnn2 Average time: " * string(time12/10) * " s\n\n")

#solver13
time13 = 0
solve(solver1, problem3)
for i = 1:10
    timed_result =@timed solve(solver1, problem3)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time13 += timed_result.time
end
print(file, "dnn3 Average time: " * string(time13/10) * " s\n\n")

#solver14
time14 = 0
solve(solver1, problem4)
for i = 1:10
    timed_result =@timed solve(solver1, problem4)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time14 += timed_result.time
end
print(file, "dnn4 Average time: " * string(time14/10) * " s\n\n")

#solver15
time15 = 0
solve(solver1, problem5)
for i = 1:10
    timed_result =@timed solve(solver1, problem5)
    print(file, "MaxSens - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time15 += timed_result.time
end
print(file, "dnn5 Average time: " * string(time15/10) * " s\n\n")

#solver21
time21 = 0
solve(solver2, problem1)
for i = 1:10
    timed_result =@timed solve(solver2, problem1)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time21 += timed_result.time
end
print(file, "dnn1 Average time: " * string(time21/10) * " s\n\n")

#solver22
time22 = 0
solve(solver2, problem2)
for i = 1:10
    timed_result =@timed solve(solver2, problem2)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time22 += timed_result.time
end
print(file, "dnn2 Average time: " * string(time22/10) * " s\n\n")

#solver23
time23 = 0
solve(solver2, problem3)
for i = 1:10
    timed_result =@timed solve(solver2, problem3)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time23 += timed_result.time
end
print(file, "dnn3 Average time: " * string(time23/10) * " s\n\n")

#solver24
time24 = 0
solve(solver2, problem4)
for i = 1:10
    timed_result =@timed solve(solver2, problem4)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time24 += timed_result.time
end
print(file, "dnn4 Average time: " * string(time24/10) * " s\n\n")

#solver25
time25 = 0
solve(solver2, problem5)
for i = 1:10
    timed_result =@timed solve(solver2, problem5)
    print(file, "HullReach - test " * string(i) * " - Time: " * string(timed_result.time) * " s")
    print(file, " - Output: " * string(timed_result.value) * "\n")
    global time25 += timed_result.time
end
print(file, "dnn5 Average time: " * string(time25/10) * " s\n\n")

close(file)
