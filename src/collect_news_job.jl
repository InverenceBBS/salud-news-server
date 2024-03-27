"""
Collects and write dayly news articles to `storage_address`, based on the user file at `user_address`

# Arguments
- `user_address::String`: Address for the user file.
- `storage_address::String`: Address to write the news articles to.
"""
function collect_news_job(read_user_function; write_to_db=true)
    println("ping")
    user = read_user_function()
    println("pong")
    articles = query_newsapi(user, (today()-Day(1), today()), 1000, "Date")
    println("pang")
    formatted = format_result(articles)
    if typeof(formatted) <: DataFrame
        write_formatted(formatted)
    end
end


