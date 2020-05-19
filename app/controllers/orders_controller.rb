class OrdersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource

    def create
        order = Order.create(order_params)
        order.balance = params[:order][:number_of_shares].to_f * params[:order][:purchase_price].to_f
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
        @order.portfolio.balance -= @order.purchase_price.to_f * @order.number_of_shares.to_f
        @order.portfolio.save
        @order.save
        redirect_to portfolio_path(@order.portfolio)
    end

    def destroy
        portfolio = Portfolio.find(params[:id])
        order = Order.find(params[:id])
        if can? :crud, Order 
            order.status = "rejected"
            order.save 
            redirect_to portfolio_path(portfolio)
        else
            portfolio.orders.delete(order)
            portfolio.save 
            redirect_to portfolio_path(portfolio)
        end
    end

    private 

    def order_params
        params.require(:order).permit(:symbol, :name, :number_of_shares, :share_price, :purchase_price, :portfolio_id, :status, :balance)
    end
end
