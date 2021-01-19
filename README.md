# HullGMP

[![Build Status](https://travis-ci.com/Student2Pro/HullGMP.jl.svg?branch=master)](https://travis-ci.com/Student2Pro/HullGMP.jl)
[![Codecov](https://codecov.io/gh/Student2Pro/HullGMP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/Student2Pro/HullGMP.jl)

# HullGMP.jl

This library contains sourse codes used in the paper "Hull is all you need", including implementations of four methods to soundly verify deep neural networks: MaxSens, HullReach, SpeGuid, and HullSearch.
This library is based on https://github.com/sisl/NeuralVerification.jl.

## Installation
To download this library, clone it from the julia package manager like so:
```julia
(v1.3) pkg> add https://github.com/Student2Pro/HullGMP.jl
```

Please note that the implementations of the algorithms may not perform optimally.

## Example Usage

Create and edit a .jl file, for example, https://github.com/Student2Pro/HullGMP.jl/blob/master/test/group1_dnn1.jl, which also contains the experiments settings in the paper.

Then run it using julia client.
