"""
Creates the url connection string for the news table for the Quiron project.
"""
function db_conn()
    return "postgresql://$(ENV["HEALTHNEWSUSER"]):$(ENV["HEALTHNEWSPASSWORD"])@$(ENV["HEALTHNEWSHOST"]):$(ENV["HEALTHNEWSPORT"])/$(ENV["HEALTHNEWSDB"])"
end