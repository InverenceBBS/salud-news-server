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


#  Variable  Type  Description  Example 
#  --------  ----  ------------------  --- 
include("src/news_collection/format_result.jl")
include("src/news_collection/read_user_file.jl")
include("src/news_collection/write_formatted.jl")



@get "/" function(req::HTTP.Request)
    return "HELLO WORLD!"
end

include("src/news_query.jl")

include("src/test_alive.jl")

# title and version are required
info = Dict("title" => "Absolut News API", "version" => "0.1")
openApi = OpenAPI("3.0", info)
swagger_document = build(openApi)
  
# merge the SwaggerMarkdown schema with the internal schema
mergeschema(swagger_document)

Oxygen.serve(; host="0.0.0.0", port = parse(Int, ARGS[1]))
