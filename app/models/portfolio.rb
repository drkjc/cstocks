class Portfolio < ApplicationRecord
    has_many :orders
    belongs_to :user

#     attr_accessor :manager_id

#     def self.set_manager_id
#         User.all.where(manager: true).sample.id
#     end

    def get_current_prices
        current_price_hash = {}
        self.orders.each do |o|
            response = Stock.find_from_api(o.symbol)
            binding.pry
            current_hash_price
        end
    end
end
