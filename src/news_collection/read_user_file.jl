"""
Reads the user file at `user_address` and returns a dictionary with that information.

NOTE: This function will likely change as we develop infrastructure for Salud.

# Arguments
- `user_address::Stirng`: Address to read the user file at.
"""
function read_user_file_location()

    # news_kws = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_kws")).body)
    # json = JSON.parse(news_kws)
    # kws = getindex.(json, ["value"])

    # news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    # json = JSON.parse(news_concepts)
    # concepts = getindex.(json, ["value"])


    kws = ["Iberdrola","Endesa","Naturgy","Total Energies","Repsol","Holaluz","Fenie Energía","Podo","Factor Energía","Plenitude","Nexus Energía","Ovo energy","Lucera","Gesternova","Gana","Som","Audax","Octopus","El Corte Inglés Energía","Mas Móvil","Energy Go","Comercialización de Luz","Gas","Mobility","Solar","Hidrógeno"]
    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>nothing, 
                "languages"=>nothing,
                "concepts"=>nothing,
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

    # news_kws = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_kws")).body)
    # json = JSON.parse(news_kws)
    # kws = getindex.(json, ["value"])

    # news_concepts = String(HTTP.get(string(ENV["HEALTHMETADATAADDR"],"/news_concept")).body)
    # json = JSON.parse(news_concepts)
    # concepts = getindex.(json, ["value"])
    kws = ["Iberdrola","Endesa","Naturgy","Total Energies","Repsol","Holaluz","Fenie Energía","Podo","Factor Energía","Plenitude","Nexus Energía","Ovo energy","Lucera","Gesternova","Gana","Som","Audax","Octopus","El Corte Inglés Energía","Mas Móvil","Energy Go","Comercialización de Luz","Gas","Mobility","Solar","Hidrógeno"]
    user = Dict("id"=>999, 
            "keywords"=>Dict(
                "keywords"=> kws, 
                "locations"=>nothing, 
                "languages"=>nothing,
                "concepts"=>nothing,
                "sources"=>["elpais.com", "elespanol.com", "eldiario.es", "elmundo.com", "larazon.es", "elconfidencial.com", "abc.es", "expansion.com","cincodias.elpais.com","eleconomista.es","elpais.com","elmundo.es","elconfidencial.com","lavanguardia.com","elperiodicodelaenergia.com","movilidadelectrica.com","material-electrico.cdecomunicacion.es","aedive.es","material-electrico.cdecomunicacion.es","futurenergyweb.es","casadomo.com","autoconsumoaldetalle.es","ocu.org","facua.org","rastreator.com","eafo.eu","anfac.com","idae.es","fegeca.com","anese.es","afec.es","enertic.org","amiasociacion.es","aefyt.es","aedive.es","ambientum.com","energetica21.com","energias-renovables.com","suelosolar.com","pv-magazine.com","elperiodicodelaenergia.com","smartgridsinfo.es","erasolar.es","pv-magazine.es","socialinvestor.es","movilidadelectrica.com","elconfidencial.com","vozpopuli.com","elindependiente.com","lainformacion.com","elespanol.com","okdiario.com","hispanidad.com","lainformacion.com","elconfidencialdigital.com","elpais.com","elmundo.es","abc.es","lavanguardia.es","elperiodico.com","larazon.es","expansion.com","cincodias.com","eleconomista.es","bolsamania.com","intereconomia.com","estrategiasdeinversion"]
            ))
end