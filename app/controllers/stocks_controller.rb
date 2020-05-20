class StocksController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    load_and_authorize_resource :except => [:index]

    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = "Access denied."
        redirect_to portfolio_path(params[:portfolio_id])
    end

    def index 
        if current_user
            stock = Stock.find_by(symbol: params[:slug])
            portfolio = Portfolio.find(params[:portfolio_id])
            redirect_to portfolio_stock_path(portfolio_id: portfolio.id, id: stock.id)
        else
            @stocks = Stock.all 
        end
    end

    def filter
        @stocks = Stock.all
    end

    def show
        @portfolio = Portfolio.find(params[:portfolio_id])
        @stock = Stock.find(params[:id])
        @prices = Stock.find_from_api(@stock.symbol)
    end

    def industries 
        @portfolio = Portfolio.find(params[:id])
        @industries = Stock.group_by_industry
    end

    def industry
        @portfolio = Portfolio.find(params[:portfolio_id])
        @industry_name = params[:slug]
        @industry = Stock.all.where(industry: params[:slug])
    end

    def complete
        # TODO mark selected tasks as complete
        raise params.inspect
        stock_ids = params[:stock][:id]
        Stock.all.each do |stock|
            if stock_ids.include?(stock.id.to_s)
                stock.available = true
                stock.save
            end
        end
        redirect_to portfolios_path
    end
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
