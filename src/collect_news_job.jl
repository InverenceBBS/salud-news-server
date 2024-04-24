"""
Collects and write dayly news articles to `storage_address`, based on the user file at `user_address`

# Arguments
- `user_address::String`: Address for the user file.
- `storage_address::String`: Address to write the news articles to.
"""
function collect_news_job(read_user_function; write_to_db=true)
    user = read_user_function()
    articles = query_newsapi(user, (Date("2024-03-30"), Date("2024-04-24")), 10000, "Date")
    formatted = format_result(articles)
    if write_to_db
        if typeof(formatted) <: DataFrame
            write_formatted(formatted)
        end
    else
        return formatted
    end
end


