class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :industry_type
      t.string :region
      t.string :market_open
      t.string :market_close
      t.string :timezone
      t.string :currency
      t.string :price
      t.string :match_score

      t.timestamps
    end
  end
end
