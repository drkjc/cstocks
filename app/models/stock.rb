class Stock < ApplicationRecord

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

    def self.search(symbol)
        response = Request.get("?function=SYMBOL_SEARCH&keywords=#{symbol}&apikey=#{ENV['av_api_key']}")
        
        @stock = Stock.new(stock_hash)
        @stock.save
        @stock
    end
end
