#push!(LOAD_PATH, pwd())

#using TimerOutputs
using DebuggingUtilities


module debuglearn

function foo()
    x = 5
    println(time_showline, x)
    @showln x
    println(x)
    x = 7
    @showln x
    nothing
    println(x)
end

end
