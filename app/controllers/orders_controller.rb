class OrdersController < ApplicationController

    def create
        order = Order.create(order_params)
        order.balance = params[:order][:number_of_shares].to_f * params[:order][:share_price].to_f
        order.save
        redirect_to portfolio_path(order.portfolio_id)
    end

    def edit
        @portfolio = Portfolio.find(params[:portfolio_id])
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        @order.status = "success"
        @order.portfolio.balance -= @order.share_price.to_f * @order.number_of_shares.to_f
        @order.portfolio.save
        @order.save
        redirect_to portfolio_path(@order.portfolio)
    end

    private 

    def order_params
        params.require(:order).permit(:symbol, :name, :number_of_shares, :share_price, :portfolio_id, :status, :balance)
    end
end
