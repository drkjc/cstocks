class StocksController < ApplicationController

    def show
        @stock = Stock.find(params[:id])
        @prices = Stock.find_from_api(@stock.symbol)
    end

    def industries 
        @industries = Stock.group_by_industry
    end

    def industry 
        @industry = Stock.all.where(industry: params[:format])
    end
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
