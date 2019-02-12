push!(LOAD_PATH, pwd())
using Base
import Base.stat
using DebuggingUtilities

module stats
export stats
function stats(x)
  m::Int64 
  n::Int64
  s::Int64
  n = length(x)
  m = sum(x)/n
  s = sqrt(sum((x-m).^2/n))
  return m, s
  @showln m, s
end
end # module stats
