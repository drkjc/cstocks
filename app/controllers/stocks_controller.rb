class StocksController < ApplicationController
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
