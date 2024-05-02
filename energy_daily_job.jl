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

endpoint_dict = Dict("keyword"=>"/energy_news_kws",
                  "concept"=>"/energy_news_kws",
                  "source"=>"/energy_news_sources",
                  "location"=>"https://en.wikipedia.org/wiki/Spain",
                  "news_db"=>ENV["NEWS_DB_URL"],
                  "news_table"=>ENV["ENERGYNEWSTABLENAME"])

collect_news_job(endpoint_dict, read_user_file_location)
collect_news_job(endpoint_dict, read_user_file_sources)