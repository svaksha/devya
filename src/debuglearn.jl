push!(LOAD_PATH, pwd())

#using TimerOutputs
using DebuggingUtilities

function foo()
    x = 5
    @showln x
    x = 7
    @showln x
    nothing
end  # function foo()

