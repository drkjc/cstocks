class StocksController < ApplicationController

    def industries 
        @industries = Stock.group_by_industry
    end

    def industry 
        raise params.inspect
    end
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
