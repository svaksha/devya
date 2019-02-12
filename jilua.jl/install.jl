################################################################################
# FILE      : install.jl
# DESC.     : An installation file for the jilua.jl
# AUTHOR    : SVAKSHA, http://svaksha.com/pages/BIO
# SOURCE    : http://gitlab.com/svaksha/jilua.jl
# COPYRIGHT©: 2016-Now SVAKSHA, All Rights Reserved.
# LICENSE   : GNU AGPLv3 and subject to meeting all the terms in the LICENSE
#             file: https://gitlab.com/svaksha/jilua.jl/blob/master/LICENSE.md
# DATES     : Created:2016apr08 - Updated:2016apr09
################################################################################
#

Pkg.add("ArgParse")
Pkg.add("Debug")"
Pkg.add("HTTPClient")
Pkg.add("HttpCommon")
Pkg.add("JSON")
Pkg.add("LibGit2")
Pkg.add("Requests")
Pkg.add("TimerOutputs")

# juhi is not in METADATA as yet, so clone it
#-------------------------------------------------------------------------------
try 
    Pkg.clone("https://gitlab.com/svaksha/jilua.jl.git")
catch
end

Pkg.update()

# Load the .juliarc file
#-------------------------------------------------------------------------------
if !isfile(joinpath(homedir(), ".juliarc.jl"))
  fid = open(joinpath(homedir(), ".juliarc.jl"), "w")
  write(fid, "push!(LOAD_PATH, pwd())\n")
  close(fid)
else
  load_path = false
  fid = open(joinpath(homedir(), ".juliarc.jl"), "r")
  while !eof(fid)
    line = readline(fid)
    if contains(line, "LOAD_PATH, pwd())")
      load_path = true
    end
  end
  close(fid)

  if load_path == false
    fid = open(joinpath(homedir(), ".juliarc.jl"), "a")
    write(fid, "push!(LOAD_PATH, pwd())\n")
    close(fid)
  end
end


