class PortfoliosController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
        if current_user.portfolios.empty? && !current_user.manager_role
            redirect_to new_portfolio_path
        else
           @portfolios = current_user.portfolios
        end
    end

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        @portfolio.user_id = current_user.id 
        @portfolio.save
        redirect_to portfolio_path(@portfolio)
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        set_portfolio(@portfolio.id)
    end

    private 

    def portfolio_params
        params.require(:portfolio).permit(:name, :balance)
    end
end
