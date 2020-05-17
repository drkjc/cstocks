class Order < ApplicationRecord
    has_many :stocks
    belongs_to :portfolio
end
