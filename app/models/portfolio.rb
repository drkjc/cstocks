class Portfolio < ApplicationRecord
    has_many :orders
    belongs_to :manager 
    belongs_to :user
end
