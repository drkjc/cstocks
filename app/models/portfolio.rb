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
            o.save
        end
        self.save
    end

end
