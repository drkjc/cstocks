class Portfolio < ApplicationRecord
    has_many :orders
    belongs_to :user

#     attr_accessor :manager_id

#     def self.set_manager_id
#         User.all.where(manager: true).sample.id
#     end

    def get_current_prices
        self.orders.map do |o|
            response = Stock.find_from_api(o.symbol)
            o.share_price = response["price"]
            o.balance = response["price"].to_f * o.number_of_shares.to_f
            o.save
        end
        self.save
    end

    def return_percentage
        self.balance / (self.balance + self.holdings) === 1 ? "Invest today!" : "%#{self.balance / (self.balance + self.holdings)}"
    end

    def holdings 
        self.orders.inject(0) do |sum, o|
            if o.status == "success"
                sum + o.balance
            end
        end || 0
    end

end
