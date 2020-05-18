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
        @portfolio = Portfolio.find(session[:portfolio_id])
        @stock = Stock.find(params[:id])
        @prices = Stock.find_from_api(@stock.symbol)
    end

    def industries 
        @industries = Stock.group_by_industry
    end

    def industry
        @industry_name = params[:format]
        @industry = Stock.all.where(industry: params[:format])
    end
    
    def search 
        @stock = Stock.search(params[:symbol])
    end

end
