class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :region
      t.string :marketOpen
      t.string :marketClose
      t.string :timezone
      t.string :currency
      t.string :price

      t.timestamps
    end
  end
end
