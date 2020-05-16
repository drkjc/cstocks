class StocksController < ApplicationController

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
