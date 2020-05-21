class Stock < ApplicationRecord

    @endpoint = ENV['av_api_key']

    #rembmer to remove stocks w/ weird characters in their symbols

    def self.alter_api_keys(response)
        stock = {}
        response.each do |k, v|
            stock[k.sub(/\d.. /, '')] = v
        end
        stock
    end

    def self.group_by_industry 
        industries = {}
        #groups all stocks by industries to be displayed
        Stock.all.each do |stock|
            if !industries[stock[:industry]]
                industries[stock[:industry]] = []
            else 
                industries[stock[:industry]] << stock unless industries[stock[:industry]].include?(stock)
            end
        end
        industries
    end

    def self.find_from_api(symbol) 
        #uses symbol to return stock data from api
        response = Request.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=#{@endpoint}")
        if response["Note"]
            "API LIMIT REACHED"
        else
            #alters api keys so they can be parsed
            alter_api_keys(response["Global Quote"])
        end
    end

    def self.search(symbol)
        # response = Request.get("?function=SYMBOL_SEARCH&keywords=#{symbol}&apikey=#{@endpoint}")
        # @stock = Stock.new(stock_hash)
        # @stock.save
        # @stock
    end
end
