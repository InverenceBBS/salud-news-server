# warmup file to speed up execution when server restarts
# should include all defined function (called with concrete types)
using Pkg
using Dates
using IOM_newsAPI_query

## news_query
warmup_dictionary = Dict(
    "days" => "2",
    "kw" => "some funny words",
    "date" => "y2023m09d09"
)

get(warmup_dictionary, "kw", nothing)
tryparse(Int,get(warmup_dictionary, "days", "5"))
Date(get(warmup_dictionary, "date", nothing),dateformat"\yy\mm\dd")
