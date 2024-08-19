# this runs the server

# for now server will run on Oxygen
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


@get "/" function(req::HTTP.Request)
    return "HELLO WORLD!"
end

include("src/news_query.jl")

include("src/test_alive.jl")


@get "/collect_news_job" function(req::HTTP.Request)
    endpoint_dict = Dict("keyword"=>"/news_kws", #REPLACE WITH ENV["CONFIG_KEYWORD_TABLE"]
                  "concept"=>"/news_concept",
                  "source"=>"/news_sources",
                  "location"=>"https://en.wikipedia.org/wiki/Spain",
                  "news_db"=>db_conn(),
                  "news_table"=>ENV["NEWS_TABLE"])
    collect_news_job(endpoint_dict, read_user_file_location)
    collect_news_job(endpoint_dict, read_user_file_sources)
end



# title and version are required
info = Dict("title" => "Absolut News API", "version" => "0.1")
openApi = OpenAPI("3.0", info)
swagger_document = SwaggerMarkdown.build(openApi)
  
# merge the SwaggerMarkdown schema with the internal schema
mergeschema(swagger_document)

Oxygen.serve(; host="0.0.0.0", port = parse(Int, ARGS[1]))
