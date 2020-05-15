class Stock < ApplicationRecord

    attr_accessor :symbol
                  :name
                  :region
                  :marketOpen
                  :marketClose
                  :timezone
                  :currency
                  :price

    def initialize(args={})
        args.each do |name, value|
            attr_name = name.to_s.underscore 
            send("#{attr_name}=", value) if respond_to?("#{attr_name}=")
        end
    end

    def self.search(symbol)
        response = Faraday.new("https://www.alphavantage.co/query?function=#{symbol}&keywords=BA&apikey=#{ENV['av_api_key']}")
        byebug
    end
end
