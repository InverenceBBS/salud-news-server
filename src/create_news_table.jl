"""
Creates the table for storing news data. Host, port, user, password, dbname, tablename, are drawn from ENV. Takes no arguments.
"""

function create_news_table()
    conn = LibPQ.Connection("user=$(ENV["HEALTHNEWSUSER"]) password=$(ENV["HEALTHNEWSPASSWORD"]) host=$(ENV["HEALTHNEWSHOST"]) dbname=$(ENV["HEALTHNEWSDB"]) port=$(ENV["HEALTHNEWSPORT"])")

    create_table = "CREATE TABLE $(ENV["HEALTHNEWSTABLENAME"]) (
        uri  varchar(20) PRIMARY KEY,
        url  VARCHAR(200) ,
        time      TIME,
        dataType  varchar(10),  
        eventUri  varchar(20) , 
        shares  JSON  ,
        location  JSON , 
        wgt  Int,
        isDuplicate  Bool,  
        sim  DOUBLE precision,
        body  TEXT,  
        image  VARCHAR(200),   
        sentiment  VARCHAR(32),
        date  Date      ,
        relevance  Int  ,
        dateTimePub  TIMESTAMP WITH TIME ZONE,  
        source  JSON  ,
        lang  Varchar(5),  
        title  VARCHAR(200),  
        dateTime  TIMESTAMP WITH TIME ZONE  ,
        authors  JSON  ,
        categories  JSON 
    );"

    execute(conn, create_table)
end
