# main logic for endpoint
@swagger """
/news/query:
  get:
    description: Return article collection as a json
    parameters:
      - name: keyword
        in: query
        required: true
        description: word to search in articles body and title 
        schema:
          type : string
      - name: language
        in: query
        required: false
        description: 3 letter abreviation of the language of the articles e.g. (eng, spa...). Default is `nothing` (no filter) 
        schema:
          type : string
      - name: location
        in: query
        required: false
        description: source location, default is `nothing` (no filter). Should be compatible with [wiki locations](en.wikipedia.org/wiki/[location])
        schema:
          type : string
      - name: maxarticles
        in: query
        required: false
        description: maximum number of articles to return, default is 5 
        schema:
          type : integer
      - name: date
        in: query
        required: false
        description: date of publication of articles (formatted as 'y2023m01d15' as for data sample), default is yesterday (today()-Day(1)). 
        schema:
          type : string
          format: date
          pattern: '^y\\d{4}m\\d{2}d\\d{2}\$'
      - name: previousdays
        in: query
        required: false
        description: extend the publication date window to x days before 'date', default is 0.
        schema:
          type : integer
      - name: followingdays
        in: query
        required: false
        description: extend the publication date window to x days after the 'date', default is 0. 
        schema:
          type : integer
      - name: sortby
        in: query
        required: false
        description: value the returned articles are sorted by, default is "SocialScore". Has options, date, rel, sourceImportance, sourceAlexaGlobalRank, sourceAlexaCountryRank, socialScore, facebookShares.
        schema:
          type : string
    responses:
      '200':
        description: Successfully returned a list of articles.
"""
@get "/news/query" function(req::HTTP.Request)
    # extract & return the query params from the request object
    qpams = queryparams(req)
    keyword = get(qpams, "keyword", nothing)
    lang = get(qpams, "language", nothing)

    loc = get(qpams, "location", nothing) 
    
    num_articles = tryparse(Int,get(qpams, "maxarticles", "5"))

    sortby = get(qpams, "sortby", nothing) 
    
    # this satisfies the date format provided as example
    # we WILL want to make this more robust
    # (i.e. trying various dateformats before giving up)
    raw_date = get(qpams, "date", nothing)
    query_date = isnothing(raw_date) ? today()-Day(1) : Date(raw_date,dateformat"\yy\mm\dd")
    
    # we expect the number of previous days and following days to be parsed to Integer
    # if not, we get a `nothing`
    previousdays = tryparse(Int,get(qpams, "previousdays", "0"))
    followingdays = tryparse(Int,get(qpams, "followingdays", "0"))

    user = Dict(
        "keywords"=>Dict(
            "keywords"=>[keyword],
            "languages"=>lang,
            "locations"=>"https://en.wikipedia.org/wiki/$(loc)" # we use newsapi func that takes wikipedia link to get richer location information. `loc` should be: "New_Zealand", "Spain", etc.
        )
    )

    # add logic for
    dates = (query_date - Day(previousdays), query_date + Day(followingdays))

    articles = query_newsapi(user, dates, num_articles, sortby)

    return articles
end
