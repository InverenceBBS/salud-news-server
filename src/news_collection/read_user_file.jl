"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file_location()

    news_kws = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_kws")).body)
    json = JSON.parse(news_kws)
    kws = getindex.(json, ["value"])

    news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])


    news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>nothing, 
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
function read_user_file_sources()

    news_kws = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_kws")).body)
    json = JSON.parse(news_kws)
    kws = getindex.(json, ["value"])

    news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>nothing, 
                "languages"=>nothing,
                "concepts"=>concepts,
                "sources"=>["elpais.com", "elespanol.com", "eldiario.es", "elmundo.com", "larazon.es", "elconfidencial.com"]
            ))
end