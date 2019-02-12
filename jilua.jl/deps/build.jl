#!/usr/bin/julia
############################# METADATA #########################################
# FILE+DESC : build.jl, Build script for the Julia dependencies.
# AUTHOR+CR©: SVAKSHA, 2016-Present, ARR.
# DVCS      : http://github.com/svaksha/devya/devya.jl
# LICENSE   : GNU AGPLv3 with terms stated in the LICENSE.md file.
# DATE+VER  : 2016mar22, Ver.16.03
############################# METADATA #########################################
#

using BinDeps  # Ref: https://github.com/JuliaLang/BinDeps.jl

@BinDeps.setup

@linux_only begin
    devya = library_dependency("devya", aliases = ["devya"])
    provides(AptGet, "devya", devya)
end

# installer
@BinDeps.install [:devya => :devya]

