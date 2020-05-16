class StocksController < ApplicationController

    def index 
        @industries = Stock.group_by_industry
    end
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
