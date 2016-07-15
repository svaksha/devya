using Base.Test
#using juhi

include("test_util.jl")
import Base: AnyDict

# does expression throw an exception of type extype.
@test_throws() ErrorException error("An Exception Error")

testnames = ["test_remote"
            ]

tests = isempty(ARGS) || ARGS == ["all"] ? testnames : ARGS

function runtests(name)
    println(" \033[1m*\033[0m \033[31m$(name)\033[0m")
    # support shell tab expansion
    endswith(name, ".jl") ? Core.include("$name") : Core.include("$name.jl")
    nothing
end


function propagate_errors(a, b)
    if isa(a,Exception)
        rethrow(a)
    end
    if isa(b,Exception)
        rethrow(b)
    end
    nothing
end

reduce(propagate_errors, nothing, map(runtests, tests))

println(" \033[32;1mSUCCESS\033[0m")
