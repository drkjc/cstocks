class PortfoliosController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.portfolio
            redirect_to portfolio_path(current_user.portfolio)
        else
            @portfolio = Portfolio.new
        end
    end
end
