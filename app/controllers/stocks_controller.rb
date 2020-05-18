class StocksController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    load_and_authorize_resource :except => [:index]

    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = "Access denied."
        redirect_to portfolio_path(params[:portfolio_id])
    end

    def index 
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
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
