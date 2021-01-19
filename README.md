# HullGMP

[![Build Status](https://travis-ci.com/Student2Pro/HullGMP.jl.svg?branch=master)](https://travis-ci.com/Student2Pro/HullGMP.jl)
[![Codecov](https://codecov.io/gh/Student2Pro/HullGMP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/Student2Pro/HullGMP.jl)

# HullGMP.jl

This library contains sourse codes used in the paper "Hull is all you need", including implementations of four methods to soundly verify deep neural networks: [MaxSens](https://github.com/Student2Pro/HullGMP.jl/blob/master/src/maxSens.jl),
[HullReach](https://github.com/Student2Pro/HullGMP.jl/blob/master/src/hullReach.jl), 
[SpeGuid](https://github.com/Student2Pro/HullGMP.jl/blob/master/src/speGuid.jl), 
and [HullSearch](https://github.com/Student2Pro/HullGMP.jl/blob/master/src/hullSearch.jl).
This library is based on https://github.com/sisl/NeuralVerification.jl.

## Installation
To download this library, clone it from the julia package manager like so:
```julia
(v1.5) pkg> add https://github.com/Student2Pro/HullGMP.jl
```

Please note that the implementations of the algorithms may not perform optimally.

## Example Usage

### Choose a solver
```julia
using HullGMP

solver = HullReach(0.1, true)
```
### Set up the problem
```julia
nnet = read_nnet("nnet/dnn1.nnet")
input_set  = Hyperrectangle(fill(0.5,2), fill(0.5,2))
output_set = Hyperrectangle(fill(0.0,2), fill(0.15,2))
problem = Problem(nnet, input_set, output_set)
```
### Solve
```julia
julia> result = solve(solver, problem)
BasicResult(:violated)

julia> result.status
:violated
```

The [nnet](https://github.com/Student2Pro/HullGMP.jl/tree/master/nnet) directory contains the DNNs we used in the experiment. The [plot_src](https://github.com/Student2Pro/HullGMP.jl/tree/master/plot_src) directory contains the MatLab source files of Figure 1 and Figure 2 in the paper. The [src](https://github.com/Student2Pro/HullGMP.jl/tree/master/src) directory contains the source files of our methods as well as the baseline methods. The [test](https://github.com/Student2Pro/HullGMP.jl/tree/master/test) directory contains the source files of figures and tables in the paper.
