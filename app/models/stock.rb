class Stock < ApplicationRecord

    # attr_accessor :symbol
    #               :name
    #               :region
    #               :marketOpen
    #               :marketClose
    #               :timezone
    #               :currency
    #               :price

    # def initialize(args={})
    #     args.each do |name, value|
    #         attr_name = name.split(" ")[1].to_s.underscore
    #         send("#{attr_name}=", value) if respond_to?("#{attr_name}=")
    #     end
    # end

    def self.build_stock_hash(stock)
        stock_hash = {}
        stock.each do |name, value|
            attr_name = name.split(" ")[1].to_s.underscore
            attr_name == "type" ? attr_name = "industry_type" : nil
            stock_hash[attr_name] = value
        end
        stock_hash
    end

    def self.search(symbol)
        response = Request.get("?function=SYMBOL_SEARCH&keywords=#{symbol}&apikey=#{ENV['av_api_key']}")
        stock_hash = self.build_stock_hash(response["bestMatches"][0])
        @stock = Stock.new(stock_hash)
        @stock.save
        @stock
    end
end
