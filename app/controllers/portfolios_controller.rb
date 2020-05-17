class PortfoliosController < ApplicationController
    before_action :authenticate_user!

    def index
        if !current_user.portfolios.empty?
            redirect_to list_path
        else
            @portfolio = Portfolio.new
        end
    end

    def list
        @portfolios = current_user.portfolios
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        raise @portfolio.inspect
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        @portfolio.user_id = current_user.id 
        @portfolio.manager_id = Portfolio.set_manager_id 
        @portfolio.save
        binding.pry
        redirect_to portfolio_path(@portfolio)
    end

    private 

    def portfolio_params
        params.require(:portfolio).permit(:name, :balance)
    end
end
