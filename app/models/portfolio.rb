class Portfolio < ApplicationRecord
    has_many :orders
    belongs_to :manager 
    belongs_to :user

    def set_manager_id
        self.manager_id = User.all.where(manager: true).sample.id
    end
end
