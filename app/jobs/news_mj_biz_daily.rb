class NewsMjBizDaily < ActiveJob::Base
    include SuckerPunch::Job
    
    def perform()
        logger.info "MjBizDaily background job is running"
        addArticlesFromMJCananbizDailyOne()
        addArticlesFromMJCananbizDailyTwo()
        addArticlesFromMJCananbizDailyThree()
        addArticlesFromMJCananbizDailyFour()
    end
    
    def addArticlesFromMJCananbizDailyOne()
        @searches = ['Cannabis', 'Hemp', "Pot", "Marijuana", "Ganja", "Vaporizer", "Vape", "Hydroponics", "Legalization", "Decriminalize"] 
        performSearchesAndAddArticles(@searches)
    end 

    def addArticlesFromMJCananbizDailyTwo()
        @searches = ['Recreational', 'Medical', "Medicinal", "Cbd", "Terpene", "Tax", "Banking", "Cannabusiness", "Cannabiz", "DEA"] 
        performSearchesAndAddArticles(@searches)
    end 

    def addArticlesFromMJCananbizDailyThree()
        @searches = ['FDA', 'Dispensary', "Greenhouse", "Strain", "Indoor", "Outdoor", "Headshop", "Bong", "Dab", "Dabbing"] 
        performSearchesAndAddArticles(@searches)
    end
    
    def addArticlesFromMJCananbizDailyFour()
        @searches = ['Shatter', 'Wax', "Butter", "Concentrate", "Oil", "Charlottes web", "Delivery", "Doctors", "Edibles", "Topicals"] 
        performSearchesAndAddArticles(@searches)
    end    

    def performSearchesAndAddArticles(searches)
            
        #FOR MATCHING STATES, CATEGORIES, AND SOURCE


        searches.each do |term|
        searchResponse = HTTParty.get('https://api.import.io/store/connector/4f495328-439c-47ce-add7-89227b00f9a1/_query?input=query:' + 
                            term + 
                            '&&_apikey=62b5b9a8fa284895a14abe58fa8046fff4e9d64ca401cc947ebe55b4fb24b7669b8732cac6bac15ab112b0f4c804a708547b691e124383e2b81155c5f3b14e786751bc908bdbe1913379a890d9db9793') 
        
            if searchResponse.body != nil && searchResponse.body != '' && JSON.parse(searchResponse.body)['results'] != nil && JSON.parse(searchResponse.body)['results'] != ''
                searchBody = JSON.parse(searchResponse.body)
                searchBody["results"].each do |result|        
                    
                    abstract = ''
                    if result['abstract'].present? && result['abstract'].length > 25 
                        abstract = result["abstract"]
                    else 
                        abstract = result["para2"]
                    end
                    
                    image = ''
                    indResponse = HTTParty.get('https://api.import.io/store/connector/67786279-6539-4c7b-9770-1d35c24e7969/_query?input=query:' + 
                                    URI::encode(result["headline"]) + 
                                    '&&_apikey=62b5b9a8fa284895a14abe58fa8046fff4e9d64ca401cc947ebe55b4fb24b7669b8732cac6bac15ab112b0f4c804a708547b691e124383e2b81155c5f3b14e786751bc908bdbe1913379a890d9db9793')
                    indBody = JSON.parse(indResponse.body)
                    if indBody["results"].present? 
                        indBody["results"].each do |indResult| 
                            image = indResult['image']  
                        end
                    end
                    
                    
                    #CREATE ARTICLE
                    article = Article.create(:title => result["headline"], :abstract => abstract, :image => image, :date => DateTime.parse(result["date"]), :web_url => result["pageurl"])
                    
                end 
            end
        end
    end 
    
    
end