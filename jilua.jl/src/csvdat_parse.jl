################################################################################
# Copyright© 2013-Now. SVAKSHA <https://github.com/svaksha> All Rights Reserved.
# License: AGPLv3 and later <http://www.gnu.org/licenses/agpl.html>
# Include the Copyright notice and this permission notice in all copies.
################################################################################
#
# USAGE: DownLoad data (CSV files)

using Base
using DataFrames

function download()
  parts = split_path(path)
  dirname = file_path(parts[1:(end - 1)])
  filename = paths[end]
end

function read_csvdata()
    @time a = readdlm("/input.csv", ',')
    @time b = readdlm("/input.csv", ',')
    println("Dimensions of a: ,dims(a)")
  # get array dimensions
  close(a)
  close(b)
end
