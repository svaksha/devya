#!/usr/bin/julia
################################################################################
# FILE       : build.jl
# DESCRIPTION: Build script for the Julia dependencies.
# AUTHOR     : SVAKSHA, http://svaksha.com/pages/Bio
# SOURCE     : http://gitlab.com/svaksha/Holi.jl
# COPYRIGHT ©: 2016-Now SVAKSHA, All Rights Reserved.
# LICENSE    : GNU AGPLv3 and subject to meeting all the terms in the LICENSE 
#              file: https://gitlab.com/svaksha/Holi.jl/blob/master/LICENSE.md
# DATES      : Created:2016mar22 - Updated:2016mar22
################################################################################
#

using BinDeps  # Ref: https://github.com/JuliaLang/BinDeps.jl

@BinDeps.setup

@linux_only begin
    juhi = library_dependency("juhi", aliases = ["juhi"])
    provides(AptGet, "juhi", juhi)
end

# installer
@BinDeps.install [:juhi => :juhi]

