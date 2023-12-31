"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file(user_address)
    # str = some_read(user_address)
    # JSON.parse(str)
    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=>["Sistema Nacional de Salud"], 
                "locations"=>"https://en.wikipedia.org/wiki/Spain", 
                "languages"=>"spa",
                #"concepts"=>["https://es.wikipedia.org/wiki/Sistema_Nacional_de_Salud_(España)"],
                "sources"=>nothing
            ))
end