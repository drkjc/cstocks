class StocksController < ApplicationController
    
    def search 
        @stocks = Stock.search(params[:symbol])
    end

end
