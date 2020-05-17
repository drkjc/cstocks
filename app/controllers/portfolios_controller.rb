class PortfoliosController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.portfolio
            redirect_to portfolio_path(current_user.portfolio)
        else
            @portfolio = Portfolio.new
        end
    end

    def show
        raise params.inspect
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        @portfolio.user_id = current_user.id 
        @portfolio.set_manager_id 
        @portfolio.save
        @portfolio
    end

    private 

    def portfolio_params
        params.require(:portfolio).permit(:name, :balance)
    end
end
