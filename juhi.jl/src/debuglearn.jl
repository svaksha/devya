push!(LOAD_PATH, pwd())
#isdefined(Main, :__precompile__) && __precompile__(true)

using Base
using DebuggingUtilities
#include("juhi.jl")

module debuglearn
export foo
function foo()
    x = 5
    @showln x
    x = 7
    @show x
    nothing
end  # function foo()
end  # module debuglearn
