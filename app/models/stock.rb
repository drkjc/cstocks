class Stock < ApplicationRecord

    @endpoint = ENV['av_api_key']

    def self.alter_api_keys(response)
        stock = {}
        response.each do |k, v|
            if v.include?('.')
                stock[k.sub(/\d.. /, '')] = v.slice(/\-\d.\d\d|\d\d.\d\d|\d.\d\d/)
            else
                stock[k.sub(/\d.. /, '')] = v
            end 
        end
        stock
    end

    def self.group_by_industry 
        industries = {}
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
        response = Request.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=#{@endpoint}")
        alter_api_keys(response["Global Quote"])
    end

    def self.search(symbol)
        # response = Request.get("?function=SYMBOL_SEARCH&keywords=#{symbol}&apikey=#{@endpoint}")
        # @stock = Stock.new(stock_hash)
        # @stock.save
        # @stock
    end
end
