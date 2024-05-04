"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file_location(endpoint_dict)

    news_kws = String(HTTP.get(string(ENV["METADATAADDR"],endpoint_dict["keyword"])).body)
    json = JSON.parse(news_kws)
    kws = getindex.(json, ["value"])

    news_concepts = String(HTTP.get(string(ENV["METADATAADDR"],endpoint_dict["concept"])).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>endpoint_dict["location"], 
                "languages"=>nothing,
                "concepts"=>concepts,
                "concepts"=>concepts,
                "sources"=>nothing
            ))
end


"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file_sources(endpoint_dict)

    news_kws = String(HTTP.get(string(ENV["METADATAADDR"],endpoint_dict["keyword"])).body)
    json = JSON.parse(news_kws)
    kws = getindex.(json, ["value"])

    news_concepts = String(HTTP.get(string(ENV["METADATAADDR"],endpoint_dict["concept"])).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])

    news_sources = String(HTTP.get(string(ENV["METADATAADDR"],endpoint_dict["source"])).body)
    json = JSON.parse(news_sources)
    sources = getindex.(json, ["value"])

    sources = replace.(replace.(sources, "http://"=>""), "/"=>"")

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>nothing, 
                "languages"=>nothing,
                "concepts"=>concepts,
                "sources"=>sources
            ))
end