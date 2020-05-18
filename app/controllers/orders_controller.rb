class OrdersController < ApplicationController

    def create
        order = Order.create(order_params)
        order.balance = params[:order][:number_of_shares].to_i * params[:order][:share_price].to_i
        if order.portfolio.user_id != current_user.id 
            order.status = "success"
            order.save 
        else
            order.save
            redirect_to portfolio_path(order.portfolio_id)
        end
    end

    private 

    def order_params
        params.require(:order).permit(:symbol, :name, :number_of_shares, :share_price, :portfolio_id, :status)
    end
end
