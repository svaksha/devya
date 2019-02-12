push!(LOAD_PATH, pwd())

using TimerOutputs
using Debug
using DebuggingUtilities

module ScrapeJiluajl

function scrape_md(filename)
@debug
    # get the category, don't process some files
    category = split(split(filename, "/")[end], ".")[1]
    category in ("LICENSE", "README") && return []

    subcategory = ""
    records = NTuple{5,UTF8String}[]
    @showln records
    
    # process the lines
    f = open(filename)
    for l in eachline(f)

        l = strip(l)
        if length(l) == 0
            continue

        # handle subcategories
        elseif l[1] == '#'
            subcategory = join(split(l)[2:end])

        # collect repo info
        elseif l[1] == '+'
            tmp = split(l, " :: ")
            repotuple = split(tmp[1], "](")
            length(repotuple) == 2 || continue
            reponame = repotuple[1][4:end]
            repourl = repotuple[2][1:end-1]
            length(repourl) > 4 || continue
            repourl[1:4] == "http" || continue
            desc = length(tmp) > 1 ? join(tmp[2:end]...) : ""
            push!(records, (category, subcategory, reponame, repourl, desc))
        end
    end
    close(f)
    println("Processed $(length(records)) records in category $category.")
    records
end

# -----------------------------------------------------------------

import Glob: glob
const _dir = joinpath(relpath(Base.source_dir()), "..")

# loop over all markdown files in the root directory, appending the records to the list
records = []
for filename in glob(joinpath(_dir, "*.md"))
    append!(records, scrape_md(filename))
end

# save a csv file
println("Writing out $(length(records)) records.")
f = open(joinpath(_dir, "db.csv"), "w")
for record in records
    write(f, join(record, ","))
    write(f, "\n")
end
close(f)

end # module Scrapejuhijl

# TIMER

const to = TimerOutput()
@timeit to "sleep" sleep(0.2)
rands() = for i in 1:10^7 rand() end
rand_vals = @timeit to "randoms" rands()
scrape_md_time = @timeit to "randoms" scrape_md()

# Time a multi statement block
b = @timeit to "multi statements" begin
    sleep(0.2)
    rands()
    scrape_md_time
    5
end
# Call to a previously used label adds to that timer and call counter
@timeit to "sleep" sleep(0.3)
println(to)
println(@__FILE__)

