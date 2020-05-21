class Order < ApplicationRecord
    has_many :stocks
    belongs_to :portfolio

    def share_value
        #calculate share value for each stock
        self.number_of_shares * self.share_price.to_f
    end

    def stock_name
        #display stock name
        self.name.gsub('&#39;', '\'')
    end

    def sell
        if self.status == "success"
            true 
        elsif self.status == "rejected"
            false
        else
            "pending"
        end
    end

    def two_dec
        # changes percentage to be to 2 decimal places
        '%.2g'
    end

    def order_return_percentage
        if self.purchase_price.to_f / self.share_price.to_f < 1
            "Up: #{ self.two_dec % (self.purchase_price.to_f / self.share_price.to_f)}%"
        elsif self.purchase_price.to_f / self.share_price.to_f > 1
            "Down: #{ self.two_dec % (self.purchase_price.to_f / self.share_price.to_f)}%"
        else
            "Holding Even"
        end
    end

end
