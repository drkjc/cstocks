class Portfolio < ApplicationRecord
    has_many :stocks
    belongs_to :manager 
    belongs_to :user
end
