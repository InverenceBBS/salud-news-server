"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file_location(endpoint_dict)

    kws = Vector{String}(DataFrame(execute(LibPQ.Connection(db_conn()), "Select keyword from news_kws")).keyword)

    concepts = Vector{String}(DataFrame(execute(LibPQ.Connection(db_conn()), "Select concept from news_concepts")).concept)

    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>endpoint_dict["location"], 
                "languages"=>nothing,
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
    
    kws = Vector{String}(DataFrame(execute(LibPQ.Connection(db_conn()), "Select keyword from news_kws")).keyword)

    concepts = Vector{String}(DataFrame(execute(LibPQ.Connection(db_conn()), "Select concept from news_concepts")).concept)

    sources = Vector{String}(DataFrame(execute(LibPQ.Connection(db_conn()), "Select source from news_sources")).source)

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