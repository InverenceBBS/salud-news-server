using Oxygen
using SwaggerMarkdown
using HTTP
using Dates
# think about adding Umbrella for authentication
#using Umbrella
using IOM_newsAPI_query
using LibPQ
using DataFrames
using JSON
using CSV
using TimeZones


#  Variable  Type  Description  Example 
#  --------  ----  ------------------  --- 
include("src/news_collection/format_result.jl")
include("src/news_collection/read_user_file.jl")
include("src/news_collection/write_formatted.jl")
include("src/news_collection/db_conn.jl")

include("src/collect_news_job.jl")
collect_news_job("","")