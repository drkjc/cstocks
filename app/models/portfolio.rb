class Portfolio < ApplicationRecord
    has_many :orders
    belongs_to :user

#     attr_accessor :manager_id

#     def self.set_manager_id
#         User.all.where(manager: true).sample.id
#     end

    def get_current_prices
        # grabs the users held stocks and makes api requests for to get current prices for each one
        self.orders.map do |o|
            response = Stock.find_from_api(o.symbol)
            o.share_price = response["price"]
            o.balance = response["price"].to_f * o.number_of_shares.to_f
            o.save
        end
        self.save
    end

    def return_percentage
        # return total portfolio return percentage
        if self.current_balance == self.balance 
            "Invest today!"
        elsif self.holdings.to_f + self.current_balance.to_f < self.balance 
             (1.00 - (self.current_balance.to_f + self.holdings.to_f) / self.balance.to_f) * 100
        else
            (self.current_balance.to_f + self.holdings.to_f) / self.balance.to_f
        end
    end

    def direction
        # returns up or down to signal which way the portfolio is going
        self.current_balance + self.holdings > self.balance ? "Up" : "Down"
    end

    def holdings 
        # return total holdings for each stock combined
        # .inspect was returning nil?
        sum = 0
        self.orders.each do |o|
            if o.status == "success" || o.status == "pending sale"
                sum += o.balance.to_f
            end
        end
        sum 
    end

end
