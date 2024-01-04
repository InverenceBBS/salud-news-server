"""
Collects and write dayly news articles to `storage_address`, based on the user file at `user_address`

# Arguments
- `user_address::String`: Address for the user file.
- `storage_address::String`: Address to write the news articles to.
"""
function collect_news_job(user_address, storage_address)
    user = read_user_file(user_address)
    articles = query_newsapi(user, (today()-Day(1), today()), 1000, "Date")
    formatted = format_result(articles)
    if typeof(formatted) <: DataFrame
        write_formatted(formatted, storage_address)
    end
end


