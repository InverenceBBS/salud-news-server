"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file(user_address)

    news_kws = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_kws")).body)
    json = JSON.parse(news_kws)
    kws = getindex.(json, ["value"])

    news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    json = JSON.parse(news_concepts)
    concepts = getindex.(json, ["value"])

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>"https://en.wikipedia.org/wiki/Spain", 
                "languages"=>nothing,
                "concepts"=>concepts,
                "sources"=>nothing
            ))
end
