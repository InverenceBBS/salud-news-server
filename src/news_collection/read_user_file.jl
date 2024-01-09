"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file(user_address)
    # str = some_read(user_address)
    # JSON.parse(str)
    body = String(HTTP.get(ENV["HEALTHMETADATAADDR"]).body)
    json = JSON.parse(body)
    kws = getindex.(json, ["value"])
    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>"https://en.wikipedia.org/wiki/Spain", 
                "languages"=>nothing,
                #"concepts"=>["https://es.wikipedia.org/wiki/Sistema_Nacional_de_Salud_(España)"],
                "sources"=>nothing
            ))
end
