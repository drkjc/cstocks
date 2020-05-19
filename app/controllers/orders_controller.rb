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
        @stock = Stock.find_by(symbol: @order.symbol)
    end

    def update
        @order = Order.find(params[:id])
        if @order.status == "pending"
            @order.update(order_params)
            @order.portfolio.current_balance -= @order.purchase_price.to_f * @order.number_of_shares.to_f
            @order.portfolio.save
            @order.save
            redirect_to portfolio_path(@order.portfolio)
        end
    end

    def destroy
        portfolio = Portfolio.find(params[:portfolio_id])
        order = Order.find(params[:id])
        if can? :crud, Order 
            if order.status == "pending"
                order.status = "rejected"
                order.save 
                redirect_to portfolio_path(portfolio)
            elsif order.status == "success"
                portfolio.current_balance += order.share_price.to_f * order.number_of_shares.to_f 
                order.status = "sold"
                order.share_price = 0
                order.number_of_shares = 0
                order.save
                portfolio.save
            end
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
