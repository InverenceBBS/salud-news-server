"""
Writes data to the quiron news database with the address `storage_address`.

# Arguments
- `formatted::Vector{Dict}`: Vector of dictionaries of formatted articles to fit the database structure.
- `storage_address::String`: Address of the storage database.
"""
function write_formatted(formatted, storage_address)
    addr = nothing
    if haskey(ENV, "IOMBCKUSER") * haskey(ENV, "IOMBCKPASSWORD") * haskey(ENV, "IOMBCKHOST") * haskey(ENV, "IOMBCKPORT") * haskey(ENV, "IOMBCKDB")
        addr = "postgres://$(ENV["IOMBCKUSER"]):$(ENV["IOMBCKPASSWORD"])@$(ENV["IOMBCKHOST"]):$(ENV["IOMBCKPORT"])/$(ENV["IOMBCKDB"])"
    else
        error("Missing Keys in the Environment variables")
    end

    conn = LibPQ.Connection(addr)

    LibPQ.load!(
        (
            date=formatted.date, 
            keyword=formatted.keyword,
            user_ID=formatted.user_ID,
            day_text=formatted.day_text, 
            word_cloud=JSON.json.(formatted.word_count),
            sentiment=formatted.sentiment,
            word_changes=JSON.json.(formatted.word_change),
            articles=parse_array.(formatted.articles),
            embedding=parse_array.(formatted.embedding),
            token_idx=JSON.json.(formatted.token_idx),
            aligning_matrix=parse_array.(formatted.aligning_matrix),
            anomalous_day=formatted.anomalous_day
        ),
        conn,
        "INSERT INTO salud-news (date, keyword, user_ID, day_text, word_cloud, sentiment, word_changes, articles, embedding, token_idx, aligning_matrix, anomalous_day) VALUES (\$1, \$2, \$3, \$4, \$5, \$6, \$7, \$8, \$9, \$10, \$11, \$12);"
    );

    execute(conn, "COMMIT;")
    
end

#  Variable  Type  Description  Example 
#  --------  ----  ------------------  --- 
#  time      String  
#  dataType  String  
#  eventUri  String  
#  shares  JSON  
#  location  JSON  
#  wgt  Int  
#  isDuplicate  Bool  
#  sim  Float  
#  body  String  
#  image  String  
#  sentiment  Float  
#  date  Date  
#  url  String  
#  uri  String  
#  relevance  Int  
#  dateTimePub  DateTime  
#  source  JSON  
#  lang  String  
#  title  String  
#  dateTime  DateTime  
#  authors  JSON  
#  TODO: categories  TODO  
