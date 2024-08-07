if ! git config remote.dokku.url > /dev/null; then
    git remote add dokku dokku@dokku.news_collection:news-collection
    ssh dokku.news_collection "dokku buildpacks:add news-collection https://github.com/Baffelan/heroku-buildpack-julia.git;"
    #ssh dokku.slack "echo "${INTERACTION_PRIV_IP} ${INTERACTION_URL}" | sudo tee -a /etc/hosts"
fi




git push dokku main

ssh dokku.news_collection "dokku domains:set news-collection news-collection.llull-inverence.com;"
ssh dokku.news_collection "dokku letsencrypt:set news-collection email ${EMAIL_ADDR};"
ssh dokku.news_collection "dokku letsencrypt:enable news-collection;"
